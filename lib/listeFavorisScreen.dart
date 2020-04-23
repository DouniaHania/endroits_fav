import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'DataBaseDounia.dart';
import 'package:provider/provider.dart';

import 'listeFavoris.dart';
import 'main.dart';


var _controller = TextEditingController();

class FavoritePlacesScreen extends StatelessWidget {

 static const String id = 'FriendsListScreen';
static final currentUser = 'oHFzqoSaM4RUDpqL9UF396aTCf72';

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<dynamic>>.value(
      value: DataBase().getlistfavoris,
      child : GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child : Scaffold(
          resizeToAvoidBottomInset: false,
         /* appBar: AppBar(
            backgroundColor: Colors.white30,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black54,),
            actions: <Widget>[ IconButton(
              onPressed: () {
                Navigator.pushNamed(context, FriendRequestListScreen.id);},
              icon: Icon(Icons.group_add),
              color: Color(0xFF5B5050),
              iconSize: 35.0,),],
          ),*/
          body: Center(

            child: Column(
              children: <Widget> [ 
                Align(
                alignment: Alignment.topRight,), 
                Center(
                 child : Text(
                  'Endroits favoris',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF389490),
                    fontFamily: 'Montserrat-Bold',),),),

                Spacer(flex:1),
                Container(
                  height:  420.0,
                  width: 350.0,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:  Color(0xFFD0D8E2),),
                  child:  FavorisTile(),),
                Spacer(flex:1),
            Text('heyyyyyyyy',
            style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF389490),
                    fontFamily: 'Montserrat-Bold',),),
              InkWell(
                child:
              Container(
                child:
                Icon(
                 Icons.add_circle_outline,color:Color(0xFF389490),
                ),
              ),
              onTap: (){
                Geoflutterfire g= Geoflutterfire();
               GeoFirePoint gp= g.point(latitude: 36.456321, longitude: 3.021554896);
                DataBase().userUpdateData(currentUser,gp);},
              ),
              //Spacer(flex: 1,)
              ],),
          ),),
      ),
    );   
  }
  
}
