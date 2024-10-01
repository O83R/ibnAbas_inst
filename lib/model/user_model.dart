import 'dart:convert';

import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/bottom_bar.dart';

class Student {
  final int id;
  final String? name;
  final String? birthdate;
  final String? birthPlace;
  final String? idCard;
  final String? maritalStatus;
  final String? permanentAddress;
  final String? phoneNum;
  final String? educationalLevel;
  final String? university;
  final String? quranHifith;
  final String? departmentInst;
  final String? fatherNum;
  final String? fatherName;
  final String? guaranteeAmount;
  final String? yearEnrollment;
  final String? image;
  final String? nameImage;

  Student(
      {required this.id,
      this.name,
      this.birthdate,
      this.birthPlace,
      this.idCard,
      this.maritalStatus,
      this.permanentAddress,
      this.phoneNum,
      this.educationalLevel,
      this.university,
      this.quranHifith,
      this.departmentInst,
      this.fatherNum,
      this.fatherName,
      this.guaranteeAmount,
      this.yearEnrollment,
      this.image,
      this.nameImage});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        id: int.parse(json['id']),
        name: json['name'],
        birthdate: json['birthdate'],
        birthPlace: json['birthPlace'],
        idCard: json['idCard'],
        maritalStatus: json['maritalStatus'],
        permanentAddress: json['permanentAddress'],
        phoneNum: json['phoneNum'],
        educationalLevel: json['educationalLevel'],
        university: json['university'],
        quranHifith: json['quranHifith'],
        departmentInst: json['departmentInst'],
        fatherNum: json['fatherNum'],
        fatherName: json['fatherName'],
        guaranteeAmount: json['guaranteeAmount'],
        yearEnrollment: json['yearEnrollment'],
        image: json['image']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'birthdate': birthdate,
      'birthPlace': birthPlace,
      'idCard': idCard,
      'maritalStatus': maritalStatus,
      'permanentAddress': permanentAddress,
      'phoneNum': phoneNum,
      'educationalLevel': educationalLevel,
      'university': university,
      'quranHifith': quranHifith,
      'departmentInst': departmentInst,
      'fatherNum': fatherNum,
      'fatherName': fatherName,
      'guaranteeAmount': guaranteeAmount,
      'yearEnrollment': yearEnrollment,
      'image': image,
    };
  }
}

class Ctrl {
  static final name = TextEditingController();
  static final birthdate = TextEditingController();
  static final birthPlace = TextEditingController();
  static final idCard = TextEditingController();
  static final maritalStatus = TextEditingController();
  static final permanentAddress = TextEditingController();
  static final phoneNum = TextEditingController();
  static final educationalLevel = TextEditingController();
  static final university = TextEditingController();
  static final quranHifith = TextEditingController();
  static final departmentInst = TextEditingController();
  static final fatherNum = TextEditingController();
  static final fatherName = TextEditingController();
  static final guaranteeAmount = TextEditingController();
  static final ipServerCtrl = TextEditingController();
  static final yearEnrollment = TextEditingController();
  static final imageName = TextEditingController();
}

