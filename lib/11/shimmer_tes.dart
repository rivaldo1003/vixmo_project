import 'package:flutter/material.dart';

class BlinkingTes extends StatefulWidget {
  @override
  State<BlinkingTes> createState() => _BlinkingTesState();
}

class _BlinkingTesState extends State<BlinkingTes>
    with SingleTickerProviderStateMixin {
  Animation<Color?>? animation;
  Animation<Color?>? animation2;
  AnimationController? controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller!, curve: Curves.linear);
    animation =
        ColorTween(begin: Colors.white, end: Color(0xff06DC69)).animate(curve);
    animation2 =
        ColorTween(begin: Colors.black, end: Colors.white).animate(curve);

    animation!.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          controller!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller!.forward();
        }
        setState(() {});
      },
    );
    animation2!.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          controller!.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller!.forward();
        }
        setState(() {});
      },
    );
    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Blink Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animation!,
              builder: (BuildContext context, Widget? child) {
                return Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: animation!.value,
                    shape: BoxShape.circle,
                    // border: Border.all(color: Colors.blue, width: 10),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/icons/icons_home/battery_new_only.png',
                      height: 100,
                      width: 100,
                      color: animation2!.value,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    controller!.dispose();
    super.dispose();
  }
}
//
// class AnimationTes extends StatefulWidget {
//   @override
//   State<AnimationTes> createState() => _AnimationTesState();
// }
//
// class _AnimationTesState extends State<AnimationTes>
//     with SingleTickerProviderStateMixin {
//   Animation<Color?>? animation;
//   AnimationController? controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(
//       duration: Duration(
//         milliseconds: 500,
//       ),
//       vsync: this,
//     );
//     final CurvedAnimation curve = CurvedAnimation(
//       parent: controller!,
//       curve: Curves.linear,
//     );
//     animation =
//         ColorTween(begin: Colors.yellow, end: Colors.green).animate(curve);
//     animation!.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         controller!.reverse();
//       } else if (status == AnimationStatus.dismissed) {
//         controller!.forward();
//       }
//       setState(() {});
//     });
//     controller!.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedBuilder(
//         animation: animation!,
//         builder: (BuildContext context, Widget? child) {
//           return Container(
//             color: animation!.value,
//             child: InkWell(
//               onTap: () {},
//               child: Text('Klik me'),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void dispose() {
//     controller!.dispose();
//     super.dispose();
//   }
// }
