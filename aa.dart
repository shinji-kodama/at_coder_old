// import 'dart:io';
// import 'dart:convert';

// const io = "2";

// Future getLines() async {
//   return await new File("i" + io + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
//   // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
// }

// void main() async {
//   final List<String> lines = await getLines();
//   // print(getCoordinate(lines[0], lines[1]));
//   makeMatrix(lines[0], lines[1], getCoordinate).forEach((el) => print(el.join('')));
// }

// List<List<int>> getCoordinate(String line0, String line1) {
//   final nab = line0.split(' ').map(int.parse).toList();
//   final pqrs = line1.split(' ').map(int.parse).toList();

//   final diff1A = 1 - nab[1];
//   final diff1B = 1 - nab[2];
//   final diffNA = nab[0] - nab[1];
//   final diffNB = nab[0] - nab[2];

//   final k1max = diffNA >= diffNB ? diffNB : diffNA;
//   final k1min = diff1A >= diff1B ? diff1A : diff1B;

//   final List<List<int>> k1 = k1max > k1min ? List.generate(pqrs[1] - pqrs[0] + 1, (i) => [pqrs[0] - 1 + nab[1] + k1min + i, pqrs[0] - 1 + nab[2] + k1min + i]) : [[]];
//   // print("k1max+A: ${k1max + nab[1]}, k1min+A: ${k1min + nab[1]}, mab: $nab, pqrs: $pqrs");
//   print("k1: $k1");
//   final k2max = diffNA >= -diff1B ? -diff1B : diffNA;
//   final k2min = diff1A >= -diffNB ? diff1A : -diffNB;
//   final List<List<int>> k2 = k2max > k2min ? List.generate(pqrs[3] - pqrs[2] + 1, (i) => [pqrs[0] - 1 + nab[1] + k2min + i, pqrs[0] - 1 + nab[2] - (k2min + i)]) : [[]];
//   print("k2: $k2");
//   return [...k1, ...k2];
// }

// bool isInMatrix(String line1, int i, int j) {
//   final pqrs = line1.split(' ').map(int.parse).toList();
//   return pqrs[0] <= i && i <= pqrs[1] && pqrs[2] <= j && j <= pqrs[3];
// }

// makeMatrix(String line0, String line1, Function func) {
//   final n = int.parse(line0.split(' ')[0]);
//   final pqrs = line1.split(' ').map<int>(int.parse).toList();
//   final tmpList = func(line0, line1);

//   return List.generate(
//       pqrs[1] - pqrs[0] + 1,
//       (i) => List.generate(pqrs[3] - pqrs[2] + 1, (j) {
//             return tmpList.any((el) => el[0] == pqrs[0] + i && el[1] == pqrs[2] + j) ? "#" : ".";
//           }));
// }
