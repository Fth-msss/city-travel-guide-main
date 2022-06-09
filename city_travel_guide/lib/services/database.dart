import 'package:city_travel_guide/model/yoru.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference yorumCollection = FirebaseFirestore.instance.collection('yorum');

  Future updateUserData(String sugars,String name,int strength) async {
    return await yorumCollection.doc(uid).set({
      'sugars':sugars,
      'name': name,
      'strength': strength,
    });
  }

  // yorum list from snpashot
  List<Yorum> _yorumListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Yorum(
        name: doc.get('name') ?? '',
        strength: doc.get('strength') ?? 0,
        sugars: doc.get('sugars') ?? '0'
      );
    }).toList();
  }

  // get comment stream
Stream<List<Yorum>> get yorums{
    return yorumCollection.snapshots()
    .map(_yorumListFromSnapshot);
}

}