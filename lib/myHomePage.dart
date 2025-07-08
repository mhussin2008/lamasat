import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'privacy_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//--------------------------------------------------------------------------

class _MyHomePageState extends State<MyHomePage> {

  String url = 'https://www.youtube.com/playlist?list=PLo_bzJr12Ms5Ikr5mRUZHfey4Jg-HsOcv';
  String Privacyurl='https://github.com/mhussin2008/mohamed-privacy/blob/main/privacy-policy.md';
  late Uri myUri=Uri.parse(url);
  late Uri myPrivacyUri=Uri.parse(Privacyurl);
  int _counter = 1;
  String jpg = '001';
  String zeros = '';
  int temp = 0;
  List<String> myIndex = [''];
  List<int> pageNum = [0];
  bool privacy = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myIndex = [
      'تقريظ أ. ياسر السمرى',
          'تقريظ د. محمد فؤاد عبدالمجيد',
          'تقريظ أ.د. عبدالقيوم السندى',
          'مقدمة المؤلف',
          'مدخل لدراسة الدرة',
          'فصل فى الأوجه المقدمة في الأداء',
          'فصل فيما زادته الدرة على الشاطبية',
          'مقدمة النظم',
          'باب البسملة وأم القرآن',
          'الإدغام الكبير',
          'هاء الكناية',
          'المد والقصر',
          'الهمزتان من كلمة',
          'الاستفهام المكرر',
          'الهمزتان من كلمتبن',
          'الهمز المفرد',
          'النقل والسكت والوقف على الهمز',
          'الإدغام الصفير',
          'النون الساكنة والتنوين',
          'الفتح والإمالة',
          'الراءات واللامات والوقف على المرسوم',
          'ياءات الإضافة',
          'الياءات الزوائد',
          'باب فرش الحروف :فرش سورة البقرة',
          'فرش سورة آل عمران',
          'فرش سورة النساء',
          'فرش سورة المائدة',
          'سورة الأنعام',
          'سورة الأعراف والأنفال',
          'سورة التوبة ويونس وهود عليهما السلام',
          'سورة يوسف-عليه السلام- والرعد',
          'ومن سورة إبراهيم-عليه السلام-إلى سورة الكهف',
          'سورة الكهف',
          'ومن سورة مريم-عليها السلام-إلى سورة الفرقان',
          'ومن سورة الفرقان إلى سورة الروم',
          'سورة الروم ولقمان -عليه السلام- والسجدة',
          'سورة الأحزاب وسبأو فاطر',
          'سورة يس-عليه السلام -والصافات',
          'ومن سورة ص إلى سورة الأحقاف',
          'ومن سورة الأحقاف إلى سورة الرحمن',
          'ومن سورة الرحمن إلى سورة الإمتحان',
          'ومن سورة الإمتحان إلى سورة الجن',
          'ومن سورة الجن إلى سورة المرسلات',
          'ومن سورة المرسلات إلى سورة الغاشية',
          'ومن سورة الغاشية إلى آخر القرآن',
          'المراجع'


    ];
    pageNum = [
      9,
      10,
      11,
      13,
      14,
      24,
      30,
      58,
      80,
      100,
      114,
      126,
      129,
      141,
      148,
      154,
      179,
      194,
      210,
      212,
      222,
      240,
      253,
      275,
      356,
      378,
      395,
      405,
      430,
      457,
      486,
      491,
      512,
      524,
      559,
      576,
      584,
      599,
      614,
      635,
      647,
      657,
      663,
      673,
      683,
      697

    ];
  }

  void _makeFileName() {
    zeros = '';
    temp = 3 - _counter.toString().length;
    for (int i = 0; i < temp; i++) {
      zeros = zeros + '0';
    }
    jpg = zeros + _counter.toString();
    //print(jpg);
  }

  void _incrementCounter() {
    if (_counter >= 699) {
      return;
    }
    setState(() {
      _counter++;
      _makeFileName();
    });
  }

  void _decrementCounter() {
    if (_counter < 2) {
      return;
    }
    setState(() {
      _counter--;
      _makeFileName();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          centerTitle: true,
          title:  Center(
            child: const Text(
                'اللمسات الندية',
            style: TextStyle(fontSize: 24,),
            textAlign: TextAlign.center,

              softWrap: true,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _launchPrivacyUrl();
                  });


                },
                icon: const Icon(Icons.privacy_tip)),
            // IconButton(
            //     onPressed: () {
            //       setState(() {
            //         privacy = !privacy;
            //         print(privacy);
            //       });
            //
            //       //launchUrl(Uri(path:'https://github.com/mhussin2008/mohamed-privacy/blob/main/privacy-policy.md'));
            //     },
            //     icon: const Icon(Icons.privacy_tip)),

            IconButton(
                onPressed: ()   async {
                  await Clipboard.setData(ClipboardData(text: url));

                  Fluttertoast.showToast(
                      msg: "تم نسخ عنوان قائمة فيديوهات الشرح للحافظة",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );

                 //Future.delayed(const Duration(milliseconds: 2500), () {});

                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   content: Text("تم نسخ عنوان قائمة فيديوهات الشرح للحافظة"),
                  // ));


                 // } else {
                 // print( 'Could not launch $url');
                 // }

                  //launchUrl(Uri(path:'https://github.com/mhussin2008/mohamed-privacy/blob/main/privacy-policy.md'));
                },
                icon: const Icon(Icons.copy) ),

            IconButton(
                onPressed: () {
                  _launchUrl();
                  //launchUrl(Uri(path:'https://github.com/mhussin2008/mohamed-privacy/blob/main/privacy-policy.md'));
                },
                icon:Image.asset('assets/icons/ypf.png')
    ),
          ],
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: myIndex.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 40,
                    child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              Text(' ${pageNum[index]}'),
                              Expanded(
                                  child: SizedBox(
                                     child: Text(
                                myIndex[index],
                                textAlign: TextAlign.right,
                              ))),
                              //
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _counter = pageNum[index] + 0;//+1
                            privacy = true;
                            _makeFileName();
                          });
                          Navigator.pop(context);
                        }),
                  );
                })),
      ),
      // appBar: AppBar(title: Text(widget.title), ),
      body: privacy
          ? Dismissible(
              key: ValueKey(_counter),
              resizeDuration: null,
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  _decrementCounter();
                } else {
                  _incrementCounter();
                }
              },
              child: InteractiveViewer(
                maxScale: 5,

                  child: Center(child: Image.asset('assets/lamasat/lamasat-' + jpg +' '+ '.jpg'))),
            )
          : SingleChildScrollView(child: Text(privacy_text)),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Future<void> _launchUrl() async {
    print('started launching youtube');
    if (!await launchUrl(myUri)) {
      throw Exception('Could not launch $myUri');
    }

  }

  Future<void> _launchPrivacyUrl() async {
    print('Privacy Policy');
    if (!await launchUrl(myPrivacyUri)) {
      throw Exception('Could not launch $myUri');
    }

  }



}
