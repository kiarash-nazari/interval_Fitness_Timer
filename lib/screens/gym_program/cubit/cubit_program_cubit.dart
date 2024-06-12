import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';

part 'cubit_program_state.dart';

class CubitProgram extends Cubit<CubitProgramState> {
  CubitProgram() : super(CubitProgramInitial()) {
    Timer(const Duration(seconds: 1), () {
      emit(CubitProgramInitial()); // You can emit a different state here
    });
  }

  bool isMoved = false;

  void togglePosition() {
    emit(MoveThePosition(isMoved: isMoved));
    isMoved = !isMoved;
  }
}
