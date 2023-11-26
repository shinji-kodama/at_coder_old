import 'dart:io';
import 'dart:convert';

const no = "227";
const io = "B2";

Future getLines() async {
  return await new File("./ABC${no}/io/${io}.txt").openRead().transform(utf8.decoder).transform(new LineSplitter()).map((e) => e.toString()).toList();
  // return await stdin.transform(utf8.decoder).transform(const LineSplitter()).map((_)=>_).toList();
}

void main() async {
  final List<String> data = await getLines();
  final List<int> areas = data[1].split(' ').map(int.parse).toList();
  print(checkAreas(areas));
}

bool checkArea(int S, int b) => S % (4 * b + 3) == 3 * b && S != 3 * b;

bool checkRepeatedly(int S, List<int> list) {
  return list.any((el) {
    return checkArea(S, el);
  });
}

int checkAreas(List<int> areas) {
  final list = new List.generate(142, (i) => i + 1);
  return areas.fold(0, (a, b) {
    return a + (checkRepeatedly(b, list) ? 0 : 1);
  });
}


/**
 * 4ab + 3(a+b)
 * 1:  7a +  3
 * 2: 11a +  6
 * 3: 15a +  9
 * 4: 19a + 12
 */