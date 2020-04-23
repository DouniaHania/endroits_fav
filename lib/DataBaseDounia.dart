import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'package:geocoder/geocoder.dart';
import 'package:geoflutterfire/geoflutterfire.dart' ;

class DataBase {

static final currentUser = 'oHFzqoSaM4RUDpqL9UF396aTCf72';
  GeoFirePoint geoPoint ;
  DataBase({this.geoPoint});

 //GeoFirePoint geoPoint=geo.Point(latitude:lati,longitude:longi);
 // final String pseudo ;


   
  final CollectionReference userCollection = Firestore.instance.collection('Utilisateur');



  Future userUpdateData(String current,GeoFirePoint g) async {
    // ajouter un amis a la liste de current
    geoPoint=g;
    return await userCollection.document(current).updateData({
      "favoris": FieldValue.arrayUnion([geoPoint])
    });
  }

  Future userDeleteData(String current) async {
    // supprimer une invit de pseudo de la liste de current
    return await userCollection.document(current).updateData({
      "favoris": FieldValue.arrayRemove([geoPoint])
    });
  }


/*
_read() async {
    try {
     var aFromFs = await Firestore.instance
          .collection('Utilisateur')
          .document('oHFzqoSaM4RUDpqL9UF396aTCf72')
          .get();
      var a = DataBase().fromMap(aFromFs.data, aFromFs.documentID);
      print('the A from FireBase $a with name ${a.name} first item ${a.items.first.description}');

      print('returning from read!');
    } catch (e) {
      print('Oh no Error! ${e.toString()}');
    }
  }
*/
   Stream<List<dynamic>> get getlistfavoris {
    // String id = await authService.connectedID();
     return userCollection.document(currentUser).snapshots().map((snap){
       print('gonna copy dataaaaaaaaaaaaaaaa');
       List<dynamic> listfavoris=snap.data['favoris'];
       
       print(listfavoris);
       print('heyyyyyy2');
       return listfavoris;
     });
  
   }
/*
Future<List<Map<String,dynamic>>> getlistfavoris() async {
     print(currentUser);
     List<Map<String,dynamic>> listfavoris = List();
     await Firestore.instance
         .collection('Utilisateur')
         .document(currentUser)
         .get()
         .then((DocumentSnapshot doc) {
       listfavoris = doc.data['favoris'];
     });
     print(listfavoris);
   

    return listfavoris;
}*/

/*  Future<void> readLoacationData() async
{
var query = await userCollection.document('oHFzqoSaM4RUDpqL9UF396aTCf72');
query.snapshots().forEach((doc) {

List<Map<dynamic, dynamic>> values = List.from(doc.data['favoris']);


});
}*/


}

