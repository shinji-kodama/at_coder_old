import 'dart:io';
import 'dart:convert';

const pc = "229";
const io = "C3";

Future getLines() async {
  return await new File("./ABC${pc}/io/${io}.txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final data = await getLines();
  final weight = int.parse(data[0].split(' ')[1]);
  final ordered = reorder(data.sublist(1));
  final tasty = addCheese(ordered, weight);

  print(tasty);
}

List<List<int>> reorder(List<String> data) {
  final ints = data.map((el) => el.split(' ').map(int.parse).toList()).toList();
  ints.sort((a, b) => b[0] - a[0]);
  return ints;
}

int addCheese(List<List<int>> list, int w) {
  int gramsMore = w;
  return list.fold<int>(0, (ac, el) {
    if (gramsMore <= 0) return ac;
    final a = ac + (gramsMore >= el[1] ? el[1] : gramsMore) * el[0];
    gramsMore = gramsMore - el[1];
    return a;
  });
}
