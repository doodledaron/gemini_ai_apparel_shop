part of 'camera_bloc.dart';

sealed class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object> get props => [];
}

class CameraInitializeGeminiEvent extends CameraEvent {
  const CameraInitializeGeminiEvent();
  @override
  List<Object> get props => [];
}

class CameraInitialEvent extends CameraEvent {
  const CameraInitialEvent();
  @override
  List<Object> get props => [];
}

class CameraSubmitEvent extends CameraEvent {
  final String imagePath;
  final String age;
  final String gender;
  final String description;
  const CameraSubmitEvent(this.imagePath, this.age, this.gender, this.description);
  @override
  List<Object> get props => [imagePath, age, gender,description];
}
