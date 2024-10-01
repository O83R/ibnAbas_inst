import 'package:flutter/material.dart';
import 'package:ibn_abas_inst/screen/home_page.dart';
import 'package:ibn_abas_inst/screen/new_student_page.dart';
import 'package:ibn_abas_inst/service/connect_server.dart';
import 'package:ibn_abas_inst/service/upload_image_file.dart';
import 'package:ibn_abas_inst/view_model/student_view_model.dart';
import 'package:ibn_abas_inst/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentViewModel()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: ImageUploader());
  }
}
