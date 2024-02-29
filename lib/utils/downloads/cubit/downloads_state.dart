part of 'downloads_cubit.dart';

sealed class DownloadsState extends Equatable {
  const DownloadsState();

  @override
  List<Object> get props => [];
}

final class DownloadsInitial extends DownloadsState {}

final class DownloadingState extends DownloadsState {
  final int id;
  final double percentage;
  final List<Map<int, double>> list;

  const DownloadingState(
      {required this.list, required this.percentage, required this.id});

  @override
  List<Object> get props => [id, percentage, list];
}

final class DownloadedState extends DownloadsState {}

final class DownloadErrorState extends DownloadedState {
  final String message;

  DownloadErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

final class IsDownloadingState extends DownloadedState {
  final bool isDownloading;

  IsDownloadingState({required this.isDownloading});

  @override
  List<Object> get props => [isDownloading];
}

final class IsDownloadedState extends DownloadedState {
  final List<bool> isDownloadedList;

  IsDownloadedState({required this.isDownloadedList});

  @override
  List<Object> get props => [isDownloadedList];
}

final class ToggledState extends DownloadedState {
  final List<bool> toggledList;

  ToggledState({required this.toggledList});

  @override
  List<Object> get props => [toggledList];
}
