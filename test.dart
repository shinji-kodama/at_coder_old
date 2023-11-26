import "dart:io";
import 'dart:convert';

const io = "1";

Future getLines() async {
  return await new File("./i" + io + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(new LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final lines = await getLines();
  final aaa = lines.map<List<String>>((String el) => el.split('')).toList();
  final fs = compose([str2Int, compare, examine]);
  print(fs(aaa) ? "Yes" : "No");
}

// 標準有力値を取得して二次元配列を返す
// return List<List<String>>
final inputLines = () {
  return new List.filled(2, "").map((el) => stdin.readLineSync()!.split("")).toList();
};

// アルファベットを数字に変換
// return List<List<int>>
final str2Int = (List<List<String>> charLists) {
  const CHARS = "abcdefghijklmnopqrstuvwxyz";
  return charLists.map((els) => els.map((el) => CHARS.indexOf(el)).toList()).toList();
};

// ２つの配列の要素の差を配列で返す
// return List<int>
final compare = (List<List<int>> lists) {
  return lists[1].asMap().entries.map((entry) {
    return (entry.value - lists[0][entry.key] + 26) % 26;
  }).toList();
};

// 配列の要素が全て同じ数字か判定
// return bool
final examine = (List<int> list) => list.every((el) => el == list[0]);

// 関数の合成（）
// return 引数のリストないの関数による
final compose = (List<Function> fs) => (List<List<String>> a) {
  return fs.fold(a, (ac, f) => f(ac));
};
