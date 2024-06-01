import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemini_ai_apparel_shop/src/utils/api.dart';
import 'package:gemini_ai_apparel_shop/src/utils/gemini_response_conversion.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  GenerativeModel? _model;
  Map<String, String>? _response;
  get response => _response;

  CameraBloc() : super(CameraInitial()) {
    on<CameraInitializeGeminiEvent>(cameraInitializeGeminiEvent);
    on<CameraSubmitEvent>(cameraSubmitEvent);
  }

  FutureOr<void> cameraInitializeGeminiEvent(
      CameraInitializeGeminiEvent event, Emitter<CameraState> emit) {
    const apiKey = geminiApiKey;
    if (apiKey.isEmpty) {
      print('No \$API_KEY environment variable');
      exit(1);
    }
    // For text-and-image input (multimodal), use the gemini-pro-vision model
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      safetySettings: [
        SafetySetting(
          HarmCategory.harassment,
          HarmBlockThreshold.high,
        ),
        SafetySetting(
          HarmCategory.hateSpeech,
          HarmBlockThreshold.high,
        ),
      ],
    );

    emit(const CameraInitializedState());
  }

  FutureOr<void> cameraSubmitEvent(
      CameraSubmitEvent event, Emitter<CameraState> emit) async {
    if (_model == null) {
      emit(const CameraErrorState('Model not initialized'));
      return null;
    }
    //get the image
    try {
      emit(const CameraSubmitLoadingState());
      final image = await File(event.imagePath).readAsBytes();
      final imagePart = DataPart('image/jpeg', image);

      final response = await _model!.generateContent([
        Content.multi([
          imagePart,
          TextPart("""
        Based on this image provided. Comment and describe what outfit style this is (In a lively and playful way, not more than 5 lines).
        Based on the person's appearance, choose another style from casual, streetwear, formal wear, and activewear that might suit the person
        explain why the suggested style suits the person.

        For casual wear -> 0
        For Formal wear -> 1
        For Active wear -> 2
        For Street wear -> 3

        age: ${event.age}
        gender: ${event.gender}
        description: ${event.description}

        reply me in this form:
        Image description:
        Suggestion: (answer me in numbers)
        Reason:
          """),
        ])
      ]);
      _response = parseResponse(response.text!);
      _response!["suggestion"] =
          convertNumberToString(_response!["suggestion"]!);

      emit(const CameraSubmitSuccessState());
    } catch (e) {
      emit(CameraErrorState('Error from Gemini API: $e'));
    }
  }

  String convertNumberToString(String number) {
    switch (number) {
      case "0":
        return "Casual";
      case "1":
        return "Formal";
      case "2":
        return "Active";
      case "3":
        return "Street wear";
      default:
        return "Casual";
    }
  }
}
