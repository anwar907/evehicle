class ElectrumBike {
  final String id;
  final String model;
  final String photo;
  final String range;
  final bool availability;
  final String batteryCapacity;
  final String maxSpeed;
  final String chargingTime;
  final String weight;
  final List<String> features;

  ElectrumBike({
    required this.id,
    required this.model,
    required this.photo,
    required this.range,
    required this.availability,
    required this.batteryCapacity,
    required this.maxSpeed,
    required this.chargingTime,
    required this.weight,
    required this.features,
  });

  factory ElectrumBike.fromJson(Map<String, dynamic> json) => ElectrumBike(
    id: json["id"],
    model: json["model"],
    photo: json["photo"],
    range: json["range"],
    availability: json["availability"],
    batteryCapacity: json["batteryCapacity"],
    maxSpeed: json["maxSpeed"],
    chargingTime: json["chargingTime"],
    weight: json["weight"],
    features: List<String>.from(json["features"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model": model,
    "photo": photo,
    "range": range,
    "availability": availability,
    "batteryCapacity": batteryCapacity,
    "maxSpeed": maxSpeed,
    "chargingTime": chargingTime,
    "weight": weight,
    "features": List<dynamic>.from(features.map((x) => x)),
  };
}