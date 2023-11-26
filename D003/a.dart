import 'dart:io';
import 'dart:convert';

const io = "1";

Future getLines() async {
  return await new File("./io/i" + io + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin
  //   .transform(utf8.decoder)
  //   .transform(const LineSplitter())
  //   .map((_)=>_)
  //   .toList();
}

void main() async {
  final List<String> lines = await getLines();
  print(getResult(lines[0]));
}

String getResult(String n) {
  List<int> numbers = List.generate(9, (i) => int.parse(n) * (i + 1));
  return numbers.join(" ");
}
