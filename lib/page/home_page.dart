import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/components/my_drawer.dart';
import 'package:flutter_tutorial/components/my_habit_tile.dart';
import 'package:flutter_tutorial/components/my_heaat_map.dart';
import 'package:flutter_tutorial/database/habit_database.dart';
import 'package:flutter_tutorial/module/habit.dart';
import 'package:flutter_tutorial/util/habit_utile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HabitDatabase>(context, listen: false).readHabit();
    super.initState();
  }

  // text controller
  final TextEditingController textController = TextEditingController();

  // create a new habit
  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Create new habit",
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              // get the new habit name
              String newHabitName = textController.text;
              //save to db
              context.read<HabitDatabase>().addHabit(newHabitName);

              // pop box
              Navigator.pop(context);

              // clear controller
              textController.clear();
            },
            child: const Text('Save'),
          ),
          MaterialButton(
            onPressed: () {
              // pop box
              Navigator.pop(context);

              // clear controller
              textController.clear();
            },
            child: const Text("Delete"),
          )
        ],
      ),
    );
  }

  // check habite on off
  void checkHabitOnOff(bool? value, Habite habit) {
    // update habit completetion status
    if (value != null) {
      context.read<HabitDatabase>().updateHabitComplete(habit.id, value);
    }
  }

  //edite habit box
  void editHabitBox(Habite habit) {
    textController.text = habit.name;

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(controller: textController),
              actions: [
                MaterialButton(
                  onPressed: () {
                    // get the new habit name
                    String newHabitName = textController.text;
                    //save to db
                    context
                        .read<HabitDatabase>()
                        .updateHabitName(habit.id, newHabitName);

                    // pop box
                    Navigator.pop(context);

                    // clear controller
                    textController.clear();
                  },
                  child: const Text('Save'),
                ),
                MaterialButton(
                  onPressed: () {
                    // pop box
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                )
              ],
            ));
  }

  // delete habit box
  void deleteHabite(Habite habit) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Are you sure to delete"),
              actions: [
                MaterialButton(
                  onPressed: () {
                    context.read<HabitDatabase>().deleteHabit(habit.id);

                    // pop box
                    Navigator.pop(context);
                  },
                  child: const Text('Delete'),
                ),
                MaterialButton(
                  onPressed: () {
                    // pop box
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewHabit,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          // Heatmap
          _buildHabitMap(),

          //habitlist
          _buildHabitList(),
        ],
      ),
    );
  }

  Widget _buildHabitMap() {
    final habitDatabase = context.watch<HabitDatabase>();
    List<Habite> currentHabit = habitDatabase.currentHabit;

    return FutureBuilder<DateTime?>(
        future: habitDatabase.getFristLuanchDate(),
        builder: (context, snapshort) {
          if (snapshort.hasData) {
            return MyHeatMap(
              satrtDate: snapshort.data!,
              datasets: prepHeatMapDatabase(currentHabit),
            );
          } else {
            return Container();
          }
        });
  }

  // build habit list
  Widget _buildHabitList() {
    // habit db
    final habitDaabase = context.watch<HabitDatabase>();

    // current habits
    List<Habite> currenthabits = habitDaabase.currentHabit;

    return ListView.builder(
      itemCount: currenthabits.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final habit = currenthabits[index];

        bool isCompeteToday = isHabitCompletedToday(habit.completDay);

        return MyHabitTile(
          text: habit.name,
          isCompleted: isCompeteToday,
          onChange: (value) => checkHabitOnOff(value, habit),
          editHabit: (context) => editHabitBox(habit),
          deleteHabit: (context) => deleteHabite(habit),
        );
      },
    );
  }
}
