import 'dart:io';

import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Preview"),
      ),
      body: Padding(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: "Gender"),
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
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          print(gender);
                          print(age);
                          print(desController.text);
                        },
                        child: Text("Submit"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
