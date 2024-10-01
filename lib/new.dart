/*
`name`='$name',
`birthdate`='$birthdate',
`birthPlace`='$birthPlace',
`idCard`='$idCard',
`maritalStatus`='$maritalStatus',
`permanentAddress`='$permanentAddress',
`phoneNum`='$phoneNum',
`educationalLevel`='$educationalLevel',
`university`='$university',
`quranHifith`='$quranHifith',
`departmentInst`='$departmentInst',
`fatherNum`='$fatherNum',
`fatherName`'$fatherName'=,
`guaranteeAmount`='$guaranteeAmount'*/
import 'package:flutter/material.dart';
import 'package:ibn_abas_inst/screen/home_page.dart';
import 'model/user_model.dart';

class ShowStudentDetails extends StatelessWidget {
  final int index;

  const ShowStudentDetails({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    var listItems = Variable.studentsList[index];
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          child: Column(
            children: [
              SizedBox(
                height: Constants.size.height * 0.05,
              ),
              Center(
                child: CircleAvatar(
                  radius: Constants.size.width * 0.20,
                  backgroundImage: NetworkImage(
                    '${Variable.imagesPath}${listItems.image}',
                  ),
                ),
              ),
              SizedBox(
                height: Constants.size.height * 0.70,
                child: ListView.builder(
                  itemCount: Constants.textFieldName.length,
                  itemBuilder: (context, listIndex) {
                    return ListTile(
                      leading: Text(
                        Constants.textFieldName[index],
                        style: TextStyle(
                            fontSize: Constants.size.height * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(listIndex == 0
                          ? listItems.name!
                          : listIndex == 1
                              ? listItems.birthdate!
                              : listIndex == 2
                                  ? listItems.birthPlace!
                                  : listIndex == 3
                                      ? listItems.idCard!
                                      : listIndex == 4
                                          ? listItems.maritalStatus!
                                          : listIndex == 5
                                              ? listItems.permanentAddress!
                                              : listIndex == 6
                                                  ? listItems.phoneNum!
                                                  : listIndex == 7
                                                      ? Variable
                                                          .studentsList[index]
                                                          .educationalLevel!
                                                      : listIndex == 8
                                                          ? Variable
                                                              .studentsList[
                                                                  index]
                                                              .university!
                                                          : listIndex == 9
                                                              ? Variable
                                                                  .studentsList[
                                                                      index]
                                                                  .quranHifith!
                                                              : listIndex == 10
                                                                  ? Variable
                                                                      .studentsList[
                                                                          index]
                                                                      .departmentInst!
                                                                  : listIndex ==
                                                                          11
                                                                      ? Variable
                                                                          .studentsList[
                                                                              index]
                                                                          .fatherName!
                                                                      : listIndex ==
                                                                              12
                                                                          ? Variable
                                                                              .studentsList[index]
                                                                              .fatherNum!
                                                                          : listIndex == 13
                                                                              ? listItems.guaranteeAmount!
                                                                              : listItems.yearEnrollment!),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow buildTableRow(String? title, String? data) {
    return TableRow(children: [
      TableCell(
        child: Text(
          title!,
          style: TextStyle(
              fontSize: Constants.size.width * 0.05,
              fontWeight: FontWeight.bold),
        ),
      ),
      TableCell(
        child: Text(
          data!,
          style: TextStyle(fontSize: Constants.size.width * 0.05),
        ),
      )
    ]);
  }

  Text buildText(String title, String data) {
    return Text("$title : $data");
  }
}
/*Table(
                  textDirection: TextDirection.rtl,
                  children: [
                    buildTableRow('الاسم', item.name),
                    buildTableRow('تاريخ الميلاد', item.birthdate),
                    buildTableRow('مكان الميلاد', item.birthPlace),
                    buildTableRow('رقم الهوية', item.idCard),
                    buildTableRow('الحالة الاجتماعية', item.maritalStatus),
                    buildTableRow('العنوان الدائم', item.permanentAddress),
                    buildTableRow('المستوى التعليمي', item.educationalLevel),
                    buildTableRow('الجامعة', item.university),
                    buildTableRow('اسم ولي الأمر', item.fatherName),
                    buildTableRow('رقم ولي الأمر', item.fatherNum),
                    buildTableRow('يحفظ من القرآن', item.quranHifith),
                    buildTableRow(
                        'القسم الملتحق به في المعهد', item.departmentInst),
                    buildTableRow('مبلغ الضمان', item.guaranteeAmount),
                    buildTableRow('عام الالتحاق بالمعهد', item.yearEnrollment),
                  ],
                ),*/
/*Table(
                textDirection: TextDirection.rtl,
                children: [
                  buildTableRow('الاسم', item!.name!),
                  buildTableRow('تاريخ الميلاد', item!.birthdate!),
                  buildTableRow('مكان الميلاد', item!.birthPlace!),
                  buildTableRow('رقم الهوية', item!.idCard!),
                  buildTableRow('الحالة الاجتماعية', item!.maritalStatus!),
                  buildTableRow('العنوان الدائم', item!.permanentAddress!),
                  buildTableRow('المستوى التعليمي', item!.educationalLevel!),
                  buildTableRow('الجامعة', item!.university!),
                  buildTableRow('اسم ولي الأمر', item!.fatherName!),
                  buildTableRow('رقم ولي الأمر', item!.fatherNum!),
                  buildTableRow('يحفظ من القرآن', item!.quranHifith!),
                  buildTableRow(
                      'القسم الملتحق به في المعهد', item!.departmentInst!),
                  buildTableRow('مبلغ الضمان', item!.guaranteeAmount!),
                  buildTableRow('عام الالتحاق بالمعهد', item!.yearEnrollment!),
                ],
              ),*/
/*Row(
                children: [
                  buildText('الاسم', item.name!),
                  buildText('تاريخ الميلاد', item.birthdate!),
                  buildText('مكان الميلاد', item.birthPlace!),
                  buildText('رقم الهوية', item.idCard!),
                  buildText('الحالة الاجتماعية', item.maritalStatus!),
                  buildText('العنوان الدائم', item.permanentAddress!),
                  buildText('المستوى التعليمي', item.educationalLevel!),
                  buildText('الجامعة', item.university!),
                  buildText('اسم ولي الأمر', item.fatherName!),
                  buildText('رقم ولي الأمر', item.fatherNum!),
                  buildText('يحفظ من القرآن', item.quranHifith!),
                  buildText('القسم الملتحق به في المعهد', item.departmentInst!),
                  buildText('مبلغ الضمان', item.guaranteeAmount!),
                  buildText('عام الالتحاق بالمعهد', item.yearEnrollment!),
                ],
              )*/
