
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttercafe/data/entity/cafe.dart';

class CafeRepository{

  final String userId ;
  CafeRepository({this.userId});

  final CollectionReference cafeCollection = Firestore.instance.collection('cafe');

  Future<void> addNewCafe(String name , String location , int rate) async{
    return await cafeCollection.document('${name.replaceAll(' ', '_').trim().toLowerCase()}$userId').setData({
      'name' :  name,
      'location': location ,
      'rate' : rate
    });
  }

  List<Cafe> _convertSnapQueryToCafe(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Cafe(
        name: doc.data['name'] ?? '',
        location: doc.data['location'] ?? '',
        rate: doc.data['rate'] ?? 0,
      );
    }).toList();
  }

  Stream<List<Cafe>> get cafes {
    return cafeCollection.snapshots().map(_convertSnapQueryToCafe);
  }

}