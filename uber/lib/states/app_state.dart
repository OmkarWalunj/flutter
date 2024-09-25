import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber/requests/google_maps_requests.dart';
import 'package:geocoding/geocoding.dart';

class AppState with ChangeNotifier {
  static LatLng _initialPosition = LatLng(0, 0); // Initializing with a default value
  LatLng _lastPosition = _initialPosition;
  bool locationServiceActive = true;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};
  GoogleMapController? _mapController;
  final GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  TextEditingController locationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  LatLng get initialPosition => _initialPosition;
  LatLng get lastPosition => _lastPosition;
  GoogleMapsServices get googleMapsServices => _googleMapsServices;
  GoogleMapController? get mapController => _mapController;
  Set<Marker> get markers => _markers;
  Set<Polyline> get polyLines => _polyLines;

  AppState() {
    _getUserLocation();
    _loadingInitialPosition();
  }

  // ! TO GET THE USERS LOCATION
  Future<void> _getUserLocation() async {
    print("GET USER METHOD RUNNING =========");
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      _initialPosition = LatLng(position.latitude, position.longitude);
      print("the latitude is: ${position.longitude} and the longitude is: ${position.longitude}");
      print("initial position is : ${_initialPosition.toString()}");
      locationController.text = placemarks[0].name ?? '';
      notifyListeners();
    } catch (e) {
      print("Error: $e");
      // Handle error appropriately here
    }
  }

  // ! TO CREATE ROUTE
  void createRoute(String encodedPoly) {
    _polyLines.add(Polyline(
      polylineId: PolylineId(_lastPosition.toString()),
      width: 10,
      points: _convertToLatLng(_decodePoly(encodedPoly)),
      color: Colors.black,
    ));
    notifyListeners();
  }

  // ! ADD A MARKER ON THE MAP
  void _addMarker(LatLng location, String address) {
    _markers.add(Marker(
      markerId: MarkerId(_lastPosition.toString()),
      position: location,
      infoWindow: InfoWindow(title: address, snippet: "go here"),
      icon: BitmapDescriptor.defaultMarker,
    ));
    notifyListeners();
  }

  // ! CREATE LATLNG LIST
  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  // !DECODE POLY
  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = [];
    int index = 0;
    int len = poly.length;
    int c = 0;

    // repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      // if value is negative then bitwise not the value
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    // adding to previous value as done in encoding
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  // ! SEND REQUEST
  Future<void> sendRequest(String intendedLocation) async {
    try {
      List<Location> locations = await locationFromAddress(intendedLocation);
      double latitude = locations[0].latitude;
      double longitude = locations[0].longitude;
      LatLng destination = LatLng(latitude, longitude);
      _addMarker(destination, intendedLocation);
      String route = await _googleMapsServices.getRouteCoordinates(_initialPosition, destination);
      createRoute(route);
      notifyListeners();
    } catch (e) {
      print("Error: $e");
      // Handle error appropriately here
    }
  }

  // ! ON CAMERA MOVE
  void onCameraMove(CameraPosition position) {
    _lastPosition = position.target;
    notifyListeners();
  }

  // ! ON CREATE
  void onCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  //  LOADING INITIAL POSITION
  Future<void> _loadingInitialPosition() async {
    await Future.delayed(Duration(seconds: 5)).then((_) {
      if (_initialPosition == LatLng(0, 0)) {
        locationServiceActive = false;
        notifyListeners();
      }
    });
  }
}
