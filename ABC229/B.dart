import 'dart:io';
import 'dart:convert';

const pc = "229";
const io = "B1";

Future getLines() async {
  return await new File("./ABC${pc}/io/${io}.txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final data = await getLines();
  final bool hasDigitChange = checkEachDigit(separate(data));
  print(hasDigitChange ? "Hard" : "Easy");
}

List<List<int>> separate(List<String> data) {
  return data[0].split(' ').map((el) {
    return el.split('').map(int.parse).toList().reversed.toList();
  }).toList();
}

checkEachDigit(List<List<int>> ints) {
  return ints[0].asMap().entries.any((entry) {
    return entry.value + ints[1][entry.key] >= 10;
  });
}
