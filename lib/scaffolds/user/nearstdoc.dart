import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindYourNearstDoctor extends StatefulWidget {
  double userLat=29.9927636;
  double userLon=31.1814281;
  @override
  State<FindYourNearstDoctor> createState() => _FindYourNearstDoctorState();
  FindYourNearstDoctor(this.userLon, this.userLat);
}

class _FindYourNearstDoctorState extends State<FindYourNearstDoctor> {


  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers =<MarkerId, Marker>{
  };
  void initMarker(specify, specifyID) async {
    var markerIdval = specifyID;
    final MarkerId markerId = MarkerId(markerIdval);
    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(double.parse(specify['lat']),double.parse(specify['lon'])),
        infoWindow: InfoWindow(
            title: specify['name'],
            snippet: specify['major']
        )
    );
    setState(() {
      markers[markerId] = marker;
    });
  }
  getMarkerData() async{
    FirebaseFirestore.instance.collection("admin").get().then((myMockData){
      if(myMockData.docs.isNotEmpty){
        for(int i=0; i< myMockData.docs.length;i++){
          initMarker(myMockData.docs[i].data(), myMockData.docs[i].id);
        }
      }
    });
  }
  static double getDistanceFromGPSPointsInRoute(List<LatLng> gpsList) {
    double totalDistance = 0.0;
    for (var i = 0; i < gpsList.length; i++) {
      var p = 0.017453292519943295;
      var c = cos;
      var a = 0.5 -
          c((gpsList[i + 1].latitude - gpsList[i].latitude) * p) / 2 +
          c(gpsList[i].latitude * p) *
              c(gpsList[i + 1].latitude * p) *
              (1 - c((gpsList[i + 1].longitude - gpsList[i].longitude) * p)) /
              2;
      double distance = 12742 * asin(sqrt(a));
      totalDistance += distance;
      print('Distance is ${12742 * asin(sqrt(a))}');
    }
    print('Total distance is $totalDistance');
    return totalDistance;
  }

  void initState(){
    getMarkerData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GoogleMap(
      onMapCreated: (GoogleMapController x) {
        mapController = x;
      },
      initialCameraPosition: CameraPosition(
          target: LatLng(widget.userLat, widget.userLon), zoom: 6),
      markers: Set<Marker>.of(markers.values),);
  }
}