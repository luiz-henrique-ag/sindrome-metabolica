import 'package:cloud_firestore/cloud_firestore.dart';


class DBFirestore {

  static final DBFirestore instance = DBFirestore._();
  static FirebaseFirestore? _firestore;

  DBFirestore._();


  Future<FirebaseFirestore> get databaseFB async {
    if (_firestore != null) {
      return _firestore!;
    }
    _firestore = await FirebaseFirestore.instance;
    return _firestore!;
  }

}
