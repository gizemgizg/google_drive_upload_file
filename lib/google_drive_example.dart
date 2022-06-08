/*import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as gdrive;
import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleDriveExample extends StatefulWidget {
  const GoogleDriveExample({Key? key}) : super(key: key);

  @override
  State<GoogleDriveExample> createState() => _GoogleDriveExampleState();
}

class _GoogleDriveExampleState extends State<GoogleDriveExample> {
  final List<String> _scopes = [gdrive.DriveApi.driveScope];
  String clientId =
      '551758229926-f3dnf0vtpmk6rjv6cr2gmdh6qa0a8ms6.apps.googleusercontent.com';

  getHttpClient() async {
    return await clientViaUserConsent(ClientId(clientId), _scopes, prompt);
  }

  prompt(String url) {
    // ignore: deprecated_member_use
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: () => pickAndUploadFile(),
        child: const Text("Google Drive Save"),
      )),
    );
  }

  upload(File file) async {
    var client = await getHttpClient();
    var drive = gdrive.DriveApi(client);
    var res = await drive.files.create(
      gdrive.File(),
      uploadMedia: gdrive.Media(file.openRead(), file.lengthSync()),
    );

    print('Response here ${res.toJson()}');
  }

  pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      await upload(file);
    } else {
      // User canceled the picker
    }
  }
}
*/