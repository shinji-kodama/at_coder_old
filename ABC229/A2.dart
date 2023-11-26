import 'dart:io';
import 'dart:convert';

const io = "1";

Future getLines() async {
  return await new File("./i" + io + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final List<String> lines = await getLines();
  const d = [[1, 0], [0, 1], [-1, 0], [0, -1]];
  print(checkNext(lines.map((row) => row.split('')).toList(), d) ? 'Yes' : 'No');
}

bool checkNext(List<List<String>> list, List<List<int>> d) {
  return list.asMap().entries.every((i) => hasNextBlackAll(list, d, i));
}

bool hasNextBlackAll(List<List<String>> list, List<List<int>> direction, MapEntry i) {
  return i.value.asMap().entries.every((j) => isOK(list, direction, i.key, j.key));
}

bool isOK(List<List<String>> list, List<List<int>> direction, int i, int j) {
  return list[i][j] == '#' ? hasNextBlack(list, direction, i, j) : true;
}

bool hasNextBlack(List<List<String>> list, List<List<int>> direction, int i, int j) {
  return direction.any((el) => isBlack(i + el[0], j + el[1], list));
}

bool isBlack(int i, int j, List<List<String>> list) => isInGrid(i, j) && list[i][j] == '#';

bool isInGrid(int i, int j) => 0 <= i && i <= 1 && 0 <= j && j <= 1;
