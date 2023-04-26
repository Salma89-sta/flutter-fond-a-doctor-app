import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadUserToDataBase(
      {required String name, required String phone}) async {
    await firebaseFirestore.collection('user').doc(
        firebaseAuth.currentUser!.uid).set(
        {
          'name': name,
          'phone': phone,
        }
    );
  }

  Future uploadAdminToDataBase(
      {required String name, required String phone}) async {
    await firebaseFirestore.collection('admin').doc(
        firebaseAuth.currentUser!.uid).set(
        {
          'name': name,
          'phone': phone,
        }
    );
  }


}
