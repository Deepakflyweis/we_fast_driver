// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

List<BookingModel> bookingModelFromJson(String str) => List<BookingModel>.from(
    json.decode(str).map((x) => BookingModel.fromJson(x)));

String bookingModelToJson(List<BookingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookingModel {
  BookingModel({
    required this.id,
    required this.user,
    required this.vehicleType,
    required this.pickupLocation,
    required this.pickupAddress,
    required this.dropLocation,
    required this.dropAddress,
    required this.receiverDetails,
    required this.senderDetails,
    required this.loadWeight,
    required this.notes,
    required this.bookingType,
    required this.status,
    required this.goodsType,
    required this.labourNeeded,
    required this.paidBy,
    required this.createdAt,
    required this.updatedAt,
    this.driver,
    this.vehicle,
    required this.amount,
  });

  String id;
  User user;
  String vehicleType;
  PLocation pickupLocation;
  String pickupAddress;
  PLocation dropLocation;
  String dropAddress;
  ErDetails receiverDetails;
  ErDetails senderDetails;
  int loadWeight;
  String notes;
  String bookingType;
  String status;
  String goodsType;
  bool labourNeeded;
  String paidBy;
  DateTime createdAt;
  DateTime updatedAt;
  String? driver;
  String? vehicle;
  double amount;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json["id"],
        user: User.fromJson(json["user"]),
        vehicleType: json["vehicleType"],
        pickupLocation: PLocation.fromJson(json["pickupLocation"]),
        pickupAddress: json["pickupAddress"],
        dropLocation: PLocation.fromJson(json["dropLocation"]),
        dropAddress: json["dropAddress"],
        receiverDetails: ErDetails.fromJson(json["receiverDetails"]),
        senderDetails: ErDetails.fromJson(json["senderDetails"]),
        loadWeight: json["loadWeight"],
        notes: json["notes"],
        bookingType: json["bookingType"],
        status: json["status"],
        goodsType: json["goodsType"],
        labourNeeded: json["labourNeeded"],
        paidBy: json["paidBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        driver: json["driver"] ?? null,
        vehicle: json["vehicle"],
        amount: json["amount"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "vehicleType": vehicleType,
        "pickupLocation": pickupLocation.toJson(),
        "pickupAddress": pickupAddress,
        "dropLocation": dropLocation.toJson(),
        "dropAddress": dropAddress,
        "receiverDetails": receiverDetails.toJson(),
        "senderDetails": senderDetails.toJson(),
        "loadWeight": loadWeight,
        "notes": notes,
        "bookingType": bookingType,
        "status": status,
        "goodsType": goodsType,
        "labourNeeded": labourNeeded,
        "paidBy": paidBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "driver": driver,
        "vehicle": vehicle,
        "amount": amount,
      };
}

class PLocation {
  PLocation({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<num> coordinates;

  factory PLocation.fromJson(Map<String, dynamic> json) => PLocation(
        type: json["type"],
        coordinates: List<num>.from(json["coordinates"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class ErDetails {
  ErDetails({
    required this.name,
    required this.phoneNumber,
    required this.countryCode,
  });

  String name;
  String phoneNumber;
  String countryCode;

  factory ErDetails.fromJson(Map<String, dynamic> json) => ErDetails(
        name: json["name"],
        phoneNumber: json["phone_number"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
        "country_code": countryCode,
      };
}

class User {
  User({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
