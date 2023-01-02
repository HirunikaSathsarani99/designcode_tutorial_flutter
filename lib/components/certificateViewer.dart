import 'dart:math';
import 'package:flutter/material.dart';

class CertificateViewr extends StatefulWidget {
  const CertificateViewr({Key? key}) : super(key: key);

  @override
  State<CertificateViewr> createState() => _CertificateViewrState();
}

class _CertificateViewrState extends State<CertificateViewr> {
  final List<String> certificatePaths = [
    'asset/certificates/certificate-01.png',
    'asset/certificates/certificate-02.png',
    'asset/certificates/certificate-03.png',
  ];
  late Widget CertificateViewr;
  @override
  void initState() {
    super.initState();
    List<Widget> imageChildren = [];
        certificatePaths.reversed.toList().asMap().forEach((index, certificate) {
      int angleDegree;
      if (index == certificatePaths.length - 1) {
        angleDegree = 0;
      } else {
        angleDegree = Random().nextInt(10) - 5;
      }
      imageChildren.add(
        Transform.rotate(
          angle: angleDegree * (pi / 180),
          child: Image.asset(
            certificate,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );
    });
    CertificateViewr = Stack(
      children: imageChildren,
    );
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CertificateViewr,
    );
  }
}
