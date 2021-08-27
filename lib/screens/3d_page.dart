import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class OrientationScreen extends StatefulWidget {
  OrientationScreen({Key key}) : super(key: key);

  @override
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<OrientationScreen> {
  UnityWidgetController _unityWidgetController;
  double _sliderValue = 0.0;
  PanelController panelController = PanelController();
  @override
  void initState() {
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Back',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Color(0xFF1F31E4)),
              shadowColor:
                  MaterialStateColor.resolveWith((states) => Color(0xFF1F31E4)),
              elevation: MaterialStateProperty.resolveWith((states) => 5)),
        ),
        body: UnityWidget(
          onUnityCreated: onUnityCreated,
          onUnityMessage: onUnityMessage,
        ));
  }

  void setRotationSpeed(String speed) {
    _unityWidgetController.postMessage(
      'Cube',
      'SetRotationSpeed',
      speed,
    );
  }

  void onUnityMessage(message) {
    setState(() {
      this.panelController.show();
      Future.delayed(Duration(milliseconds: 100), () {
        this.panelController.open();
      });
      // this.panelController.open();
    });
    print('Received message from unity: ${message.toString()}');
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
    // this.panelController.hide();
  }
}
