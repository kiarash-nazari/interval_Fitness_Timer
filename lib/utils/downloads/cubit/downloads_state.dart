part of 'downloads_cubit.dart';

sealed class DownloadsState extends Equatable {
  const DownloadsState();

  @override
  List<Object> get props => [];
}

final class DownloadsInitial extends DownloadsState {}

final class DownloadingState extends DownloadsState {
  final double percentage;

  const DownloadingState({required this.percentage});

  @override
  List<Object> get props => [percentage];
}

final class DownloadedState extends DownloadsState {}

final class DownloadErrorState extends DownloadedState {
  final String message;

  DownloadErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
