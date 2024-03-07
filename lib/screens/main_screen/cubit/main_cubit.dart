import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  int indexedStackIndex = 0;

  void changeIndex(int index) {
    indexedStackIndex = index;
    emit(NavIndex(index));
  }
}
