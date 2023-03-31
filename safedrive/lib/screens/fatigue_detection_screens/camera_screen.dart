import 'package:camera/camera.dart';
import 'package:safedrive/main.dart';
import 'package:safedrive/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

class CameraScreen extends StatefulWidget {
  const CameraScreen({ Key? key }) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';
  int fatigueCounter = 0;
  int alarmCounter = 0;

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();

    //Resets the alarm counter every 30 seconds
    Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {
        alarmCounter = 0;
      });
    });
  }

  loadCamera() {
    cameraController = CameraController(camera![1], ResolutionPreset.high);
    cameraController!.initialize().then((value) {
      if(!mounted) {
        return;
      }
      else{
        setState(() {
          cameraController!.startImageStream((imageStream){
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if(cameraImage != null) {
      var prediction = await Tflite.runModelOnFrame(bytesList: cameraImage!.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: cameraImage!.height,
      imageWidth: cameraImage!.width,
      imageMean: 127.5,
      imageStd: 127.5,
      rotation: 90,
      numResults: 2,
      threshold: 0.1,
      asynch: true
      );
      for (var element in prediction!) {
        setState(() {
          output = element['label'];
          if (output == '1 Fatigue') {
            fatigueCounter++;
          }
          if (fatigueCounter > 30) {
            final player = AudioPlayer();
            player.play(
              AssetSource('alarm.mp3'),
            );
            //Pause alarm after 5 seconds
            Timer(const Duration(seconds: 5), () => player.pause());
            fatigueCounter = 0;
            alarmCounter++;
          }
        });
      }
    }
  }
  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt"
    );
  }
  @override
  Widget build(BuildContext context) {
    final size = UtilFunction.mediaQuery(context);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40.0,),
          Padding(padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: size.height*0.7,
              width: size.width,
              child: !cameraController!.value.isInitialized?
              Container():
              AspectRatio(aspectRatio: cameraController!.value.aspectRatio,
              child: CameraPreview(cameraController!),)
            ),
          ),
          Text(output, style: const TextStyle(
              color: Colors.black,
              fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}