class Operations {
  /*static Future<void> fetchStudents() async {
    const url = 'http://10.0.2.2/ibnAbas-inst/read_students.php';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Variable.serverMsg = "Data Get Successfully";
      Variable.studentsList.clear();
      for (final jsonItem in jsonDecode(response.body)) {
        Variable.studentsList.add(Student.fromJson(jsonItem));
      }
      /* List<dynamic> body = jsonDecode(response.body);
      Variable.studentsList =
          body.map((dynamic item) => Student.fromJson(item)).toList();*/
    } else {
      Variable.serverMsg = 'Failed to load students';
    }
  }

  static Future<void> deleteStudent(int id) async {
    const url = 'http://10.0.2.2/ibnAbas-inst/delete_student.php';
    await http.post(Uri.parse(url), body: {'id': id.toString()});
    fetchStudents();
  }

  static Future<void> updateStudent({required int id}) async {
    const url = 'http://10.0.2.2/ibnAbas-inst/update_student.php';
    await http.post(Uri.parse(url), body: {
      'id': id.toString(),
      'name': Ctrl.name.text,
      'birthdate': Ctrl.birthdate.text,
      'birthPlace': Ctrl.birthPlace.text,
      'idCard': Ctrl.idCard.text,
      'maritalStatus': Variable.maritalStatus,
      'permanentAddress': Ctrl.permanentAddress.text,
      'phoneNum': Ctrl.phoneNum.text,
      'educationalLevel': Ctrl.educationalLevel.text,
      'university': Ctrl.university.text,
      'quranHifith': Ctrl.quranHifith.text,
      'departmentInst': Variable.departmentInst,
      'fatherNum': Ctrl.fatherNum.text,
      'fatherName': Ctrl.fatherName.text,
      'guaranteeAmount': Ctrl.guaranteeAmount.text,
      'yearEnrollment': Ctrl.yearEnrollment.text,
    });
    fetchStudents();
  }

  static Future<void> addStudent() async {
    const url = 'http://10.0.2.2/ibnAbas-inst/create_student.php';
    final response = await http.post(Uri.parse(url), body: {
      'name': Ctrl.name.text,
      'birthDate': Ctrl.birthdate.text,
      'birthPlace': Ctrl.birthPlace.text,
      'idCard': Ctrl.idCard.text,
      'maritalStatus': Ctrl.maritalStatus.text,
      'permanentAddress': Ctrl.permanentAddress.text,
      'phoneNum': Ctrl.phoneNum.text,
      'educationalLevel': Ctrl.educationalLevel.text,
      'university': Ctrl.university.text,
      'quranHifith': Ctrl.quranHifith.text,
      'departmentInst': Ctrl.departmentInst,
      'fatherNum': Ctrl.fatherNum.text,
      'fatherName': Ctrl.fatherName.text,
      'guaranteeAmount': Ctrl.guaranteeAmount.text,
      'yearEnrollment': Ctrl.yearEnrollment.text,
    });
    print('Failed to upload students. Status Code: ${response.statusCode}');
  }

  static Future<void> postData(context) async {
    const url = "http://10.0.2.2/ibnAbas-inst/?myApi=get";
    final response = await http.post(
      Uri.parse(url),
      body: {
        'name': Ctrl.name.text,
        'birthdate': Ctrl.birthdate.text,
        'birthPlace': Ctrl.birthPlace.text,
        'idCard': Ctrl.idCard.text,
        'maritalStatus': Variable.maritalStatus,
        'permanentAddress': Ctrl.permanentAddress.text,
        'phoneNum': Ctrl.phoneNum.text,
        'educationalLevel': Ctrl.educationalLevel.text,
        'university': Ctrl.university.text,
        'quranHifith': Ctrl.quranHifith.text,
        'departmentInst': Variable.departmentInst,
        'fatherNum': Ctrl.fatherNum.text,
        'fatherName': Ctrl.fatherName.text,
        'guaranteeAmount': Ctrl.guaranteeAmount.text,
        'yearEnrollment': Ctrl.yearEnrollment.text,
      },
    );

    // Parse response
    final data = jsonDecode(response.body);

    // Show appropriate message based on the response
    if (data['status'] == 'success') {
      // Login successful
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    } else {
      // Login failed
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  static void getRequest() async {
    try {
      final response =
          await http.get(Uri.parse("${Variable.staticIp}/?myApi=get"));

      if (response.statusCode == 200)
      // ignore: curly_braces_in_flow_control_structures
      {
        Variable.serverMsg = "Data Get Successfully";
        Variable.studentsList.clear();
        for (final jsonItem in jsonDecode(response.body)) {
          Variable.studentsList.add(Student.fromJson(jsonItem));
        }
      } else
        // ignore: curly_braces_in_flow_control_structures
        Variable.serverMsg = "Something went wrong!!!";
    } catch (error) {
      Variable.serverMsg = error.toString();
    }
  }*/

  /*static void postRequest() async {
    try {
      final response =
          await http.post(Uri.parse("${Variable.staticIp}/?myApi=insert"),
              body: {
                'name': Ctrl.name.text,
                'birthdate': Ctrl.birthdate.text,
                'birthPlace': Ctrl.birthPlace.text,
                'idCard': Ctrl.idCard.text,
                'maritalStatus': Ctrl.maritalStatus.text,
                'permanentAddress': Ctrl.permanentAddress.text,
                'phoneNum': Ctrl.phoneNum.text,
                'educationalLevel': Ctrl.educationalLevel.text,
                'university': Ctrl.university.text,
                'quranHifith': Ctrl.quranHifith.text,
                'departmentInst': Ctrl.departmentInst.text,
                'fatherNum': Ctrl.fatherNum.text,
                'fatherName': Ctrl.fatherName.text,
                'guaranteeAmount': Ctrl.guaranteeAmount.text,
              }.convertToJson());

      Ctrl.name.text = '';
      Ctrl.name.text = '';
      Ctrl.birthdate.text = '';
      Ctrl.birthPlace.text = '';
      Ctrl.idCard.text = '';
      Ctrl.maritalStatus.text = '';
      Ctrl.permanentAddress.text = '';
      Ctrl.phoneNum.text = '';
      Ctrl.educationalLevel.text = '';
      Ctrl.university.text = '';
      Ctrl.quranHifith.text = '';
      Ctrl.departmentInst.text = '';
      Ctrl.fatherNum.text = '';
      Ctrl.guaranteeAmount.text = '';

      if (response.statusCode == 200)
      // ignore: curly_braces_in_flow_control_structures
      {
        Variable.serverMsg = "Data Successfully inserted";
        Operation.getRequest();
      } else
        // ignore: curly_braces_in_flow_control_structures
        Variable.serverMsg = "Something went wrong!!!";
    } catch (error) {
      print(error.toString());
    }
  }

  static void deleteRequest(int id) async {
    try {
      final response = await http.delete(
          Uri.parse("${Variable.staticIp}/?myApi=delete"),
          body: {'id': id}.convertToJson());

      if (response.statusCode == 200)
      // ignore: curly_braces_in_flow_control_structures
      {
        Variable.serverMsg = "Data Deleted Successfully";
        Operation.getRequest();
      } else
        // ignore: curly_braces_in_flow_control_structures
        Variable.serverMsg = "Delete Failed !!!";
      setState(() {});
    } catch (error) {
      Variable.serverMsg = error.toString();
      setState(() {});
    }
  }

  static void updateRequest(int id, Student user) async {
    try {
      final response =
          await http.post(Uri.parse("${Variable.staticIp}/?myApi=update"),
              body: {
                'name': Ctrl.name.text,
                'birthdate': Ctrl.birthdate.text,
                'birthPlace': Ctrl.birthPlace.text,
                'idCard': Ctrl.idCard.text,
                'maritalStatus': Ctrl.maritalStatus.text,
                'permanentAddress': Ctrl.permanentAddress.text,
                'phoneNum': Ctrl.phoneNum.text,
                'educationalLevel': Ctrl.educationalLevel.text,
                'university': Ctrl.university.text,
                'quranHifith': Ctrl.quranHifith.text,
                'departmentInst': Ctrl.departmentInst.text,
                'fatherNum': Ctrl.fatherNum.text,
                'fatherName': Ctrl.fatherName.text,
                'guaranteeAmount': Ctrl.guaranteeAmount.text,
              }.convertToJson());

      if (response.statusCode == 200)
      // ignore: curly_braces_in_flow_control_structures
      {
        print(response.body);
        Variable.serverMsg = "Data Updated Successfully";
        Operation.getRequest();
      } else
        // ignore: curly_braces_in_flow_control_structures
        Variable.serverMsg = "Update Failed !!!";
      setState(() {});
    } catch (error) {
      Variable.serverMsg = error.toString();
      setState(() {});
    }
  }*/
  static void checkConnection(BuildContext context) async {
    try {
      final response =
          await http.get(Uri.parse("${Variable.staticIp}/read_students.php"));
      if (response.statusCode == 200) {
        Variable.serverMsg = "Data Get Successfully";
        /*Fluttertoast.showToast(
          msg: 'Connection Successfully',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );*/
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomBar()),
        );
      } else {
        /*Fluttertoast.showToast(
          msg: 'Connection Failed',
          backgroundColor: Colors.green,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_SHORT,
        );*/
      }
    } catch (error) {
      print(error.toString());
      /* Fluttertoast.showToast(
        msg: error.toString(),
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );*/
    }
  }

  /*static Future<String?> uploadImageHTTP(file, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('picture', file.path));
    var res = await request.send();
    return res.reasonPhrase;
  }*/
}

