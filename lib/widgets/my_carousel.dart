import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:interval_timer/widgets/carousel_items.dart';

class MyCarousel extends StatelessWidget {
  MyCarousel({
    super.key,
    required this.size,
  });

  final Size size;

  final List items = [
    const CarouselItems(
      audioLink: "https://luxafarin.com/wp-content/uploads/2024/02/mix1.mp3",
      bgImag: "assets/img/cover1.jpg",
      name: "mix1",
      id: 0,
      percentage: 0,
      isDownloaded: false,
    ),
    const CarouselItems(
      audioLink: "https://luxafarin.com/wp-content/uploads/2024/02/mix2.mp3",
      bgImag: "assets/img/cover2.jpg",
      name: "mix2",
      id: 1,
      percentage: 0,
      isDownloaded: false,
    ),
    const CarouselItems(
      audioLink: "https://luxafarin.com/wp-content/uploads/2024/02/mix3.mp3",
      bgImag: "assets/img/cover3.jpg",
      name: "mix3",
      id: 2,
      percentage: 0,
      isDownloaded: false,
    ),
    const CarouselItems(
      audioLink: "https://luxafarin.com/wp-content/uploads/2024/02/mix4.mp3",
      bgImag: "assets/img/cover4.jpg",
      name: "mix4",
      id: 3,
      percentage: 0,
      isDownloaded: false,
    ),
    const CarouselItems(
      audioLink: "https://luxafarin.com/wp-content/uploads/2024/02/mix5.mp3",
      bgImag: "assets/img/cover5.jpg",
      name: "mix5",
      id: 4,
      percentage: 0,
      isDownloaded: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 185.0,
        viewportFraction: 0.6,
        enableInfiniteScroll: false,
        initialPage: 1,
        enlargeCenterPage: true,
        enlargeFactor: 0.4,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return items[index];
      },
    );
  }
}
