import 'dart:io';
import 'dart:convert';
import 'dart:math';

const io = "2";

Future getLines() async {
  return await new File("i" + io + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final List<String> lines = await getLines();
  final n = int.parse(lines[0]);
  final m = sqrt(n).floor();

  final list = List.generate(m, (i) => (n / (i + 1)).floor());
  print(list.reduce((a, b) => a + b) * 2 - pow(m, 2));
}