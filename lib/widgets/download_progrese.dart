import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interval_timer/res/colors.dart';
import 'package:interval_timer/utils/downloads/cubit/downloads_cubit.dart';
import 'package:interval_timer/utils/players/cubit/players_cubit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => DownloadsCubit()),
          BlocProvider(create: (context) => PlayersCubit()),
        ],
        child: BlocBuilder<DownloadsCubit, DownloadsState>(
          builder: (BuildContext context, DownloadsState state) {
            if (state is DownloadsLoadingState) {
              return CircularPercentIndicator(
                radius: size.width / 15,
                backgroundColor: Colors.grey.shade700,
                center: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                ),
              );
            } else if (state is DownloadingState) {
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
                  percent: BlocProvider.of<DownloadsCubit>(context)
                      .percentageList[id],
                  center: IconButton(
                    color: Colors.amber,
                    onPressed: () {
                      BlocProvider.of<DownloadsCubit>(context).pauseDownload();
                    },
                    icon: state.whoDownloading[id]
                        ? const Icon(Icons.pause_rounded)
                        : const Icon(Icons.play_arrow_rounded),
                  ));
            } else if (state is DownloadErrorState) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Flushbar(
                  icon: Icon(MdiIcons.alert, color: Colors.white),
                  margin: const EdgeInsets.all(10),
                  borderRadius: BorderRadius.circular(10),
                  blockBackgroundInteraction: false,
                  forwardAnimationCurve: Curves.easeOutBack,
                  reverseAnimationCurve: Curves.easeOutBack,
                  messageText: const Text(
                    "Sorry we are updating server try later",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  duration: const Duration(seconds: 3),
                  backgroundGradient:
                      const LinearGradient(colors: AppColors.grRest),
                ).show(context);
              });
            } else if (state is NoInternetState) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Flushbar(
                  icon: Icon(MdiIcons.alert, color: Colors.white),
                  margin: const EdgeInsets.all(10),
                  borderRadius: BorderRadius.circular(10),
                  blockBackgroundInteraction: false,
                  forwardAnimationCurve: Curves.easeOutBack,
                  reverseAnimationCurve: Curves.easeOutBack,
                  messageText: const Text(
                    "Internet not connected try again",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  duration: const Duration(seconds: 3),
                  backgroundGradient:
                      const LinearGradient(colors: AppColors.grRest),
                ).show(context);
              });
            }

            return BlocBuilder<PlayersCubit, PlayersState>(
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
                    percent: BlocProvider.of<DownloadsCubit>(context)
                        .percentageList[id],
                    center: state is IsPlayingAudio
                        ? IconButton(
                            icon: const Icon(Icons.pause),
                            color: Colors.amber,
                            onPressed: () {
                              BlocProvider.of<PlayersCubit>(context)
                                  .pauseMusic();
                            },
                          )
                        : state is IsNotPlayingAudio
                            ? IconButton(
                                icon: const Icon(Icons.play_arrow_rounded),
                                color: Colors.amber,
                                onPressed: () {
                                  BlocProvider.of<PlayersCubit>(context)
                                      .resumeMusic(name);
                                },
                              )
                            : BlocProvider.of<DownloadsCubit>(context)
                                    .isDownloadedList[id]
                                ? IconButton(
                                    icon: const Icon(Icons.play_arrow_rounded),
                                    color: Colors.amber,
                                    onPressed: () {
                                      BlocProvider.of<PlayersCubit>(context)
                                          .startMusicFile(name: name);
                                    },
                                  )
                                : IconButton(
                                    icon: const Icon(Icons.download_rounded),
                                    color: Colors.amber,
                                    onPressed: () {
                                      BlocProvider.of<DownloadsCubit>(context)
                                          .downloadFile(
                                              url: url, name: name, id: id);
                                    },
                                  ));
              },
            );
          },
        ));
  }
}
