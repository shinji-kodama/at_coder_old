// 要は、(A,B)でクロスするX字型のどこかを切り取るだけ

import 'dart:io';
import 'dart:convert';

const io = "1";

Future getLines() async {
  return await new File("i" + io + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final List<String> lines = await getLines();
  // print(getCoords(lines[0], lines[1]));
  getCoords(lines[0], lines[1]).forEach((el) => print(el.join('')));
}

List<List<String>> getCoords(String line0, String line1) {
  final nab = line0.split(' ').map(int.parse).toList();
  final pqrs = line1.split(' ').map(int.parse).toList();

  return List.generate(pqrs[1] - pqrs[0] + 1, (i) {
    return List.generate(pqrs[3] - pqrs[2] + 1, (j) {
      return (i - j == nab[1] - nab[2] - (pqrs[0] - pqrs[2])
        || i + j + 2 == nab[1] + nab[2] - (pqrs[0] + pqrs[2] - 2))
        ? "#" : ".";
    });
  });

}
