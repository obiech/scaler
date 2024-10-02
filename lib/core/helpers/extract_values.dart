List<String> extractTitles(Map<String, dynamic> json, String filter) {
  final _list = (json['icp_answers'] as Map<String, dynamic>).values;
  // Use expand to flatten the lists and map to extract 'filter'
  return _list
      .whereType<List<dynamic>>()
      .expand(
        (item) =>
            item.whereType<Map<String, dynamic>>().map((map) => map[filter]),
      )
      .whereType<String>()
      .toList();
}
