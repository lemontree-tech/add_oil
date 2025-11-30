class Quote {
  final int id;
  final String text;
  final String source;
  final int luckyLevel; // 1-5

  const Quote({
    required this.id,
    required this.text,
    required this.source,
    required this.luckyLevel,
  });
}
