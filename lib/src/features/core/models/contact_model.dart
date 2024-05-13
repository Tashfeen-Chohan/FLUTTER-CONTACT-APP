import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  final String? id;
  final String fullName;
  final String phoneNo;
  final String? relationship;
  final String userId;

  ContactModel({
    this.id,
    required this.fullName,
    required this.phoneNo,
    this.relationship,
    required this.userId,
  });

  toJson() {
    return {
      "FullName": fullName,
      "PhoneNo": phoneNo,
      "Relationship": relationship,
      "UserId": userId,
    };
  }

  factory ContactModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ContactModel(
        id: document.id,
        fullName: data["FullName"],
        phoneNo: data["PhoneNo"],
        relationship: data["Relationship"],
        userId: data["UserId"]);
  }
}
