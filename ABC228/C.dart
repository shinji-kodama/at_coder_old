import 'dart:io';
import 'dart:convert';

const no = "229";
const io = "C1";

Future getLines() async {
  return await new File("./ABC${no}/io/${io}.txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final data = separate(await getLines());
  final boolList = List.filled(data[1].length, false);
  print(persons(data[1], data[0][1] - 1, boolList));
}

List<List<int>> separate(List<String> data) {
  return data.map((el) => el.split(' ').map(int.parse).toList()).toList();
}

int persons(List<int> list, int person, List<bool> bools, [int count = 0]) {
  if (bools[person]) return count;
  bools[person] = true;
  count++;
  return persons(list, list[person] - 1, bools, count);
}
