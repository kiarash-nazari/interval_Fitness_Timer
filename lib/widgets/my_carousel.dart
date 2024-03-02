import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/utils/downloads/cubit/downloads_cubit.dart';
import 'package:interval_timer/widgets/carousel_items.dart';
import 'package:path_provider/path_provider.dart';

class MyCarousel extends StatelessWidget {
  const MyCarousel({
    super.key,
    required this.size,
  });

  final Size size;

  Future<bool> myDownloaded() async {
    var directory = await getApplicationDocumentsDirectory();

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadsCubit, DownloadsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CarouselSlider(
            options: CarouselOptions(
              height: 185.0,
              viewportFraction: 0.6,
              initialPage: 0,
              enlargeCenterPage: true,
              enlargeFactor: 0.4,
            ),
            items: [
              CarouselItems(
                size: size,
                audioLink:
                    "https://luxafarin.com/wp-content/uploads/2024/02/mix1.mp3",
                bgImag: "assets/img/cover1.jpg",
                name: "mix1",
                id: 0,
                percentage: state is DownloadingState ? state.list[0][0]! : 0,
                isDownloaded: state is IsDownloadedState
                    ? state.isDownloadedList[0]
                    : false,
              ),
              CarouselItems(
                size: size,
                audioLink:
                    "https://luxafarin.com/wp-content/uploads/2024/02/mix2.mp3",
                bgImag: "assets/img/cover2.jpg",
                name: "mix2",
                id: 1,
                percentage: state is DownloadingState ? state.list[1][1]! : 0,
                isDownloaded: state is IsDownloadedState
                    ? state.isDownloadedList[1]
                    : false,
              ),
              CarouselItems(
                size: size,
                audioLink:
                    "https://luxafarin.com/wp-content/uploads/2024/02/mix3.mp3",
                bgImag: "assets/img/cover3.jpg",
                name: "mix3",
                id: 2,
                percentage: state is DownloadingState ? state.list[2][2]! : 0,
                isDownloaded: state is IsDownloadedState
                    ? state.isDownloadedList[2]
                    : false,
              ),
              CarouselItems(
                size: size,
                audioLink:
                    "https://luxafarin.com/wp-content/uploads/2024/02/mix4.mp3",
                bgImag: "assets/img/cover4.jpg",
                name: "mix4",
                id: 3,
                percentage: state is DownloadingState ? state.list[3][3]! : 0,
                isDownloaded: state is IsDownloadedState
                    ? state.isDownloadedList[3]
                    : false,
              ),
              CarouselItems(
                size: size,
                audioLink:
                    "https://luxafarin.com/wp-content/uploads/2024/02/mix5.mp3",
                bgImag: "assets/img/cover5.jpg",
                name: "mix5",
                id: 4,
                percentage: state is DownloadingState ? state.list[4][4]! : 0,
                isDownloaded: state is IsDownloadedState
                    ? state.isDownloadedList[4]
                    : false,
              ),
            ]);
      },
    );
  }
}
