import 'package:flutter/material.dart';
import 'package:ibn_abas_inst/constants.dart';

import '../responsive.dart';

class AboutHim extends StatefulWidget {
  const AboutHim({super.key, required this.title});
  final String title;
  @override
  State<AboutHim> createState() => _AboutHimState();
}

class _AboutHimState extends State<AboutHim> {
  List title = [
    'الاسم: ',
    'مواليد:',
    'تاريخ الميلاد: ',
    'المستوى الدراسي:',
    'المهمات:',
    'أبرز شيوخه:',
  ];
  List subTitle = [
    'أبو الحـــارث عمر بن سالم بن عبدالله بن ضبعان باوزير ',
    'مدينـة جـدة - المملكـة العربيـة السعـوديـة',
    '1393 هـ - 1973 م',
    'جامعي ',
    'عضو مجلس علماء حضرموت، وعضو هيئة علماء اليمن، ورئيس مؤسسة ابن عباس العلمية، ومـؤســس ورئيـس مؤسـسـة روابــي الخـيــــر الـتــنـــمــــويـــة ســابــقــاً، ونــائـب رئيـس مـخـيـــم الـبـحـــر الصيفي، والمشرف العام على دار الخير لتعليم القرآن الكريم والعلوم الشرعية، والمشرف العام على جامع ومعهد ابن عباس العلمي بالمكلا.',
    'محمد بن صالح العثيمين، وعبدالله بن جبرين، ومحمد بن محمد المختار الشنقيطي، وعبدالرحمن الكوني، ومحمد الطيب المغربي، وعبدالله بن عبدالعزيز البسام، وسعود الشريم، وسعد الحميد، وعلي بكير، وأبوالحسن السليماني... وغيرهم؛ رحم الله الأموات منهم، وحفظ الأحياء.'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                //color: Color.fromRGBO(255, 213, 5, 0.7450980392156863),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    opacity: 0.2,
                    image: AssetImage(
                      'assets/images/background.jpg',
                    ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /* Container(

                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/logo.jpg',
                          ))),
                ),*/
                Container(
                  height: size.width / 2.5,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                    'assets/images/shaikh_omer.png',
                  ))),
                ),
                Text(
                  'نبذة مختصرةعن الشيخ ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'noor',
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.70,
                  width: size.width,
                  child: ListView.builder(
                    itemCount: title.length,
                    //scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return buildListTile(size, title[index], subTitle[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ListTile buildListTile(Size size, var title, var subTitle) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'noor',
          fontSize: size.width * 0.05,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subTitle,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'noor',
            fontSize: size.width * 0.04,
          )),
      style: ListTileStyle.drawer,
    );
  }
}
