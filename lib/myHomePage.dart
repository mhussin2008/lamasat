import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'privacy_text.dart';
import 'videoList.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//--------------------------------------------------------------------------

class _MyHomePageState extends State<MyHomePage> {

  String url = 'https://www.youtube.com/playlist?list=PLo_bzJr12Ms5Ikr5mRUZHfey4Jg-HsOcv';
  String Privacyurl='https://www.freeprivacypolicy.com/live/5bc098fb-a590-462b-8df3-d0d0e7c60597';
  late Uri myUri=Uri.parse(url);
  late Uri myPrivacyUri=Uri.parse(Privacyurl);
  int _counter = 1;
  String jpg = '001';
  String zeros = '';
  int temp = 0;
  //List<String> myIndex = [''];
  //List<String> myVideoIndex = [''];
  //String myVideoListUrl='https://www.youtube.com/watch?v=aOZYPsJLkU0&list=PLo_bzJr12Ms5Ikr5mRUZHfey4Jg-HsOcv&index=';


  bool privacy = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // myVideoIndex=[
    // 'https://www.youtube.com/watch?v=aOZYPsJLkU0&list=PLo_bzJr12Ms5Ikr5mRUZHfey4Jg-HsOcv&index=1',
    //   'https://www.youtube.com/watch?v=aOZYPsJLkU0&list=PLo_bzJr12Ms5Ikr5mRUZHfey4Jg-HsOcv&index=2'
    //
    //
    // ];


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
    if (_counter >= 550) {
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
                  _launchUrl(myUri);
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
                    height: 50,
                    child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: [
                              Text(' ${pageNum[index]}'),
                              Expanded(
                                  child: SizedBox(

                                     child: Text(
                                       softWrap: true,
                                myIndex[index],
                                textAlign: TextAlign.right,
                              )
                                  )
                              ),
                              index>4 && index<49 ?IconButton(
                                alignment: Alignment.topRight,
                                  iconSize: 10,
                                  onPressed: (){

                               ///// here
                                String temp='${myVideoList[index-3]}';
                                print(temp);
                                _launchUrl(Uri.parse(temp));
                              }, icon: Image.asset('assets/icons/youtube.png')
                              ):SizedBox()//
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

                  child: Center(child: Image.asset('assets/lamasat5/lamasat-' + jpg + '.jpg'))),
            )
          : SingleChildScrollView(child: Text(privacy_text)),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }

  Future<void> _launchUrl(Uri parse) async {
    print('started launching youtube');
    if (!await launchUrl(parse)) {
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
