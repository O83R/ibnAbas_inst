import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(255, 8, 131, 247);
const kSecondaryColor = Color.fromARGB(179, 243, 199, 141);
const kDarkColor = Color(0xFF000714);
const kBodyTextColor = Color.fromARGB(0, 252, 246, 219);
const kBgColor = Color.fromARGB(0, 255, 204, 0);

const kDefaultPadding = 20.0;
final kDefaultShadow = BoxShadow(
  offset: const Offset(0, 50),
  blurRadius: 50,
  color: const Color.fromARGB(255, 228, 197, 111).withOpacity(0.15),
);

final kDefaultCardShadow = BoxShadow(
  offset: const Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.1),
);

// TextField dedign
const kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

const kDefaultOutlineInputBorder = OutlineInputBorder(
  // Maybe flutter team need to fix it on web
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);
const kTextColor = Color.fromARGB(255, 0, 0, 0);
const kTextLightColor = Color(0xFF555555);
/*const aboutInstitute =
    'جاءت فكرة تأسيس هذا المعهد بعد رحلة علمية وتعليمية طويلة استفادت من طرقٍ ومدارسَ علميةٍ متنوعة، فقد أخذ المؤسس الشيخ عمر باوزير حفظه الله عن علماء كبار من المملكة العربية السعودية، ثم انتقل إلى اليمن وأخذ عن علماء بارزين فيه، وزار عددا من معاهده العلمية، وتعلم وعلَّم فيها، ودفعه ذلك إلى النظر في وسائل طلب العلم وطرائقه ومناهجه الأكثر فائدة والأسرع جدوى، فعمل على أن يكون تعلم العلم الشرعي مثالياً في حضرموت خصوصا واليمن عموما؛ فبدأ بتأسيس دار الخير لتعليم القرآن الكريم والعلوم الشرعية بفكرة سلفية الجذور عصرية النظرة والتفكير، وكانت رؤية الدار: تخريج الداعية القوي إيمانياً، المؤصل علمياً، الماهر دعوياً، المعتدل منهجياً. \n	فبدأ دار الخير بعدد قليل من الطلاب، ثم تزايدوا فيما بعد، ونمت هذه النبتة المباركة وأثمرت، واتسعت شهرتها حتى وصلت إلى مناطق بعيدة، وصار من تخرجوا من هذا الدار المبارك يبنون معاهد في بلدانهم على طريقته وفكرته ومنهج علماءه، ثم كثر توافد الطلاب من جميع أنحاء اليمن وخارجها، حتى ضاقت الدار عن استيعابهم، فجاءت فكرة بناء جامع ومعهد كبير يتسع لكل هذه الأعداد المتقدمة من الطلاب. 	\n	ثم تزايدت الحاجة إلى بناء هذا الجامع والمعهد وصارت ملحة بعد أن تم افتتاح قسم خاص بدراسة القرآن الكريم وعلومه وحفظه وإتقانه بالسند المتصل إلى النبي صلى الله عليه وسلم ، ثم افتتاح قسم آخر لتعليم اللغة العربية للناطقين بغيرها، وقسم ثالث لحفظ المتون العلمية؛ وقسم رابع لدراسة الفقه الشافعي دراسة تخصصية على يد مشايخ متخصصين فيه.\n وها هو جامع ومعهد ابن عباس حقيقة ماثلة الآن، وحلم صار واقعا، ومثال للجهد والمثابرة..	يفتح اليوم أبوابه لطلاب العلم ليرشفوا من رحيقه ويكرعوا من معينه.. \n وكلنا أمل في أن يصبح هذا المعهد قلعة من قلاع العلم النافع ومصنعا يتخرج منه علماء كبار ودعاة أبرار ورموز للصلاح أخيار.. \n والله الموفق والهادي إلى سواء السبيل';
const ourMassege =
    'المعهد العلمي الأمثل في صناعة القيادات العلمية والقرآنية والتربوية.';
const ourVistion =
    'تخريج الداعية المؤصل علمياً , المعتدل منهجياً , القوي إيمانياً , الماهر دعوياً';
const ourGoles =
    '1- صناعة دعاة وقراء وأئمة من العرب وغيرهم.\n 2- تخريج القراء وفق أفضل المعايير المتفق عليها بين علماء القراءات.\n 3- المحافظة على أسانيد القرآن المتصلة إلى النبي صلى الله عليه وسلم.\n 4- تدريب وتربية الدعاة وطلاب العلم  على إدارة الحلقات القرآنية وأساليب تدريس القرآن الكريم.\n 5- ربط الحفظ بالعمل وترك أثر للقرآن في شخصية الطالب.\n 6- الانتقال بالمراكز العلمية و بحلقات التحفيظ من الطريقة التقليدية إلى العمل المؤسسي المنظم.\n 7- إعداد دعـاة موصليـن علمـيـا  وربط الدعاة بالعلماء الذين عرفوا بسلامة المنهج .\n 8- عطاء الداعية الدورات اللازمة لتنمية مهاراته الذاتية ،والدعوية والقيادية.\n 9-  إكسـاب الطـلاب الأدب والأخـلاق الـتـي يجـب أن يتخـلـق بـهـاالداعية إلى الله.\n 10- تأهيــل معـلـمـي المـعـاهـد الإسلامـيـة مـن غـيـر العـرب في العلوم الشرعية واللغة العربية.';
const us =
    ' هو صرح علمي شامخ ينهل منه الطلاب العلوم الشرعية ويساهم في بناء مجتمع مؤهل ومدرب من خلال تخريج أجيال ذات كفاءة عالية وشخصيات متميزة  قادرة على الإبداع والعطاء وتحقيق التقدم الحضاري المنشود.';
*/
class App {
  late BuildContext _context;
  late double _height;
  late double _width;
  late double _heightPadding;
  late double _widthPadding;

  App(_context) {
    this._context = _context;
    MediaQueryData _queryData = MediaQuery.of(this._context);
    _height = _queryData.size.height / 100.0;
    _width = _queryData.size.width / 100.0;
    _heightPadding = _height -
        ((_queryData.padding.top + _queryData.padding.bottom) / 100.0);
    _widthPadding =
        _width - (_queryData.padding.left + _queryData.padding.right) / 100.0;
  }

  double appHeight(double v) {
    return _height * v;
  }

  double appWidth(double v) {
    return _width * v;
  }

  double appVerticalPadding(double v) {
    return _heightPadding * v;
  }

  double appHorizontalPadding(double v) {
    return _widthPadding * v;
  }
}
