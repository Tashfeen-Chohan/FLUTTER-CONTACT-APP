// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/models/contact_model.dart';

class ContactRepository extends GetxController {
  static ContactRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createContact(ContactModel contact) async {
    try {
      await _db.collection("Contacts").add(contact.toJson());

      Get.snackbar("Success", "Contact saved successfully!");
    } catch (e) {
      Get.snackbar("Error", "Something went wrong!");
      print(e);
    }
  }

  Future<List<ContactModel>> getUserContacts(String? userId) async {
    final snapshot = await _db
        .collection("Contacts")
        .where("UserId", isEqualTo: userId)
        .get();

    final contacts =
        snapshot.docs.map((e) => ContactModel.fromSnapshot(e)).toList();
    return contacts;
  }

  Future<ContactModel?> getContactDetails(String id) async {
    final snapshot = await _db.collection("Contacts").doc(id).get();
    if (snapshot.exists) {
      return ContactModel.fromSnapshot(snapshot);
    } else {
      return null;
    }
  }
}
