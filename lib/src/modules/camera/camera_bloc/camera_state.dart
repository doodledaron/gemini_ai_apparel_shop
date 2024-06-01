part of 'camera_bloc.dart';

sealed class CameraState extends Equatable {
  const CameraState();

  @override
  List<Object> get props => [];
}

final class CameraInitial extends CameraState {}

final class CameraInitializedState extends CameraState {


  const CameraInitializedState();
  @override
  List<Object> get props => [];

}

class CameraErrorState extends CameraState {
  final String error;

  const CameraErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class CameraSubmitSuccessState extends CameraState {


  const CameraSubmitSuccessState();

  @override
  List<Object> get props => [];
}