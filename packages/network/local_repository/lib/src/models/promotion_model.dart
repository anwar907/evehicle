class Promotion {
  final String id;
  final String title;
  final String shortCopy;
  final DateTime validity;

  Promotion({
    required this.id,
    required this.title,
    required this.shortCopy,
    required this.validity,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
    id: json["id"],
    title: json["title"],
    shortCopy: json["shortCopy"],
    validity: DateTime.parse(json["validity"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "shortCopy": shortCopy,
    "validity":
        "${validity.year.toString().padLeft(4, '0')}-${validity.month.toString().padLeft(2, '0')}-${validity.day.toString().padLeft(2, '0')}",
  };
}

