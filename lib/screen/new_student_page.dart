import 'dart:convert'; // for base64 encoding
import 'dart:io'; // for File operations
import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../model/user_model.dart';
import '../view_model/student_view_model.dart';

class NewStudentScreen extends StatefulWidget {
  const NewStudentScreen({super.key});

  @override
  State<NewStudentScreen> createState() => _HomePageState();
}

class _HomePageState extends State<NewStudentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _image; // Holds the image file
  final picker = ImagePicker();
  late String? base64Image;
  //late String? imageName = _image?.path.split('/').last;
  // Function to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        base64Image = base64EncodeImage(_image!);
        Ctrl.imageName.text = _image!.path.split('/').last;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final studentViewModel =
        Provider.of<StudentViewModel>(context, listen: false);
    Constants.context = context;
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(width: Constants.size.width * 0.60, child: Container()),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          'إضافة طالب جديد',
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontFamily: 'noor', fontSize: Constants.size.height * 0.035),
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(
                top: Constants.size.height * 0.01,
                right: Constants.size.height * 0.02,
                left: Constants.size.height * 0.02,
                //bottom: Constants.size.height * 0.01,
              ),
              child: ListView.builder(
                itemCount: Constants.textFieldName.length,
                itemBuilder: (context, index) {
                  print(index);
                  print(Constants.textFieldName.length);

                  return buildColumnInsert(
                      Constants.textFieldName[index],
                      Constants.hintTextField[index],
                      Constants.ctrlTextField[index],
                      index);
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            final newStudent = Student(
                id: 0, // Server will generate ID
                name: Ctrl.name.text,
                birthdate: Ctrl.birthdate.text,
                birthPlace: Ctrl.birthPlace.text,
                idCard: Ctrl.idCard.text,
                maritalStatus: Ctrl.maritalStatus.text,
                permanentAddress: Ctrl.permanentAddress.text,
                phoneNum: Ctrl.phoneNum.text,
                educationalLevel: Ctrl.educationalLevel.text,
                university: Ctrl.university.text,
                quranHifith: Ctrl.quranHifith.text,
                departmentInst: Ctrl.departmentInst.text,
                fatherNum: Ctrl.fatherNum.text,
                fatherName: Ctrl.fatherName.text,
                guaranteeAmount: Ctrl.guaranteeAmount.text,
                yearEnrollment: Ctrl.yearEnrollment.text,
                image: base64Image,
                nameImage: Ctrl.imageName.text);

            studentViewModel.addStudent(newStudent);
          }
        },
        child: const Icon(Icons.add_circle),
      ),
    );
  }

  SelectDropList buildSelectDropList(
      OptionItem optionItemSelected, DropListModel items, var value) {
    return SelectDropList(
      itemSelected: optionItemSelected,
      dropListModel: items,
      showIcon: true,
      heightBottomContainer: items.listOptionItems.length *
          48.toDouble(), // Show Icon in DropDown Title
      showArrowIcon: true, // Show Arrow Icon in DropDown
      showBorder: true,
      paddingTop: 0,
      paddingBottom: 0,
      paddingLeft: 0,
      paddingRight: 0,

      icon: const Icon(Icons.person, color: Colors.black),
      onOptionSelected: (optionItem) {
        optionItemSelected = optionItem;
        value = optionItemSelected;
        setState(() {
          print(value.toString());
        });
      },
    );
  }

  Column buildColumnInsert(
      String title, String hint, TextEditingController ctrl, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.right,
          title,
          style: TextStyle(
              fontFamily: 'noor',
              fontSize: Constants.size.height * 0.02,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: Constants.size.height * 0.01,
        ),
        index != Constants.textFieldName.length - 1
            ? TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return " الرجاء ادخال $title";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: hint,
                ),
                controller: ctrl,
              )
            : Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Colors.blue, width: 1), // Border color and width
                  borderRadius:
                      BorderRadius.circular(10), // Optional: Rounded corners
                ),
                child: ListTile(
                  title:
                      _image != null ? Text(Ctrl.imageName.text) : Text(hint),
                  leading: IconButton(
                    onPressed: _pickImage,
                    icon: const Icon(
                      Icons.upload_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
        /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "الرجاء اختيار صورة ";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'اختر صورة من الملفات',
                    ),
                    enabled: false,
                    controller: Ctrl.imageName,
                  ),

                ],
              ),*/
      ],
    );
  }

/*
*/
  Column buildColumnInsertImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.right,
          'الصورة الشخصية',
          style: TextStyle(
              fontFamily: 'noor',
              fontSize: Constants.size.height * 0.02,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: Constants.size.height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "الرجاء اختيار صورة ";
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'اختر صورة من الملفات',
              ),
              enabled: false,
              controller: Ctrl.imageName,
            ),
            IconButton(
              onPressed: _pickImage,
              icon: const Icon(Icons.upload_outlined),
            ),
          ],
        ),
      ],
    );
  }

  Text titleInserting(String title) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: 'noor',
          fontSize: Constants.size.height * 0.03,
          fontWeight: FontWeight.bold),
    );
  }

  TextField buildTextFieldForAdding(String hint, TextEditingController ctrl) {
    return TextField(
      decoration: InputDecoration(hintText: hint),
      controller: ctrl,
    );
  }
}

extension on Map {
  String convertToJson() => jsonEncode(this);
}

String? base64EncodeImage(File imageFile) {
  List<int> imageBytes = imageFile.readAsBytesSync();
  return base64Encode(imageBytes);
}
