import 'dart:io';
import 'dart:convert';

const io = "1";

Future getLines() async {
  return await new File("i" + io + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final List<String> lines = await getLines();
  final str = "AGC" + convertTimesHeld(lines[0]).padLeft(3, "0");
  print(str);
}

String convertTimesHeld(String str) {
  final num = int.parse(str);
  return (num >= 42 ? (num + 1) : num).toString();
}
