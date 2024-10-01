import 'dart:html' as html;
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ibn_abas_inst/model/user_model.dart';

class ImageUploader extends StatefulWidget {
  const ImageUploader({super.key});

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  Uint8List? _imageBytes; // To hold the image bytes
  String? _fileName; // To hold the image file name

  Future<void> _pickImage() async {
    // Open the file picker to select an image
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      // Get the file bytes and name
      Uint8List? fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;

      setState(() {
        _imageBytes = fileBytes;
        _fileName = fileName;
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageBytes != null && _fileName != null) {
      // Define your server URL
      String uploadUrl =
          'https://${Variable.staticIp}/upload_image.php'; // Change to your server URL

      // Create the multipart request
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));

      // Attach the image file
      request.files.add(
        http.MultipartFile.fromBytes(
          'file', // Field name on the server
          _imageBytes!,
          filename: _fileName,
        ),
      );

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Image upload failed with status: ${response.statusCode}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Upload in Flutter Web'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Select Image'),
            ),
            if (_imageBytes != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.memory(_imageBytes!, height: 200),
              ),
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
