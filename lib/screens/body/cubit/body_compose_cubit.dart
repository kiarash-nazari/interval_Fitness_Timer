import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'body_compose_state.dart';

class BodyComposeCubit extends Cubit<double> {
  BodyComposeCubit() : super(0.5);
  double myPercentage = 0;

  void updatePercentage({required double percentage}) {
    emit((percentage));
    myPercentage = percentage;
    print(myPercentage);
  }
}
