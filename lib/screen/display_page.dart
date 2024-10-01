import 'dart:convert';

import 'package:dropdown_model_list/generated/assets.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../new.dart';
import '../view_model/student_view_model.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({
    super.key,
  });

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  final studentViewModel =
      Provider.of<StudentViewModel>(Constants.context, listen: false);
  @override
  void initState() {
    super.initState();
    studentViewModel.fetchStudents();
    print(Variable.serverMsg);
  }

  @override
  Widget build(BuildContext context) {
    Constants.context = context;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: FutureBuilder<List<Student>>(
            future: studentViewModel.fetchStudents(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  {
                    return const Center(child: CircularProgressIndicator());
                  }
                case ConnectionState.none:
                  {
                    snapshot.hasError
                        ? Center(child: Text('Error: ${snapshot.error}'))
                        : const Center(child: Text('No data available'));
                  }
                case ConnectionState.done:
                  {
                    final students = snapshot.data ?? [];
                    return SizedBox(
                      height: Constants.size.height * 0.70,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: students.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.white70, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.all(10.0),
                              child: ListTile(
                                  onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ShowStudentDetails(
                                                    index: index,
                                                  )),
                                        )
                                      },
                                  trailing: buildTextDisplay(
                                      index, students[index].yearEnrollment!),
                                  leading: CircleAvatar(
                                    radius: Constants.size.width * 0.05,
                                    backgroundImage: NetworkImage(
                                      '${Variable.imagesPath}${students[index].image!}',
                                    ),
                                  ),
                                  title: buildTextDisplay(
                                      index, students[index].name!),
                                  subtitle: buildTextDisplay(
                                      index, students[index].departmentInst!)),
                            );
                          }),
                    );
                  }
                case ConnectionState.active:
                  {
                    return const CircularProgressIndicator();
                  }
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Text buildTextDisplay(int index, String text) {
    return Text(
      text,
      style:
          TextStyle(fontFamily: 'noor', fontSize: Constants.size.width * 0.03),
    );
  }

  Text buildText(int index, String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18),
    );
  }
}

extension on Map {
  String convertToJson() => jsonEncode(this);
}
