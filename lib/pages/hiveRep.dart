import 'package:hive/hive.dart';

class HiveRep{
 final Box _box = Hive.box("puzzle");

 saveStep(int step){
   _box.put("steps", step);
 }

 getStep() => _box.get("steps",defaultValue: 0);

 saveList(List<int> list){
   _box.put("list", list);
 }

 getList() => _box.get("list",defaultValue: List<int>.generate(9, (index) => index)..shuffle());

}