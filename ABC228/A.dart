import "dart:io";

void main() {
  print(judge(getArray()) ? "Yes" : "No");
}

List<int> getArray() {
  final s = stdin.readLineSync() ?? '';
  final array = s.split(' ').map(int.parse).toList();
  return array;
}

bool judge(List<int> t) {
  return t[0] <= t[1] ? t[0] <= t[2] && t[2] < t[1] : t[0] <= t[2] || t[2] < t[1];
}