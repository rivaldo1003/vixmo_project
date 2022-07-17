import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vixmo_new/theme.dart';
import 'package:url_launcher/url_launcher.dart';

const LatLng SOURCE_LOCATION =
    LatLng(-6.1464246, 106.8408479); //Surabaya (Mitra Informatika)
const LatLng DEST_LOCATION = LatLng(-6.1470005, 106.8380909); //Surabaya

// const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
// const LatLng DEST_LOCATION = LatLng(42.743902, -71.170009);

const double CAMERA_ZOOM = 16;
// const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;

final colorRed = Color(0xffE50027);

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Completer<GoogleMapController> _controller = Completer();

  BitmapDescriptor? sourceIcon;

  BitmapDescriptor? destinationIcon;

  Set<Marker> _markers = Set<Marker>();
  double pinPillPosition = PIN_VISIBLE_POSITION;

  LatLng? currentLocation;

  LatLng? destinationLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //set up initial location
    this.setInitialLocation();

    //set up marker icons
    this.setSourceAndDestinationMarkerIcons();
  }

  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.0),
      'assets/imgs/car_marker_fix.png',
    );

    destinationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.0),
      'assets/imgs/marker_car.png',
    );
  }

  void setInitialLocation() {
    currentLocation = LatLng(
      SOURCE_LOCATION.latitude,
      SOURCE_LOCATION.longitude,
    );

    destinationLocation = LatLng(
      DEST_LOCATION.latitude,
      DEST_LOCATION.longitude,
    );
  }

  bool isSelected = false;

  final Uri url = Uri.parse('https://goo.gl/maps/Mtd2pPAUwfFwcVHU9');

  final blueMarker = Color(0xff98CCFD);

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: SOURCE_LOCATION,
      zoom: CAMERA_ZOOM,
      // tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
    );
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: GoogleMap(
              myLocationEnabled: true,
              compassEnabled: false,
              tiltGesturesEnabled: false,
              markers: _markers,
              mapType: MapType.normal,
              initialCameraPosition: initialCameraPosition,
              onTap: (LatLng loc) {
                setState(
                  () {
                    this.pinPillPosition = PIN_INVISIBLE_POSITION;
                    this.isSelected = false;
                  },
                ); //tapping on the map will dismiss the bottom pill
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                showPinsOnMap();
              },
            ),
          ),
          // Positioned(
          //   top: 50,
          //   left: 0,
          //   right: 0,
          //   child: AnimatedContainer(
          //     duration: Duration(milliseconds: 500),
          //     curve: Curves.easeInOut,
          //     padding: EdgeInsets.all(12),
          //     margin: EdgeInsets.only(
          //       top: 10,
          //       bottom: 10,
          //       left: 20,
          //       right: 20,
          //     ),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(100),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.2),
          //           blurRadius: 10,
          //           offset: Offset.zero,
          //         ),
          //       ],
          //       color: isSelected ? Colors.blue : Colors.white,
          //     ),
          //     child: Row(
          //       children: [
          //         Container(
          //           height: 40,
          //           width: 40,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(50),
          //             border: Border.all(
          //               color: isSelected ? Colors.white : blueMarker,
          //             ),
          //             image: DecorationImage(
          //               image: AssetImage(
          //                 'assets/imgs/aldo.jpeg',
          //               ),
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: 10,
          //         ),
          //         Expanded(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: <Widget>[
          //               Text(
          //                 'Rivaldo Siregar',
          //                 style: poppinsTextStyle.copyWith(
          //                   fontWeight: FontWeight.bold,
          //                   color: isSelected ? Colors.white : greyFont,
          //                 ),
          //               ),
          //               Text(
          //                 'My Location',
          //                 style: poppinsTextStyle.copyWith(
          //                   color: !isSelected ? blueMarker : Colors.white,
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //         Padding(
          //           padding: const EdgeInsets.all(12),
          //           child: Icon(
          //             Icons.car_rental_rounded,
          //             color: !isSelected ? blueMarker : Colors.white,
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          AnimatedPositioned(
            left: 0,
            right: 0,
            bottom: this.pinPillPosition,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset.zero,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            ClipOval(
                              child: Image.asset(
                                'assets/imgs/car_marker_fix.png',
                                height: 30,
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                            // this image icon
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Jakarta International Expo',
                                style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Gedung Pertemuan',
                                style: TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: InkWell(
                            onTap: () async {
                              String url =
                                  'https://goo.gl/maps/s3YSNsZMrPhviNfC6';
                              final Uri _url = Uri.parse(
                                  'https://goo.gl/maps/s3YSNsZMrPhviNfC6');
                              if (await canLaunch(url)) {
                                await launchUrl(_url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Text(
                              'Detail',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        // Image.asset(
                        //   'assets/imgs/marker_car.png',
                        //   height: 50,
                        //   width: 50,
                        // )
                      ],
                    ),
                  ),
                  // Container(
                  //   child: Column(
                  //     children: <Widget>[
                  //       SizedBox(
                  //         height: 20,
                  //       ),
                  //       Row(
                  //         children: <Widget>[
                  //           Container(
                  //             width: 50,
                  //             height: 50,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(50),
                  //               image: DecorationImage(
                  //                 image: AssetImage('assets/imgs/farmer.jpeg'),
                  //               ),
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: 20,
                  //           ),
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: <Widget>[
                  //               Text(
                  //                 'David Aryasetia',
                  //                 style: TextStyle(
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //               Text('aaaaaaaaaaaa\nasssssssssssa')
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('sourcePin'),
            position: currentLocation!,
            icon: sourceIcon!,
            onTap: () {
              setState(() {
                // this.isSelected = true;
                this.pinPillPosition = PIN_VISIBLE_POSITION;
              });
            }),
      );

      // _markers.add(
      //   Marker(
      //       markerId: MarkerId('destinationPin'),
      //       position: destinationLocation!,
      //       icon: destinationIcon!,
      //       onTap: () {
      //         setState(() {
      //           this.pinPillPosition = PIN_VISIBLE_POSITION;
      //         });
      //       }),
      // );
    });
  }
}
