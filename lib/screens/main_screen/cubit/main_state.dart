part of 'main_cubit.dart';

sealed class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

final class MainInitial extends MainState {}

final class NavIndex extends MainState {
  final int index;
  NavIndex(this.index) {
    print(index);
  }

  @override
  List<Object> get props => [index];
}
