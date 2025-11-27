class RentalPackage {
  final String id;
  final String plan;
  final int pricePerDay;
  final int pricePerWeek;
  final int pricePerMonth;
  final String terms;

  RentalPackage({
    required this.id,
    required this.plan,
    required this.pricePerDay,
    required this.pricePerWeek,
    required this.pricePerMonth,
    required this.terms,
  });

  factory RentalPackage.fromJson(Map<String, dynamic> json) => RentalPackage(
    id: json["id"],
    plan: json["plan"],
    pricePerDay: json["pricePerDay"],
    pricePerWeek: json["pricePerWeek"],
    pricePerMonth: json["pricePerMonth"],
    terms: json["terms"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "plan": plan,
    "pricePerDay": pricePerDay,
    "pricePerWeek": pricePerWeek,
    "pricePerMonth": pricePerMonth,
    "terms": terms,
  };
}
