/*import "package:async/async.dart";

import 'package:path/path.dart';

import 'dart:io';

import 'package:http/http.dart' as http;

Future addProduct(File imageFile) async{
// ignore: deprecated_member_use
  var stream= new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length= await imageFile.length();
  var uri = Uri.parse("http://10.0.2.2/foodsystem/uploadg.php");

  var request = new http.MultipartRequest("POST", uri);

  var multipartFile = new http.MultipartFile("image", stream, length, filename: basename(imageFile.path));

  request.files.add(multipartFile);
  request.fields['productname'] = controllerName.text;
  request.fields['productprice'] = controllerPrice.text;
  request.fields['producttype'] = controllerType.text;
  request.fields['product_owner'] = globals.restaurantId;

  var respond = await request.send();
  if(respond.statusCode==200){
    print("Image Uploaded");
  }else{
    print("Upload Failed");
  }*/
/*import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();

  // Implementing the image picker
  Future<void> _pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image upload'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(children: [
              Center(
                child: GestureDetector(
                  child: const Text('Select An Image'),
                  //onPressed: _openImagePicker,
                  //onTap:()=> Get.find<ImageController>().pickImage(),
                  onTap: () => _pickImage(),
                ),
              ),
              const SizedBox(height: 35),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
                child: _pickedFile != null
                    ? Image.file(
                        File(_pickedFile!.path),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : const Text('Please select an image'),
              )
            ]),
          ),
        ));
  }
}
*/
