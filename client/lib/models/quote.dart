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

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'] as int,
      text: json['text'] as String,
      source: json['source'] as String,
      luckyLevel: json['luckyLevel'] as int,
    );
  }
}
