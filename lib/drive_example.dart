import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart' as signIn;
import 'package:http/http.dart' as http;

class DriveExample extends StatefulWidget {
  const DriveExample({Key? key}) : super(key: key);

  @override
  State<DriveExample> createState() => _DriveExampleState();
}

class _DriveExampleState extends State<DriveExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: InkWell(
        onTap: ()=> googleDriveUpload(),
        child: const Text("Drive Kaydet"))),
    );
  }
   //Google Drive upload
  Future<void> googleDriveUpload() async{
    final googleSignIn =
        signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.driveScope]);
    final signIn.GoogleSignInAccount? account = await  googleSignIn.signIn();
    print("User account $account");

    final authHeaders = await account?.authHeaders;
    final authenticateClient = GoogleAuthClient(authHeaders!);
    final driveApi = drive.DriveApi(authenticateClient);

    final Stream<List<int>> mediaStream = Future.value([104, 105]).asStream();
    var media = drive.Media(mediaStream, 2);
    var driveFile = drive.File();
    driveFile.name = "hello_world.txt";
    final result = await driveApi.files.create(driveFile, uploadMedia: media);
    print("Upload result: $result");
  }
}
class GoogleAuthClient extends http.BaseClient {
  final Map<String, String> _headers;

  final http.Client _client =  http.Client();

  GoogleAuthClient(this._headers);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request..headers.addAll(_headers));
  }
}