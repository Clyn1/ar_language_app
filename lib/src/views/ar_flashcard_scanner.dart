// File: lib/src/views/ar_flashcard_scanner.dart

import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ARFlashcardScanner extends StatefulWidget {
  @override
  _ARFlashcardScannerState createState() => _ARFlashcardScannerState();
}

class _ARFlashcardScannerState extends State<ARFlashcardScanner> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  final FlutterTts tts = FlutterTts();

  // Mapping of flashcard image names to 3D models
  final Map<String, String> modelMap = {
    'apple_card': 'assets/3d_models/apple.glb',
    'dog_card': 'assets/3d_models/dog.glb',
    'car_card': 'assets/3d_models/car.glb',
    'hand_card': 'assets/3d_models/hand.glb',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AR Flashcard Scanner'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ARView(
        onARViewCreated: onARViewCreated,
      ),
    );
  }

  void onARViewCreated(
    ARSessionManager sessionManager,
    ARObjectManager objectManager,
    ARAnchorManager anchorManager,
    ARLocationManager locationManager,
  ) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;

    arSessionManager.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: "assets/images/plane.png",
      showWorldOrigin: true,
    );

    arObjectManager.onInitialize();

    // Simulated detection - in real app, this should be image recognition
    Future.delayed(Duration(seconds: 2), () => triggerAR('apple_card'));
  }

  Future<void> triggerAR(String cardName) async {
    final modelPath = modelMap[cardName];
    if (modelPath != null) {
      // Add 3D model to scene
      var node = ARNode(
        type: NodeType.webGLB,
        uri: modelPath,
        scale: Vector3(0.3, 0.3, 0.3),
        position: Vector3(0.0, 0.0, -0.5),
        rotation: Vector4(0, 1, 0, 0),
      );
      await arObjectManager.addNode(node);

      // Speak label
      String label = cardName.replaceAll('_card', '');
      await tts.setLanguage("en-US");
      await tts.setSpeechRate(0.5);
      await tts.speak(label);
    }
  }

  @override
  void dispose() {
    arObjectManager.dispose();
    arSessionManager.dispose();
    super.dispose();
  }
}
