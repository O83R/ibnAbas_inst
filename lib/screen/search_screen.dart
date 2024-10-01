import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Student> _searchResults = [];

  Future<void> searchStudents(String query) async {
    final response = await http.get(
      Uri.parse(
          'http://localhost/ibnAbas-inst/search_student.php?query=$query'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      setState(() {
        _searchResults =
            jsonResponse.map((student) => Student.fromJson(student)).toList();
      });
    } else {
      throw Exception('Failed to load students');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter name, ID, or university',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    searchStudents(_searchController.text);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final student = _searchResults[index];
                  return ListTile(
                    title: Text(student.name!),
                    subtitle: Text(
                        'University: ${student.university}\nID Card: ${student.idCard}'),
                    onTap: () {
                      // Navigate to student details if necessary
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
