import 'dart:io';
import 'dart:convert';

const io = 2;

Future getLines() async {
  return await new File("./i" + io.toString() + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final List<String> lines = await getLines();
  final aim = int.parse(lines[0].split(' ')[1]);
  final bags = lines.sublist(1).map((el) {
    return el.split(' ').asMap().entries.fold<List<int>>([], (a, b) {
      if (b.key >= 1) a.add(int.parse(b.value));
      return a;
    });
  }).toList();

  print(count(listPtn(bags), aim));
}

List<List<int>> listPtn(List<List<int>> bags) {
  if (bags.length == 1) return bags[0].map((el) => [el]).toList();
  return bags[0].expand((e0) {
    return listPtn(bags.sublist(1)).map((e1) => [e0] + e1).toList();
  }).toList();
}

int count(List<List<int>> list, int aim) {
  return list.where((el) => el.fold<int>(1, (a, b) => a * b) == aim).length;
}
