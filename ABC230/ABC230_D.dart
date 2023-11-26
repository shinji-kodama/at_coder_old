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

  print(breakWallTimes(walls,w));
}

breakWallTimes(List<List<int>> walls, int w) {
  walls.sort((a, b) => a[1] - b[1]);

  int breaked = 0;
  int count = 0;

  walls.forEach((wall) {
    if (wall[0] > breaked) {
      count++;
      breaked = wall[1] + w - 1;
    }
  });

  return count;
}
