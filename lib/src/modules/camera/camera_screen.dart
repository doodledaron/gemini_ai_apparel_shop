import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gemini_ai_apparel_shop/constants/colors.dart';
import 'package:go_router/go_router.dart';

import 'image_preview_screen.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraScreen({super.key, required this.cameras});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  CameraController? _controller;
  String imagePath = "";

  bool isFlashOn = false;
  bool isRearCamera = true;

  @override
  void initState() {
    super.initState();

    initializeCamera(0);
  }

  void initializeCamera(int camera) async {
    //0 -> back camera
    //1 -> front camera

    _controller = CameraController(widget.cameras[camera], ResolutionPreset.max,
        enableAudio: false);
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      floatingActionButton: imagePath == ""
          ? FloatingActionButton(
              backgroundColor: primaryColor,
              foregroundColor: Colors.black,
              shape: const CircleBorder(),
              onPressed: () async {
                try {
                  final image = await _controller!.takePicture();
                  setState(() {
                    imagePath = image.path;
                  });
                } catch (e) {
                  print(e);
                }
              },
              child: const Icon(Icons.camera),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Stack(children: [
          if (imagePath == "") ...[
            buildCameraPreview(),
            buildControls(),
          ] else ...[
            buildImagePreview(),
            buildImageActions()
          ],
        ]),
      ),
    );
  }

  Widget buildCameraPreview() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CameraPreview(_controller!),
        ),
      ),
    );
  }

  Widget buildImagePreview() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.file(
        File(imagePath),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildControls() {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        children: [
          buildFlashControl(),
          buildCameraSwitchControl(),
        ],
      ),
    );
  }

  Widget buildFlashControl() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isFlashOn = !isFlashOn;
            _controller!.setFlashMode(
              isFlashOn ? FlashMode.auto : FlashMode.off,
            );
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(153, 255, 255, 255),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(isFlashOn ? Icons.flash_auto : Icons.flash_off),
          ),
        ),
      ),
    );
  }

  Widget buildCameraSwitchControl() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isRearCamera = !isRearCamera;
          });
          initializeCamera(isRearCamera ? 0 : 1);
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(153, 255, 255, 255),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              isRearCamera ? Icons.camera_rear : Icons.camera_front,
            ),
          ),
        ),
      ),
    );
  }

//retake or confirm
  Widget buildImageActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  imagePath = "";
                  initializeCamera(isRearCamera ? 0 : 1);
                });
              },
              child: Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                    child: Text(
                  "Retake",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                )),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.pushNamed("imagepreview", extra: imagePath);
              },
              child: Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Center(
                    child: Text(
                  "Confirm",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                )),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
