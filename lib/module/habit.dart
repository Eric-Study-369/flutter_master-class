import 'package:isar/isar.dart';

part 'habit.g.dart';

@Collection()
class Habite {
  Id id = Isar.autoIncrement;

  //habite name
  late String name;

  //complete days
  List<DateTime> completDay = [
    //DateTime(year, month , day),
    // DaateTime(2024, 1, 1),
    // DateTime(2024, 1, 2),
  ];
}
