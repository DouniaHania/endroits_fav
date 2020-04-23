import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'DataBaseDounia.dart';
import 'package:provider/provider.dart';

import 'package:geocoder/geocoder.dart' ;
import 'package:geoflutterfire/geoflutterfire.dart' ;

class FavorisList extends StatefulWidget {
  @override
  _FavorisListState createState() => _FavorisListState();
}

class _FavorisListState extends State<FavorisList> {
 Geoflutterfire g = Geoflutterfire();
 
  @override
  Widget build(BuildContext context) {
    final favoris = Provider.of<List<dynamic>>(context);
    int count ;
   
    if(favoris != null) {count = favoris.length;}
    else{count=0;}
    return ListView.builder(
      shrinkWrap: true,
      itemCount:  count,
      itemBuilder: (context, index) {
         FavorisTile.geopointfav=favoris[index]['geohash'];
        return FavorisTile(
        // geopointfav: favoris[index]['position'],
          geohsh: favoris[index]['geohash'],
          );
      },
    );
    
  }
}

class FavorisTile extends StatelessWidget {
 
        Position position ;
       /* LatLng ltlg =new LatLng(position.latitude,position.longitude);
        Geoflutterfire geo = Geoflutterfire();
        GeoFirePoint geoP = geo.point(latitude: position.longitude, longitude: position.longitude);*/

  /*LatLng pos=new LatLng( lat,long);
  FavorisTile({this.lat,this.long});*/
  String geohsh='dhj';
  
  static GeoFirePoint geopointfav;
  FavorisTile({ this.geohsh});
  LatLng pos= LatLng(geopointfav.latitude, geopointfav.longitude) ;
  
  
 /* convertCoordinate() async
  {
    final coord= new Coordinates(geopointfav.latitude, geopointfav.longitude);
    final addresses = await Geocoder.local.findAddressesFromCoordinates(coord);
            final first = addresses.first.addressLine;
    //print("${first.featureName} : ${first.addressLine}");
    return (first);
 }*/
  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(

        title: Text(
          
           '$geopointfav',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            //color: Color(0xff707070),
            color: Color(0xff000000),
          ),
        ),
        leading: Icon(
          Icons.place,
          color: Color(0xff3B466B),
          size: 30,
        ),
        trailing: IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.info_outline),
          color: Color(0xff389490),
          iconSize: 30,
        ),
      ),
    );
  }
}

/*
// ignore: must_be_immutable
class favorisList extends StatefulWidget {
  String filter;
  favorisList(this.filter);
  @override
  _favorisListState createState() => _favorisListState();
}


class _favorisListState extends State<favorisList> {

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<Utilisateur>>(context);
    int count ;
    if(users != null) {count = users.length;}
    else{count=0;}
    return ListView.builder(
      shrinkWrap: true,
      itemCount:  count,
      itemBuilder: (context, index) {
        return widget.filter == null || widget.filter == "" ? new UserTile(user: users[index]) : users[index].pseudo.contains(widget.filter) ? new UserTile(user: users[index]) : new Container();
      },
    );
  }
}


class UserTile extends StatelessWidget {

  final Utilisateur user ;
  UserTile({ this.user});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(

        title: Text(
          user.pseudo,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: Color(0xff707070),
          ),
        ),
        leading: Icon(
          Icons.people,
          color: Color(0xff3B466B),
          size: 30,
        ),
        trailing: IconButton(
          onPressed: () {
          },
          icon: Icon(Icons.info_outline),
          color: Color(0xff389490),
          iconSize: 30,
        ),
      ),
    );
  }
  }*/

