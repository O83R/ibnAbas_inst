/*library lazy_load_indexed_stack;

import 'package:flutter/widgets.dart';

/// An extended IndexedStack that builds the required widget only when it is needed, and returns the pre-built widget when it is needed again.
class LazyLoadIndexedStack extends StatefulWidget {
  /// Widget to be built when not loaded. Default widget is [Container].
  late final Widget unloadWidget;

  /// The indexes of children that should be preloaded.
  final List<int> preloadIndexes;

  /// Same as alignment attribute of original IndexedStack.
  final AlignmentGeometry alignment;

  /// Same as sizing attribute of original IndexedStack.
  final StackFit sizing;

  /// Same as textDirection attribute of original IndexedStack.
  final TextDirection? textDirection;

  /// The index of the child to show.
  final int index;

  /// The widgets below this widget in the tree.
  ///
  /// A child widget will not be built until the index associated with it is specified.
  /// When the index associated with the widget is specified again, the built widget is returned.
  final List<Widget> children;

  /// Creates LazyLoadIndexedStack that wraps IndexedStack.
  LazyLoadIndexedStack({
    super.key,
    Widget? unloadWidget,
    this.preloadIndexes = const [],
    this.alignment = AlignmentDirectional.topStart,
    this.sizing = StackFit.loose,
    this.textDirection,
    required this.index,
    required this.children,
  }) {
    this.unloadWidget = unloadWidget ?? Container();
  }

  @override
  LazyLoadIndexedStackState createState() => LazyLoadIndexedStackState();
}

class LazyLoadIndexedStackState extends State<LazyLoadIndexedStack> {
  late List<Widget> _children;
  final _stackKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _children = _initialChildren();
  }

  @override
  void didUpdateWidget(final LazyLoadIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.children.length != oldWidget.children.length) {
      _children = _initialChildren();
    }

    _children[widget.index] = widget.children[widget.index];
  }

  @override
  Widget build(final BuildContext context) {
    return IndexedStack(
      key: _stackKey,
      index: widget.index,
      alignment: widget.alignment,
      textDirection: widget.textDirection,
      sizing: widget.sizing,
      children: _children,
    );
  }

  List<Widget> _initialChildren() {
    return widget.children.asMap().entries.map((entry) {
      final index = entry.key;
      final childWidget = entry.value;

      if (index == widget.index || widget.preloadIndexes.contains(index)) {
        return childWidget;
      } else {
        return widget.unloadWidget;
      }
    }).toList();
  }
}*/
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert'; // for base64 encoding
import 'dart:io'; // for File operations
import 'package:http/http.dart' as http;

class UploadImagePage extends StatefulWidget {
  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? _image; // Holds the image file
  final picker = ImagePicker();

  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: Column(
        children: [
          _image != null ? Image.file(_image!) : Text('No image selected.'),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Pick Image from Gallery'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_image != null) {
                uploadImage(_image!);
              } else {
                print('No image selected to upload.');
              }
            },
            child: Text('Upload Image'),
          ),
        ],
      ),
    );
  }
}

// Convert image to Base64
String? base64EncodeImage(File imageFile) {
  List<int> imageBytes = imageFile.readAsBytesSync();
  return base64Encode(imageBytes);
}

Future<void> uploadImage(File imageFile) async {
  String base64Image = base64EncodeImage(imageFile)!;
  String imageName = imageFile.path.split('/').last;

  var response = await http.post(
    Uri.parse('http://your-server-url/upload_image.php'),
    body: {
      'image': base64Image,
      'name': imageName,
    },
  );

  if (response.statusCode == 200) {
    print('Image uploaded successfully');
  } else {
    print('Image upload failed');
  }
}
