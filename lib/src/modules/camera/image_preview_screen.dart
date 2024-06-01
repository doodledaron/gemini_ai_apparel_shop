import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_ai_apparel_shop/src/modules/camera/camera_bloc/camera_bloc.dart';
import 'package:go_router/go_router.dart';

class ImagePreviewScreen extends StatefulWidget {
  final String imagePath;

  const ImagePreviewScreen({super.key, required this.imagePath});

  @override
  // ignore: library_private_types_in_public_api
  _ImagePreviewScreenState createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  String? gender;
  double age = 18;
  final TextEditingController desController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<CameraBloc>().add(const CameraInitializeGeminiEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Preview"),
      ),
      body: BlocConsumer<CameraBloc, CameraState>(
        listener: (context, state) {
          if (state is CameraSubmitSuccessState) {
            context.pushNamed("suggestion");
          } else if (state is CameraErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (BuildContext context, CameraState state) {
          if (state is CameraSubmitLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Expanded(
                    child: Image.file(
                      File(widget.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownButtonFormField<String>(
                            decoration:
                                const InputDecoration(labelText: "Gender"),
                            items: ["Male", "Female"]
                                .map((label) => DropdownMenuItem(
                                      value: label,
                                      child: Text(label),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a gender";
                              }
                              return null;
                            },
                          ),
                          Text("Age: ${age.round()}"),
                          Slider(
                            value: age,
                            min: 0,
                            max: 100,
                            divisions: 100,
                            label: age.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                age = value;
                              });
                            },
                          ),
                          TextFormField(
                            controller: desController,
                            decoration:
                                const InputDecoration(labelText: "Description"),
                            maxLines: 3,
                            onChanged: (value) {
                              // handle description change
                              desController.text = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a description";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                //if the form is validated
                                if (_formKey.currentState!.validate()) {
                                  print(gender);
                                  print(age);
                                  print(desController.text);
                                  //TODO add the gemini initialization here and send the data here
                                  BlocProvider.of<CameraBloc>(context).add(
                                    CameraSubmitEvent(
                                        widget.imagePath,
                                        age.toString(),
                                        gender!,
                                        desController.text),
                                  );
                                }
                              },
                              child: const Text("Submit"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
