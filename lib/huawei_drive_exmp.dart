
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huawei_drive/huawei_drive.dart';

class HuaweiDriveExample extends StatefulWidget {
  const HuaweiDriveExample({ Key? key }) : super(key: key);

  @override
  State<HuaweiDriveExample> createState() => _HuaweiDriveExampleState();
}

class _HuaweiDriveExampleState extends State<HuaweiDriveExample> {
  String? fileId;
  List<String> responsesToDisplay = [];
  Drive? drive;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: InkWell(
        onTap: ()=> _createFile(),
        child: const Text("Huawei Drive Kaydet"))),
    );
  }

  void _createFile() async {
    ByteData byteData = await rootBundle.load("assets/demoImage.jpg");
    Int8List byteArray = byteData.buffer
        .asInt8List(byteData.offsetInBytes, byteData.lengthInBytes);

    DriveFile fileMetadata = DriveFile(
      fileName: "createdFile.jpg",
      mimeType: "image/jpg",
    );

    DriveFileContent fileContent = DriveFileContent(
      type: "image/jpg",
      byteArray: byteArray,
    );

    DriveFile createdFile = await drive!.files.create(FilesRequest.create(
      fileMetadata,
      fileContent: fileContent,
    ));

    log("Created File: $createdFile");

    setState(() {
      responsesToDisplay.add("Created Files Name: " + createdFile.fileName);
      fileId = createdFile.id;
    });
  }
}