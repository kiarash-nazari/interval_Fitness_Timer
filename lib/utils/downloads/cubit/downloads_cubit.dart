import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

part 'downloads_state.dart';

class DownloadsCubit extends Cubit<DownloadsState> {
  DownloadsCubit() : super(DownloadsInitial());

  void downloadFile(
      {required String? url, required String name, required int id}) async {
    Dio dio = Dio();

    var directory = await getApplicationDocumentsDirectory();
    CancelToken cancelToken = CancelToken();
    var dir = directory.path;
    try {
      await dio.download(
        cancelToken: cancelToken,
        url!,
        "$dir/$name",
        onReceiveProgress: (count, total) {
          emit(DownloadingState(id: id, percentage: count / total));

          print(count / total);
          if (count == total) {
            emit(DownloadedState());
          }
        },
      );
    } catch (e) {
      return emit(DownloadErrorState(message: e.toString()));
    }
  }
}
