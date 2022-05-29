import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseWrite {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  var uuid = const Uuid();

  Future<bool> getUser(User user) async {
    final QuerySnapshot result = await db
        .collection('AstroLearnersUSERS')
        .where('username', isEqualTo: user.displayName)
        .get();
    final List < DocumentSnapshot > documents = result.docs;
    
    if (documents.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> addUserToCollection(User user) async {
    bool userExists = await getUser(user);

    if (!userExists) {
      db.collection("AstroLearnersUSERS").doc(user.uid).set({
        "bio": "",
        "planets": [],
        "uid": uuid.v4(),
        "username": user.displayName
      });
    }
  }
}
