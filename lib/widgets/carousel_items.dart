import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/utils/players/cubit/players_cubit.dart';
import 'package:interval_timer/widgets/download_progrese.dart';

class CarouselItems extends StatelessWidget {
  const CarouselItems({
    super.key,
    required this.audioLink,
    required this.bgImag,
    required this.name,
    required this.id,
    required this.percentage,
    required this.isDownloaded,
  });
  final String name;
  final String audioLink;
  final String bgImag;
  final int id;
  final double percentage;
  final bool isDownloaded;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    bool toggle = false;

    return BlocProvider(
      create: (context) => PlayersCubit(),
      child: GestureDetector(
        onTap: () {
          toggle
              ? BlocProvider.of<PlayersCubit>(context).pauseMusic()
              : BlocProvider.of<PlayersCubit>(context)
                  .startMusicOnline(audioLink: audioLink);
          toggle = !toggle;
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
      ),
    );
  }
}
