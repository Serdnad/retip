import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retip/widgets/big_text_header.dart';
import 'package:retip/widgets/header/close_icon_button.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  void scan() {}

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller!.resumeCamera();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              BigTextHeader(
                title: "Scan QR code",
                subtitle: "Point camera at QR code on receipt",
                action: CloseIconButton(),
              ),
              SizedBox(height: 16),
              // QR
            ],
          ),
        ),
      ),
    );
  }
}
