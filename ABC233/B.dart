import 'dart:io';
import 'dart:convert';

const io = "1";

Future getLines() async {
  return await new File("i" + io + ".txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final List<String> lines = await getLines();
  final st2Ed = lines[0].split(' ').map(int.parse).toList();
  
  final reversedStr = (str, range) => 
    str.split('').sublist(range[0] - 1, range[1]).reversed.join('');
  final convertedStr = (str, range) => 
    str.substring(0, range[0]-1) + reversedStr(str, range) + str.substring(range[1]);

  print(convertedStr(lines[1], st2Ed));
}