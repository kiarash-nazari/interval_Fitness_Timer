import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/utils/downloads/cubit/downloads_cubit.dart';
import 'package:interval_timer/utils/players/cubit/players_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CarouselItems extends StatelessWidget {
  const CarouselItems({
    super.key,
    required this.size,
    required this.audioLink,
    required this.bgImag,
    required this.name,
    required this.id,
    required this.percentage,
    required this.isDownloaded,
  });
  final String name;
  final Size size;
  final String audioLink;
  final String bgImag;
  final int id;
  final double percentage;
  final bool isDownloaded;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<PlayersCubit>(context)
            .startMusicOnline(audioLink: audioLink);
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          image: DecorationImage(
            image: AssetImage(bgImag),
            fit: BoxFit.cover,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(126, 65, 65, 65),
              blurRadius: 3.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
              offset: Offset(
                2.0, // Move to right 10  horizontally
                0.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        alignment: Alignment.topLeft,
        child: DownloadProgress(
          size: size,
          url: audioLink,
          name: name,
          id: id,
          percentage: percentage,
        ),
      ),
    );
  }
}

class DownloadProgress extends StatelessWidget {
  const DownloadProgress(
      {super.key,
      required this.size,
      required this.url,
      required this.name,
      required this.id,
      required this.percentage});

  final Size size;
  final String url;
  final String name;
  final int id;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadsCubit, DownloadsState>(
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
          percent: state is DownloadingState ? state.percentageList[id] : 0,
          center: BlocBuilder<DownloadsCubit, DownloadsState>(
            builder: (context, state) {
              if (state is DownloadsLoadingState) {
                return state.id == id
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                      )
                    : const Icon(
                        Icons.download_rounded,
                        color: Colors.amber,
                      );
              } else if (state is DownloadingState) {
                return IconButton(
                    color: Colors.amber,
                    onPressed: () {
                      BlocProvider.of<DownloadsCubit>(context)
                          .downloadFile(url: url, name: name, id: id);
                    },
                    icon: state.whoDownloading[id]
                        ? IconButton(
                            icon: const Icon(Icons.pause_rounded),
                            onPressed: () {
                              BlocProvider.of<DownloadsCubit>(context)
                                  .pauseDownload();
                            },
                          )
                        : const Icon(Icons.download_rounded));
              }
              return IconButton(
                  color: Colors.amber,
                  onPressed: () {
                    BlocProvider.of<DownloadsCubit>(context)
                        .downloadFile(url: url, name: name, id: id);
                  },
                  icon: const Icon(Icons.download_rounded));
            },
          ),
        );
      },
    );
  }
}

bool toggled = false;
