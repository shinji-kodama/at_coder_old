import 'dart:io';
import 'dart:convert';

const no = "227";
const io = "A3";

Future getLines() async {
  return await new File("./ABC${no}/io/${io}.txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final data = await getLines();
  final list = data[0].split(' ').map(int.parse).toList();
  print((list[1] + list[2] - 2) % list[0] + 1);
}
