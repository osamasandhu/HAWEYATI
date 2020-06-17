import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:haweyati/pages/appHomePage.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/stackButton.dart';

String apiKey = 'AIzaSyDdNpY6LGWgHqRfTRZsKkVhocYOaER325w';

class VehiclesMapPage extends StatefulWidget {
  @override
  State<VehiclesMapPage> createState() => VehiclesMapPageState();
}

class VehiclesMapPageState extends State<VehiclesMapPage> {
  String selectedVehicle = 'Pick up';
  String userAddress;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController controller;
  LatLng currentLocation;
  LatLng rawLocation;
  List<Marker> allMarkers = [];
  TextEditingController searchAddressField = TextEditingController();
  List<PlacesSearchResult> places = [];
  bool selectedStartingPoint = false;
  bool selectedDestinationPoint = false;
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: apiKey);
  _getCurrentUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });
    updateAddress();
    allMarkers.add(Marker(
        markerId: MarkerId('0'),
        position: currentLocation,
        draggable: true,
        onDragEnd: (position) async {
          currentLocation = position;
          updateAddress(position);
          controller.animateCamera(
            CameraUpdate.newCameraPosition(
                CameraPosition(target: position, zoom: 15.0)),
          );
        }));
  }

  void updateAddress([LatLng address]) async {
    userAddress = await findAddress(address ?? currentLocation);
    setState(() {
      searchAddressField.text = userAddress;
    });
  }

  _getPlacesPredictions() async {
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: apiKey,
    );
    displayPrediction(p);
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;
      for (var i = 0; i < p.terms.length; ++i) {
        print('displayPrediction terms[$i]: ${p.terms[i].value}');
      }
      print('displayPrediction matchedSubstrings: ${p.matchedSubstrings}');
      LatLng tempLatLng = new LatLng(lat, lng);

      setState(() {
        currentLocation = tempLatLng;
        updateAddress();
        searchAddressField.text = userAddress;
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: currentLocation, zoom: 16.0),
          ),
        );
      });
    }
  }

  String _showBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            height: MediaQuery.of(context).size.height / 2.1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Select Vehicle",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                selectedTypes('Small Truck'),
                selectedTypes('Big Truck'),
                selectedTypes('Pick Up'),
                selectedTypes('Car'),
              ],
            ),
          );
        });
  }

  Widget selectedTypes(String title){
    return ListTile(
      dense: true,
      leading: Image.asset(
        "assets/images/bottomtruck.png",
        width: 30,
        height: 30,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(loremIpsum.substring(0, 30)),
      onTap: (){
        setState(() {
          selectedVehicle = title;
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getCurrentUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: HaweyatiAppBar(context: context,showHome: false,showCart: false,),
//        floatingActionButton: currentLocation !=null ? FloatingActionButton.extended(onPressed: (){
//          CustomNavigator.navigateTo(context, AppHomePage(address: userAddress,));
//        },
//            label: Text('Confirm Pickup',style: TextStyle(color: Colors.white),)) : SizedBox(),
        body: Stack(
          children: <Widget>[
            currentLocation != null
                ? GoogleMap(
                    onCameraMove: (CameraPosition position) {
                      rawLocation = position.target;
                    },
                    compassEnabled: true,
                    padding: EdgeInsets.only(bottom: 80),
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    initialCameraPosition:
                        CameraPosition(target: currentLocation, zoom: 15),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      this.controller = controller;
                    },
                    markers: Set.from(allMarkers),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text('Getting your current location..'),
                        ),
                        Text(
                          '(Make sure you have your location enabled)',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
            currentLocation != null
                ? Align(
                    alignment: Alignment(-1, -0.95),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 15.0),
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, -10.0),
                                blurRadius: 10.0),
                          ]),
                      child: TextField(
                        cursorColor: Colors.black,
                        controller: searchAddressField,
                        onTap: () {
                          _getPlacesPredictions();
                          FocusScope.of(context).requestFocus(new FocusNode());
                        },
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            margin: EdgeInsets.only(left: 20, top: 5),
                            width: 10,
                            height: 10,
                            child: Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Search..",
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 16.0),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
            GestureDetector(
              onTap: () {

              _showBottomSheet();

                },
              child: Align(
                alignment: Alignment(0, 0.85),
                child: Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 65, 25),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/bottomtruck.png",
                        width: 30,
                        height: 30,
                      ),
                      title: Text(selectedVehicle),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      dense: true,
                    )),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.97),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 6,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "Confirm Pickup",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.fromLTRB(7, 0, 15, 0)),
                        )),
                    CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Future<String> findAddress(LatLng cords) async {
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(cords.latitude, cords.longitude));
    String formattedAddress = "";
    if (addresses.first.addressLine.contains(",")) {
      List<String> descriptionSplit = addresses.first.addressLine.split(",");
      for (var i = 0; i < descriptionSplit.length - 1; ++i) {
        if (i == descriptionSplit.length - 2) {
          formattedAddress += descriptionSplit[i];
        } else {
          formattedAddress += descriptionSplit[i] + ", ";
        }
      }
    } else {
      formattedAddress = addresses.first.addressLine;
    }
    return formattedAddress;
  }
}
