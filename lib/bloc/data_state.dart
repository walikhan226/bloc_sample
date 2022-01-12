import 'package:equatable/equatable.dart';
import 'package:news_app/models/data_model.dart';

abstract class DoctorsStates extends Equatable {}

class DoctorsInitialState extends DoctorsStates {
  @override
  List<Object> get props => [];
}

class DoctorsLoadingState extends DoctorsStates {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class DoctorsLoadedState extends DoctorsStates {
  DoctorsModel doctorsModel;

  DoctorsLoadedState({required this.doctorsModel});
  @override
  List<Object> get props => [doctorsModel];
}

class DoctorsErrorState extends DoctorsStates {
  final String message;
  DoctorsErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
