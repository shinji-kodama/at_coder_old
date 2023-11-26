import 'dart:io';
import 'dart:convert';

const io = "1";

Future getLines() async {
  return await new File("i" + io + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final List<String> lines = await getLines();
  print(judge(lines[0].split('o')) ? "Yes" : "No");
}

bool judge(List<String> list) {
  return list.asMap().entries.every((entry) {
    final i = entry.key;
    final v = entry.value;
    return (i == 0 || i == list.length - 1) ? 0 <= v.length && v.length <= 2 : v.length == 2;
  });
}
