import 'dart:convert'; // for base64 encoding
import 'dart:io'; // for File operations
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../model/user_model.dart';

class StudentViewModel extends ChangeNotifier {
  final String? apiUrl = Variable.staticIp;

  Future<List<Student>> fetchStudents() async {
    final response = await http.get(Uri.parse('${apiUrl}read_students.php'));

    if (response.statusCode == 200) {
      // Parse the JSON response safely
      try {
        List jsonResponse = json.decode(
            response.body); // Make sure the response body is a valid JSON
        return jsonResponse
            .map((student) => Student.fromJson(student))
            .toList();
      } catch (e) {
        throw Exception('Failed to parse JSON: $e');
      }
    } else {
      throw Exception(
          'Failed to load students. Status code: ${response.statusCode}');
    }
  }

  Future<void> addStudent(Student student) async {
    await http.post(
      Uri.parse('${apiUrl}create_student.php'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(student.toJson()),
    );
  }

  Future<void> updateStudent(Student student) async {
    await http.post(
      Uri.parse('${apiUrl}update_student.php'),
      body: jsonEncode(student.toJson()),
    );
    fetchStudents();
  }

  Future<void> deleteStudent(int id) async {
    await http.post(
      Uri.parse('${apiUrl}delete_student.php'),
      body: {'id': id.toString()},
    );
    fetchStudents();
  }
}
