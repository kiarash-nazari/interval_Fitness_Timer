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
  });
  final String name;
  final Size size;
  final String audioLink;
  final String bgImag;
  final int id;
  final double percentage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<PlayersCubit>(context).startMusic(audioLink: audioLink);
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          image: DecorationImage(
            image: AssetImage(bgImag),
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
              radius: size.width / 15,
              backgroundColor: Colors.grey.shade700,
              lineWidth: 5,
              circularStrokeCap: CircularStrokeCap.round,
              percent: percentage,
              center: IconButton(
                color: Colors.amber,
                onPressed: () {
                  BlocProvider.of<DownloadsCubit>(context)
                      .downloadFile(url: audioLink, name: name, id: id);
                },
                icon: const Icon(Icons.download),
              ),
            )
          ],
        ),
      ),
    );
  }
}
