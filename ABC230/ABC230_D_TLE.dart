import 'dart:io';
import 'dart:convert';

const io = "3";

Future getLines() async {
  return await new File("i" + io + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final List<String> lines = await getLines();
  final w = int.parse(lines[0].split(' ')[1]);
  final walls = lines.sublist(1).map((el) => el.split(' ').map(int.parse).toList()).toList();
  final times = checkInAscending(walls, w);
  print(times);
}

List<List<bool>> breakWall(List<List<int>> list, int w) {
  return list.expand((els) => els.asMap().entries.map((el) {
    return list.map((e) {
      final left  = (el.key == 0 ? el.value - w + 1 : el.value);
      final right = (el.key == 0 ? el.value : el.value + w - 1);
      return (e[0] <= right && left <= e[1]);
    }).toList();
  }).toList()).toList();
}

List<List<List<bool>>> combination(List<List<bool>> list, int n) {
  return n == 1
      ? list.map((el) => [el]).toList()
      : list.asMap().entries.expand((entry) {
          return combination(list.sublist(entry.key + 1), n - 1).map((el) => [entry.value] + el).toList();
        }).toList();
}

bool confirmBreak(List<List<bool>> bools) {
  return bools[0].asMap().entries.every((entry) {
    return bools.any((el) => el[entry.key]);
  });
}

int checkInAscending(List<List<int>> walls, int w, [int n = 1]) {
  return combination(breakWall(walls, w), n).any((el) => confirmBreak(el)) ? n : checkInAscending(walls, w, n + 1);
}
