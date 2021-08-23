
import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
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

// brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? '0',
        sugars: doc.data['sugars'] ?? 'O'
      );
    }).toList();
  }


  //get brews stream
Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
}
}

