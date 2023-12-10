import 'package:hive/hive.dart';

class HiveRep1{
  final Box _box = Hive.box("puzzle1");
  List<int> arr = List<int>.generate(16, (index) => index)..shuffle();

  saveStep(int step){
    _box.put("steps", step);
  }

  getStep() => _box.get("steps",defaultValue: 0);

  saveList(List<int> list){
    _box.put("list", list);
  }

  getList() {
    do{
      arr..shuffle();
    }while(!isSolvable(arr));

    return _box.get("list",defaultValue: arr);
  }

}

bool isSolvable(List<int> numbers) {
  int invCount = 0;
  for (int i = 0; i < 16; i++) {
    for (int j = i + 1; j < 16; j++){
      if (numbers[j] != 16 && numbers[i] > numbers[j]) invCount++;
    }
  }
  return (invCount % 2 == 0);
}