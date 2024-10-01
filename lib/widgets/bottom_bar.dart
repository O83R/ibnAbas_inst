import 'package:flutter/material.dart';
import 'package:ibn_abas_inst/screen/new_student_page.dart';

import '../model/user_model.dart';
import '../screen/display_page.dart';
import '../screen/home_page.dart';
import '../screen/search_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    Constants.context = context;
    final kTabPages = <Widget>[
      const NewStudentScreen(),
      const DisplayPage(),
      const SearchScreen(),
    ];
    final kBottmonNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(Icons.add_rounded), label: 'اضافة طالب جديد'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.list_rounded), label: 'عرض جميع الطللاب'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.search_rounded), label: 'البحث عن طالب'),
    ];
    assert(kTabPages.length == kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl, child: kTabPages[_currentTabIndex]),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
