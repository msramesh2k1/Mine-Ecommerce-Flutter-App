import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mine/users/views/allitemspage.dart';

import '../../Widgets/Custom_Widgets.dart';

class SizeWidget extends StatefulWidget {
  final int seconds;
  final double height;
  final double width;
  final String url;

  const SizeWidget(
      {required this.seconds,
      required this.height,
      required this.width,
      required this.url});

  @override
  _SizeWidgetState createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _sizeAnimation;

  bool reverse = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: widget.seconds))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController!.repeat(reverse: !reverse);
          reverse = !reverse;
        }
      });

    _sizeAnimation = Tween<double>(begin: widget.height, end: 315.0)
        .animate(_animationController!);
    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sizeAnimation!,
      builder: (context, child) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FINE QUALITY | HAND MADE",
              style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 2),
              ),
            ),
            Box(height: 20, width: 0),
            Text(
              "PERMIUM MODERN & DESIGN FURNITURE WORKS",
              style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 23,
                    letterSpacing: 4),
              ),
            ),
            Box(height: 60, width: 0),
            GestureDetector(
              onTap: (){
                Get.to(AllItemsScreen());
              },
              child: Container(
                height: 45,
                width: 150,
                child: Center(
                  child: Text(
                    "SHOP ITEMS",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 14,
                          letterSpacing: 2),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(204, 191, 171, 1),
                    border: Border.all(color: Color.fromRGBO(204, 191, 171, 1))),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.url), fit: BoxFit.cover)),
        width: _sizeAnimation!.value * 5,
        height: _sizeAnimation!.value,
      ),
    );
  }
}