class Variable {
  static String? ipServer = Ctrl.ipServerCtrl.text;
  static String? staticIp = "http://$ipServer/ibnAbas-inst";
  static String? serverMsg = '';
  static List<Student> studentsList = [];
  static String imagesPath = "$staticIp/assets/images/";
}

class Constants {
  static late BuildContext context;
  static var size = MediaQuery.of(context).size;
  static List textFieldName = [
    'الاسم الرباعي',
    'تاريخ الميلاد',
    'مكان الميلاد',
    'رقم الهوية',
    'الحالة الاجتماعية',
    'العنوان الدائم',
    'رقم الجوال',
    'المستوى التعليمي',
    'الجامعة',
    'اسم ولي الأمر',
    'رقم ولي الأمر',
    'كم تحفظ من القرآن؟',
    'القسم الملتحق به في المعهد',
    'مبلغ الضمان',
    'عام الالتحاق بالمعهد',
    'الصورة الشخصية',
  ];
  static List hintTextField = [
    '',
    'اليوم/الشهر/السنة',
    'البلد/المحافظة/المديرية',
    'البطاقة الشخصية/ جواز السفر',
    'متزوج / أعزب ',
    'البلد/المحافظة/المديرية',
    '',
    'أساسي / ثانوي',
    'اسم الجامعة - التخصص',
    '',
    '',
    '',
    'إعداد الدعاة/الحلقات النموذجية/المقرأة',
    'كم دفعت للضمان؟',
    'السنة الهجرية',
    'اضف الصورة من المعرض'
  ];
  static List ctrlTextField = [
    Ctrl.name,
    Ctrl.birthdate,
    Ctrl.birthPlace,
    Ctrl.idCard,
    Ctrl.maritalStatus,
    Ctrl.permanentAddress,
    Ctrl.phoneNum,
    Ctrl.educationalLevel,
    Ctrl.university,
    Ctrl.fatherName,
    Ctrl.fatherNum,
    Ctrl.quranHifith,
    Ctrl.departmentInst,
    Ctrl.guaranteeAmount,
    Ctrl.yearEnrollment,
    Ctrl.imageName
  ];

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static List titleDropDown = ['الحالة الاجتماعية', 'القسم الملتحق به'];
  static DropListModel departmentInstItems = DropListModel([
    OptionItem(id: "1", title: 'إعداد الدعاة'),
    OptionItem(id: "2", title: "الحلقات النموذجية"),
    OptionItem(id: "3", title: "الإقراء والإجازة بالسند المتصل "),
    OptionItem(id: "4", title: "حفظ المتون العلمية"),
  ]);
  static DropListModel maritalStatusItems = DropListModel([
    OptionItem(id: "1", title: 'متزوج'),
    OptionItem(id: "2", title: "أعزب"),
  ]);
  static OptionItem optionItemSelectedDepartmentInst =
      OptionItem(title: Constants.titleDropDown[1]);
  static OptionItem optionItemSelectedMaritalStatus =
      OptionItem(title: Constants.titleDropDown[0]);
}

extension on Map {
  String? convertToJson() => jsonEncode(this);
}
