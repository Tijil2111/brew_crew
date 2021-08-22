import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {



  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');


  final String uid;
  DatabaseService({required this.uid});

  Future updateUserData(String sugars, String name, int strength) async{
    return await brewCollection.document(uid).setData({
      'sugars': sugars ,
      'name': name,
      'stregth': strength,
    });
  }


  //get brews stream
Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
}
}

