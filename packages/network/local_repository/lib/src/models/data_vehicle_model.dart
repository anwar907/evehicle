import 'promotion_model.dart';
import 'rental_package_model.dart';
import 'vehicle_model.dart';

class DataVehicle {
  final List<Promotion> promotions;
  final List<RentalPackage> rentalPackages;
  final List<ElectrumBike> electrumBikes;
  final List<PickupArea> pickupAreas;

  DataVehicle({
    required this.promotions,
    required this.rentalPackages,
    required this.electrumBikes,
    required this.pickupAreas,
  });

  factory DataVehicle.fromJson(Map<String, dynamic> json) => DataVehicle(
    promotions: List<Promotion>.from(
      json["promotions"].map((x) => Promotion.fromJson(x)),
    ),
    rentalPackages: List<RentalPackage>.from(
      json["rentalPackages"].map((x) => RentalPackage.fromJson(x)),
    ),
    electrumBikes: List<ElectrumBike>.from(
      json["electrumBikes"].map((x) => ElectrumBike.fromJson(x)),
    ),
    pickupAreas: List<PickupArea>.from(
      json["pickupAreas"].map((x) => PickupArea.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "promotions": List<dynamic>.from(promotions.map((x) => x.toJson())),
    "rentalPackages": List<dynamic>.from(rentalPackages.map((x) => x.toJson())),
    "electrumBikes": List<dynamic>.from(electrumBikes.map((x) => x.toJson())),
    "pickupAreas": List<dynamic>.from(pickupAreas.map((x) => x.toJson())),
  };
}

class PickupArea {
  final String id;
  final String name;
  final String address;

  PickupArea({required this.id, required this.name, required this.address});

  factory PickupArea.fromJson(Map<String, dynamic> json) =>
      PickupArea(id: json["id"], name: json["name"], address: json["address"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name, "address": address};
}
