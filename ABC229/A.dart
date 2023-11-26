import 'dart:io';

void main() {
  final str = (stdin.readLineSync() ?? '') + (stdin.readLineSync() ?? '');
  print(str == '.##.' || str == '#..#' ? 'No' : 'Yes');
}
