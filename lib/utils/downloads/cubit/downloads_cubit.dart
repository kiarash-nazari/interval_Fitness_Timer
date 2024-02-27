import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:interval_timer/data/repo/remix_music_data_rep.dart';
import 'package:interval_timer/data/res/remix_music_data_src.dart';
import 'package:path_provider/path_provider.dart';

part 'downloads_state.dart';

class DownloadsCubit extends Cubit<DownloadsState> {
  DownloadsCubit() : super(DownloadsInitial());
  final MusicDataRepository internalMusicDataRep =
      MusicDataRepository(InternalMusicDataSrc());

  Map<int, double> map = {};
  List<Map<int, double>> list = [
    {0: 0},
    {1: 0},
    {2: 0},
    {3: 0},
    {4: 0},
  ];
  void downloadFile(
      {required String? url, required String name, required int id}) async {
    Dio dio = Dio();
    var directory = await getApplicationDocumentsDirectory();
    CancelToken cancelToken = CancelToken();
    var dir = directory.path;
    map[id] = 0;
    list.replaceRange(id, id + 1, [map]);

    try {
      await dio.download(
        cancelToken: cancelToken,
        url!,
        "$dir/$name",
        onReceiveProgress: (count, total) {
          map[id] = count / total;
          print(list);
          emit(DownloadingState(id: id, percentage: count / total, list: list));

          // print(count / total);
          if (count == total) {
            emit(DownloadedState());
          }
        },
      );
    } catch (e) {
      return emit(DownloadErrorState(message: e.toString()));
    }
  }

  void isDownloading() {
    emit(IsDownloadingState(isDownloading: true));
  }
}
