import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyCarousel extends StatelessWidget {
  const MyCarousel({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 185.0,
        viewportFraction: 0.6,
        initialPage: 0,
        enlargeCenterPage: true,
        enlargeFactor: 0.4,
      ),
      items: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 200,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              image: DecorationImage(
                image: AssetImage("assets/img/ki.jpg"),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(127, 188, 186, 186),
                  blurRadius: 30.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                    10.0, // Move to right 10  horizontally
                    25.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: Stack(
              children: [
                CircularPercentIndicator(
                    linearGradient: const LinearGradient(
                        colors: [
                          Color(0xFF3366FF),
                          Color(0xFF00CCFF),
                        ],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                    radius: size.width / 15,
                    backgroundColor: Colors.grey.shade700,
                    lineWidth: 5,
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: 0.1,
                    center: const Icon(
                      Icons.download,
                      color: Colors.amber,
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
