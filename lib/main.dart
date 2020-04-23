import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'DataBaseDounia.dart';
import 'package:provider/provider.dart';
import 'listeFavorisScreen.dart';

Future<void> main() async => runApp(MyApp()
);


class MyApp extends StatelessWidget {
 static Geoflutterfire g= Geoflutterfire();
  GeoFirePoint geo=g.point(latitude: 36.0566332, longitude: 2.03665465);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  
  { 
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: FavoritePlacesScreen(),
     
      //DataBase().userUpdateData()
     /* routes: {

        FriendRequestListScreen.id: (context) => FriendRequestListScreen(),
        UsersListScreen.id: (context) => UsersListScreen(),
        //ProfileScreen2.id:(context) => ProfileScreen2(),
      },*/
    );}
   
    
    }

/*class Createlist {
  Future<void> createList() async {
    await Database(pseudo : 'Dounia').userUpdateData();
  }
}*/



