import 'package:camera/camera.dart';
import 'package:safedrive/main.dart';
import 'package:safedrive/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({ Key? key }) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  CameraImage? cameraImage;
  CameraController? cameraController;
  String output = '';

  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
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
      prediction!.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
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
          SizedBox(height: 40.0,),
          Padding(padding: EdgeInsets.all(20),
            child: Container(
              height: size.height*0.7,
              width: size.width,
              child: !cameraController!.value.isInitialized?
              Container():
              AspectRatio(aspectRatio: cameraController!.value.aspectRatio,
              child: CameraPreview(cameraController!),)
            ),
          ),
          Text(output, style: TextStyle(
              color: Colors.black,
              fontSize: 20.0),
          )
        ],
      ),
    );
  }
}