Map<int, int> makeMap(List<int> list) {
  return list.fold<Map<int, int>>({}, (a, b) {
    a[b] = (a[b] ?? 1) + 1;
    return a;
  });
}