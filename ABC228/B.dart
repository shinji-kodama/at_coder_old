import 'dart:io';
import 'dart:convert';

const no = "228";
const io = "B1";

Future getLines() async {
  return await new File("./ABC${no}/io/${io}.txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final data = separate(await getLines());
  print(persons(data[1], data[0][1] - 1));
}

List<List<int>> separate(List<String> data) {
  return data.map((el) => el.split(' ').map(int.parse).toList()).toList();
}

int persons(List<int> list, int person) {
  final boolList = List.filled(list.length, false);
  int count = 0;

  while (!boolList[person]) {
    boolList[person] = true;
    person = list[person] - 1;
    count++;
  }

  return count;
}
