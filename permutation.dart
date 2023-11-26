List<List<int>> combination(List<int> list, int n) {
  return n == 1
      ? list.map((el) => [el]).toList()
      : list.asMap().entries.expand((entry) {
          return combination(list.sublist(entry.key + 1), n - 1).map((el) => [entry.value] + el).toList();
        }).toList();
}

List<List<int>> permutation(List<int> list, int n) {
  return n == 1 
  ? list.map((el) => [el]).toList()
  : list.asMap().entries.expand((entry){
    return permutation(list.sublist(0, entry.key) + list.sublist(entry.key + 1), n - 1)
        .map((el) => [entry.value] + el).toList();
  }).toList();
}