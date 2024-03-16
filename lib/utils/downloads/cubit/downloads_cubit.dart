import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:interval_timer/data/repo/remix_music_data_rep.dart';
import 'package:interval_timer/data/res/remix_music_data_src.dart';
import 'package:interval_timer/utils/shared_perfrences_manager.dart';
import 'package:path_provider/path_provider.dart';

part 'downloads_state.dart';

class DownloadsCubit extends Cubit<DownloadsState> {
  DownloadsCubit() : super(DownloadsInitial()) {
    isDownloaded();
  }
  final MusicDataRepository internalMusicDataRep =
      MusicDataRepository(InternalMusicDataSrc());

  List<bool> whoDownloading = [false, false, false, false, false];
  List<double> percentageList = [0, 0, 0, 0, 0];

  Map<int, double> map = {};
  List<Map<int, double>> list = [
    {0: 0},
    {1: 0},
    {2: 0},
    {3: 0},
    {4: 0},
  ];

  void toggled(int id) {
    List<bool> toggledList = [false, false, false, false, false];
    switch (id) {
      case 0:
        toggledList[0] = !toggledList[0];
        break;
      case 1:
        toggledList[1] = !toggledList[1];
        break;
      case 2:
        toggledList[2] = !toggledList[2];

        break;
      case 3:
        toggledList[3] = !toggledList[3];
        break;
      case 4:
        toggledList[4] = !toggledList[4];

        break;
      default:
    }
    emit(ToggledState(toggledList: toggledList));
  }

  void isDownloaded() async {
    var directory = await getApplicationDocumentsDirectory();
    List<bool> isDownloadedList = [false, false, false, false, false];

    if (await File("${directory.path}/mix1").exists() &&
        SharedPreferencesManager().getInt("mix1") ==
            File("${directory.path}/mix1").lengthSync()) {
      isDownloadedList[0] = true;
    }
    if (await File("${directory.path}/mix2").exists()) {
      isDownloadedList[1] = true;
    }
    if (await File("${directory.path}/mix3").exists()) {
      isDownloadedList[2] = true;
    }
    if (await File("${directory.path}/mix4").exists()) {
      isDownloadedList[3] = true;
    }
    if (await File("${directory.path}/mix5").exists()) {
      isDownloadedList[4] = true;
    }

    emit(IsDownloadedState(isDownloadedList: isDownloadedList));
  }

  final CancelToken _cancelToken = CancelToken();
  void downloadFile(
      {required String? url, required String name, required int id}) async {
    Dio dio = Dio();
    var directory = await getApplicationDocumentsDirectory();
    var dir = directory.path;
    map[id] = 0;
    list.replaceRange(id, id + 1, [map]);

    try {
      emit(DownloadsLoadingState(id: id));
      await dio.download(
        cancelToken: _cancelToken,
        url!,
        "$dir/$name",
        onReceiveProgress: (count, total) {
          whoDownloading[id] = true;
          percentageList[id] = count / total;
          list[id][id] = count / total;
          SharedPreferencesManager().saveInt(name, total);
          map[id] = count / total;
          emit(DownloadingState(
            id: id,
            percentage: count / total,
            list: list,
            whoDownloading: whoDownloading,
            percentageList: percentageList,
          ));

          if (count == total) {
            emit(DownloadedState());
          }
        },
      );
    } catch (e) {
      return emit(DownloadErrorState(message: e.toString()));
    }
  }

  void pauseDownload() {
    _cancelToken.cancel("Download paused");
    emit(DownloadingState(
      id: 2,
      percentage: 0,
      list: list,
      whoDownloading: whoDownloading,
      percentageList: percentageList,
    ));
  }

  void isDownloading() {
    emit(IsDownloadingState(isDownloading: true));
  }
}
