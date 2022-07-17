import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 0,
                      top: 0,
                      right: 15,
                      bottom: 15,
                    ),
                  ),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/cam/rear_cam.jpg',
                        ),
                        fit: BoxFit.cover,
                      )),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 0,
                    right: 15,
                    top: 0,
                    bottom: 15,
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/icons/icons_camera/change_camera.png',
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 0,
                          top: 0,
                          right: 15,
                          bottom: 0,
                        ),
                      ),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/cam/rear_cam.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 0,
                        top: 0,
                        right: 20,
                        bottom: 0,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/icons/icons_camera/left_view.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 0,
                          top: 0,
                          right: 15,
                          bottom: 0,
                        ),
                      ),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/cam/rear_cam.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 0,
                        top: 0,
                        right: 20,
                        bottom: 0,
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'assets/icons/icons_camera/right_view.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
