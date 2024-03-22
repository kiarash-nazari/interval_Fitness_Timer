import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();

  final MusicDataRepository internalMusicDataRep =
      MusicDataRepository(InternalMusicDataSrc());

  List<bool> whoDownloading = [false, false, false, false, false];
  List<double> percentageList = [0, 0, 0, 0, 0];

  List<bool> isDownloadedList = [false, false, false, false, false];
  void isDownloaded() async {
    var directory = await getApplicationDocumentsDirectory();
    try {
      if (await File("${directory.path}/mix1").exists() &&
          sharedPreferencesManager.getInt("mix1") ==
              File("${directory.path}/mix1").lengthSync()) {
        isDownloadedList[0] = true;
        percentageList[0] = 1;
      }
      if (await File("${directory.path}/mix2").exists() &&
          sharedPreferencesManager.getInt("mix2") ==
              File("${directory.path}/mix2").lengthSync()) {
        isDownloadedList[1] = true;
        percentageList[1] = 1;
      }
      if (await File("${directory.path}/mix3").exists() &&
          sharedPreferencesManager.getInt("mix3") ==
              File("${directory.path}/mix3").lengthSync()) {
        isDownloadedList[2] = true;
        percentageList[2] = 1;
      }
      if (await File("${directory.path}/mix4").exists() &&
          sharedPreferencesManager.getInt("mix4") ==
              File("${directory.path}/mix4").lengthSync()) {
        isDownloadedList[3] = true;
        percentageList[3] = 1;
      }
      if (await File("${directory.path}/mix5").exists() &&
          sharedPreferencesManager.getInt("mix5") ==
              File("${directory.path}/mix5").lengthSync()) {
        isDownloadedList[4] = true;
        percentageList[4] = 1;
      }

      emit(IsDownloadedState(isDownloadedList: isDownloadedList));
    } catch (e) {
      emit(DownloadErrorState(message: e.toString()));
    }
  }

  CancelToken _cancelToken = CancelToken();
  void downloadFile(
      {required String? url, required String name, required int id}) async {
    Dio dio = Dio();
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    var directory = await getApplicationDocumentsDirectory();
    var dir = directory.path;

    try {
      emit(DownloadsLoadingState(id: id));
      if (!connectivityResult.contains(ConnectivityResult.mobile) &&
          !connectivityResult.contains(ConnectivityResult.wifi)) {
        emit(NoInternetState());
        // To Not show error snackbar messages several times
        Future.delayed(const Duration(seconds: 1), () {
          emit(DownloadsInitial());
        });
      }

      _cancelToken = CancelToken();

      await dio.download(
        cancelToken: _cancelToken,
        url!,
        "$dir/$name",
        onReceiveProgress: (count, total) async {
          if (!whoDownloading[id]) {
            Future.delayed(const Duration(seconds: 0), () async {
              await sharedPreferencesManager.saveInt(name, total);
            });
          }

          whoDownloading[id] = true;
          percentageList[id] = count / total;

          emit(DownloadingState(
            percentage: count / total,
            whoDownloading: whoDownloading,
            percentageList: percentageList,
          ));
          if (count == total) {
            isDownloadedList[id] = true;

            emit(DownloadedState());
          }
        },
      );
    } catch (e) {
      if (!connectivityResult.contains(ConnectivityResult.mobile) &&
          !connectivityResult.contains(ConnectivityResult.wifi)) {
        emit(NoInternetState());
        // To Not show error snackbar messages several times
        Future.delayed(const Duration(seconds: 1), () {
          emit(DownloadsInitial());
        });
      } else {
        emit(DownloadErrorState(message: e.toString()));
        // To Not show error snackbar messages several times
        Future.delayed(const Duration(seconds: 1), () {
          emit(DownloadsInitial());
        });
      }
    }
  }

  void pauseDownload() {
    _cancelToken.cancel("Download paused");
    Future.delayed(const Duration(seconds: 0), () {
      emit(DownloadsPausedState());
    });
  }

  void isDownloading() {
    emit(IsDownloadingState(isDownloading: true));
  }
}
