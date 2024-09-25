import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapPage extends StatelessWidget {
  Map<String, List<Offset>> stateBoundaries = {
    'Andhra Pradesh': [
      Offset(0.1, 0.1),
      Offset(0.2, 0.1),
      Offset(0.2, 0.15),
      Offset(0.15, 0.2),
      Offset(0.1, 0.15),
    ],
    'Arunachal Pradesh': [
      Offset(0.25, 0.1),
      Offset(0.35, 0.1),
      Offset(0.35, 0.2),
      Offset(0.25, 0.2),
    ],
    'Assam': [
      Offset(0.25, 0.15),
      Offset(0.35, 0.15),
      Offset(0.35, 0.25),
      Offset(0.25, 0.25),
    ],
    'Bihar': [
      Offset(0.1, 0.25),
      Offset(0.2, 0.25),
      Offset(0.2, 0.35),
      Offset(0.1, 0.35),
    ],
    'Chhattisgarh': [
      Offset(0.25, 0.3),
      Offset(0.35, 0.3),
      Offset(0.35, 0.4),
      Offset(0.25, 0.4),
    ],
    'Goa': [
      Offset(0.1, 0.4),
      Offset(0.15, 0.4),
      Offset(0.15, 0.45),
      Offset(0.1, 0.45),
    ],
    'Gujarat': [
      Offset(0.2, 0.4),
      Offset(0.3, 0.4),
      Offset(0.3, 0.5),
      Offset(0.2, 0.5),
    ],
    'Haryana': [
      Offset(0.35, 0.45),
      Offset(0.45, 0.45),
      Offset(0.45, 0.55),
      Offset(0.35, 0.55),
    ],
    'Himachal Pradesh': [
      Offset(0.5, 0.4),
      Offset(0.6, 0.4),
      Offset(0.6, 0.5),
      Offset(0.5, 0.5),
    ],
    'Jharkhand': [
      Offset(0.45, 0.25),
      Offset(0.55, 0.25),
      Offset(0.55, 0.35),
      Offset(0.45, 0.35),
    ],
    'Karnataka': [
      Offset(0.2, 0.6),
      Offset(0.3, 0.6),
      Offset(0.3, 0.7),
      Offset(0.2, 0.7),
    ],
    'Kerala': [
      Offset(0.3, 0.6),
      Offset(0.4, 0.6),
      Offset(0.4, 0.7),
      Offset(0.3, 0.7),
    ],
    'Madhya Pradesh': [
      Offset(0.45, 0.5),
      Offset(0.55, 0.5),
      Offset(0.55, 0.6),
      Offset(0.45, 0.6),
    ],
    'Maharashtra': [
      Offset(0.2, 0.7),
      Offset(0.3, 0.7),
      Offset(0.3, 0.8),
      Offset(0.2, 0.8),
    ],
    'Manipur': [
      Offset(0.35, 0.6),
      Offset(0.45, 0.6),
      Offset(0.45, 0.7),
      Offset(0.35, 0.7),
    ],
    'Meghalaya': [
      Offset(0.45, 0.6),
      Offset(0.55, 0.6),
      Offset(0.55, 0.7),
      Offset(0.45, 0.7),
    ],
    'Mizoram': [
      Offset(0.55, 0.6),
      Offset(0.65, 0.6),
      Offset(0.65, 0.7),
      Offset(0.55, 0.7),
    ],
    'Nagaland': [
      Offset(0.65, 0.6),
      Offset(0.75, 0.6),
      Offset(0.75, 0.7),
      Offset(0.65, 0.7),
    ],
    'Odisha': [
      Offset(0.25, 0.7),
      Offset(0.35, 0.7),
      Offset(0.35, 0.8),
      Offset(0.25, 0.8),
    ],
    'Punjab': [
      Offset(0.5, 0.45),
      Offset(0.6, 0.45),
      Offset(0.6, 0.55),
      Offset(0.5, 0.55),
    ],
    'Rajasthan': [
      Offset(0.6, 0.5),
      Offset(0.7, 0.5),
      Offset(0.7, 0.6),
      Offset(0.6, 0.6),
    ],
    'Sikkim': [
      Offset(0.7, 0.6),
      Offset(0.75, 0.6),
      Offset(0.75, 0.65),
      Offset(0.7, 0.65),
    ],
    'Tamil Nadu': [
      Offset(0.35, 0.8),
      Offset(0.45, 0.8),
      Offset(0.45, 0.9),
      Offset(0.35, 0.9),
    ],
    'Telangana': [
      Offset(0.1, 0.8),
      Offset(0.2, 0.8),
      Offset(0.2, 0.9),
      Offset(0.1, 0.9),
    ],
    'Tripura': [
      Offset(0.55, 0.7),
      Offset(0.65, 0.7),
      Offset(0.65, 0.8),
      Offset(0.55, 0.8),
    ],
    'Uttar Pradesh': [
      Offset(0.45, 0.8),
      Offset(0.55, 0.8),
      Offset(0.55, 0.9),
      Offset(0.45, 0.9),
    ],
    'Uttarakhand': [
      Offset(0.6, 0.6),
      Offset(0.7, 0.6),
      Offset(0.7, 0.65),
      Offset(0.6, 0.65),
    ],
    'West Bengal': [
      Offset(0.25, 0.8),
      Offset(0.35, 0.8),
      Offset(0.35, 0.9),
      Offset(0.25, 0.9),
    ],
  };


  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('India Map'),
      ),
      body: GestureDetector(
        onTapUp: (TapUpDetails details) {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          final offset = renderBox.globalToLocal(details.globalPosition);
          // Calculate the tapped position relative to the map's dimensions
          final tappedX = offset.dx / renderBox.size.width;
          final tappedY = offset.dy / renderBox.size.height;
          // Use these values to determine which state was tapped
          final state = getStateFromCoordinates(tappedX, tappedY);
          if (state != null) {
            // Navigate to detail page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StateDetailsPage(state: state),
              ),
            );
          }
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            'assets/india.svg',
            semanticsLabel: 'India Map',
          ),
        ),
      ),
    );
  }

  // Function to determine the state based on tapped coordinates
  String? getStateFromCoordinates(double x, double y) {
    for (String state in stateBoundaries.keys) {
      final List<Offset> boundary = stateBoundaries[state]!;
      if (_isPointInsidePolygon(x, y, boundary)) {
        return state;
      }
    }
    return null; // If no state found
  }

  bool _isPointInsidePolygon(double x, double y, List<Offset> polygon) {
    // int i, j;
    bool isInside = false;
    int nVertices = polygon.length;

    for (var i = 0, j = nVertices - 1; i < nVertices; j = i++) {
      if (((polygon[i].dy > y) != (polygon[j].dy > y)) &&
          (x < (polygon[j].dx - polygon[i].dx) * (y - polygon[i].dy) / (polygon[j].dy - polygon[i].dy) + polygon[i].dx)) {
        isInside = !isInside;
      }
    }
    return isInside;
  }
}

class StateDetailsPage extends StatelessWidget {
  final String state;

  StateDetailsPage({required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details for $state'),
      ),
      body: Center(
        child: Text(
          'Details for $state',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
