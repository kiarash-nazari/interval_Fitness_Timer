import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/data/model/remix_music_model.dart';
import 'package:interval_timer/data/repo/remix_music_internal_data.dart';
import 'package:interval_timer/utils/downloads/cubit/downloads_cubit.dart';
import 'package:interval_timer/utils/players/cubit/players_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyCarousel extends StatelessWidget {
  MyCarousel({
    super.key,
    required this.size,
  });

  final Size size;

  final InternalMusicDataIml internalMusicDataIml = InternalMusicDataIml();
  @override
  Widget build(BuildContext context) {
    List<RemixMusicModel> myList = internalMusicDataIml.myData();
    List<Widget> list = [];
    for (int index = 0; index < myList.length; index++) {
      list.add(GestureDetector(
        onTap: () {
          BlocProvider.of<PlayersCubit>(context)
              .startMusic(audioLink: myList[index].musicLink);
        },
        child: Container(
          width: 200,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
              image: AssetImage(myList[index].bgImag),
              fit: BoxFit.cover,
            ),
            boxShadow: const [
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
              BlocConsumer<DownloadsCubit, DownloadsState>(
                listener: (context, state) {
                  if (state is DownloadingState) {
                    myList[state.id].downloadPercent = state.percentage;
                  }
                },
                builder: (context, state) {
                  return CircularPercentIndicator(
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
                      percent: myList[index].downloadPercent,
                      center: IconButton(
                        color: Colors.amber,
                        onPressed: () {
                          BlocProvider.of<DownloadsCubit>(context).downloadFile(
                              url: myList[index].musicLink,
                              name: myList[index].name,
                              id: index);
                        },
                        icon: const Icon(Icons.download),
                      ));
                },
              ),
            ],
          ),
        ),
      ));
    }

    return CarouselSlider(
        options: CarouselOptions(
          height: 185.0,
          viewportFraction: 0.6,
          initialPage: 0,
          enlargeCenterPage: true,
          enlargeFactor: 0.4,
        ),
        items: list);
  }
}
