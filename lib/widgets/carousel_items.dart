import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/utils/downloads/cubit/downloads_cubit.dart';
import 'package:interval_timer/utils/players/cubit/players_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CarouselItems extends StatefulWidget {
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
  State<CarouselItems> createState() => _CarouselItemsState();
}

bool toggled = false;

class _CarouselItemsState extends State<CarouselItems> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<PlayersCubit>(context)
            .startMusicOnline(audioLink: widget.audioLink);
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          image: DecorationImage(
            image: AssetImage(widget.bgImag),
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
              radius: widget.size.width / 15,
              backgroundColor: Colors.grey.shade700,
              lineWidth: 5,
              circularStrokeCap: CircularStrokeCap.round,
              percent: widget.isDownloaded ? 1 : widget.percentage,
              center: IconButton(
                color: Colors.amber,
                onPressed: () {
                  if (widget.isDownloaded) {
                    setState(() {
                      toggled = !toggled;
                    });
                    if (toggled) {
                      BlocProvider.of<PlayersCubit>(context)
                          .startMusicFile(name: widget.name);
                    } else if (!toggled) {
                      BlocProvider.of<PlayersCubit>(context).pauseMusic();
                    }
                  } else {
                    BlocProvider.of<DownloadsCubit>(context).downloadFile(
                        url: widget.audioLink,
                        name: widget.name,
                        id: widget.id);
                  }
                },
                icon: Icon(widget.isDownloaded && !toggled
                    ? Icons.play_arrow
                    : toggled
                        ? Icons.pause
                        : Icons.download),
              ),
            )
          ],
        ),
      ),
    );
  }
}
