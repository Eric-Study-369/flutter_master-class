import 'package:flutter/foundation.dart';
import 'package:flutter_tutorial/module/app_setting.dart';
import 'package:flutter_tutorial/module/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;

  // Database initialization
  static Future<void> initialize() async {
    final dir = await getApplicationCacheDirectory();
    isar =
        await Isar.open([HabiteSchema, AppSettingSchema], directory: dir.path);
  }

  //save First launch Date of app startup (for heatmap)
  Future<void> saveFirstLaunchDate() async {
    final existingSetting = await isar.appSettings.where().findFirst();
    if (existingSetting == null) {
      final setting = AppSetting()..firstLaunchDate = DateTime.now();
      await isar.writeTxn(() => isar.appSettings.put(setting));
    }
  }

  //get first date of app startup (for heatmap)
  Future<DateTime?> getFristLuanchDate() async {
    final setting = await isar.appSettings.where().findFirst();
    return setting?.firstLaunchDate;
  }

  // C R U D X O P E R A T I O N S
  // list habit
  final List<Habite> currentHabit = [];

  //create - add a new habit
  Future<void> addHabit(String habitName) async {
    // create a new habit
    final newHabit = Habite()..name = habitName;

    // save to db
    await isar.writeTxn(() => isar.habites.put(newHabit));

    // re-read from db
    readHabit();
  }

  // R E A D - read save habits to db
  Future<void> readHabit() async {
    // fetch all habit from db
    List<Habite> fetchHabits = await isar.habites.where().findAll();

    // give to current habits
    currentHabit.clear();
    currentHabit.addAll(fetchHabits);

    //update UI
    notifyListeners();
  }

  // U D A T E - check habit on and off
  Future<void> updateHabitComplete(int id, bool isComplete) async {
    // find the specific habit
    final habit = await isar.habites.get(id);

    // update complete status
    if (habit != null) {
      await isar.writeTxn(() async {
        // if habit is complete - add the current date to the completedDays list
        if (isComplete && !habit.completDay.contains(DateTime.now())) {
          // today
          final today = DateTime.now();

          //add the current if it's not already in the list
          habit.completDay.add(
            DateTime(
              today.year,
              today.month,
              today.day,
            ),
          );
        }
        // if habit is Not complete -> remove the current date from the list
        else {
          // remove the current date if the habit is marked ad not completed
          habit.completDay.removeWhere(
            (date) =>
                date.year == DateTime.now().year &&
                date.month == DateTime.now().month &&
                date.day == DateTime.now().day,
          );
        }
        // save the update habits back to the db
        await isar.habites.put(habit);
      });
    }
    // re-read from db
    readHabit();
  }

  // U D A T E - edite habit name
  Future<void> updateHabitName(int id, String newName) async {
    // find the specific habit
    final habit = await isar.habites.get(id);

    // update habit name
    if (habit != null) {
      // update name
      await isar.writeTxn(() async {
        habit.name = newName;
        //save updated habit back to db
        await isar.habites.put(habit);
      });
    }
    // re-read from db
  }

  // D E L E T E - delete habit
  Future<void> deleteHabit(int id) async {
    // perform the database
    await isar.writeTxn(() async {
      await isar.habites.delete(id);
    });

    //re-read from db
    readHabit();
  }
}
