import "dart:io";
import 'dart:convert';

const io = "2";

Future getLines() async {
  return await new File("./i" + io + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((String _) => _.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(new LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final lines = await getLines();
  print(lines);
}
