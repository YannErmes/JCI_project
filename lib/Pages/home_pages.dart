//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_des_taches/widget-reuse.dart';
import 'package:get/get.dart';

import 'commission_formation/Commission_Formation.dart';
import 'commission_management/Commission_Management.dart';

class homeP extends StatefulWidget {
  const homeP({super.key});

  @override
  State<homeP> createState() => _homePState();
}

class _homePState extends State<homeP> {
  widgetuse use = Get.put(widgetuse());
  bool c1 = false;
  bool c2 = false;
  bool c3 = false;
  bool c4 = false;
  DateTime dateTime= DateTime.now();

  Future<void> s1() async {
    setState(() {
      c1 = true;
      c2 = false;
      c3 = false;
      c4 = false;
    });
    await Future.delayed(
      Duration(seconds: 2),
          () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => formation(),));
      },
    );
  }

  Future<void> s2() async {
    setState(() {
      c1 = false;
      c2 = true;
      c3 = false;
      c4 = false;
    });
    await Future.delayed(
      Duration(seconds: 2),
      () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => listemembrep(),));
      },
    );
  }

  Future<void> s3() async {
    setState(() {
      c1 = false;
      c2 = false;
      c3 = true;
      c4 = false;
    });
    await Future.delayed(
      Duration(seconds: 1),
      () {},
    );
  }

  Future<void> s4() async {
    setState(() {
      c1 = false;
      c2 = false;
      c3 = false;
      c4 = true;
    });
    await Future.delayed(
      Duration(seconds: 1),
      () {},
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications();

      }
    });
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(image: DecorationImage(
                  image:
                  NetworkImage('https://i.postimg.cc/T1Wg8DqB/download-8.jpg'),fit: BoxFit.cover)),
              child: CachedNetworkImage(imageUrl: 'https://i.postimg.cc/hhWxKt2v/fon-3.png'), width: double.infinity,
              height: double.infinity,
            ),

            Container(

              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  use.ctnh(Row(

                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    use.icnb((){}, CupertinoIcons.person_crop_circle, Colors.black , 25),
                      use.txt('Mr yann', Colors.black, 25)
                    ],
                  ), Colors.black38, 300, 40),
                  SizedBox(height: 80,),

                  ElevatedButton(onPressed: (){
                    
                    AwesomeNotifications().createNotification(content: 
                    NotificationContent(id: 10, channelKey: 'basic_channel',
                    title: 'Simple notification',
                    body: 'Un formulaire a ete envoiyé'));

                            }, child: Text('Notif')),

                  Expanded(child: SizedBox()),
                  Container(
                    width: double.infinity,



                    child: Column(

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            use.gst(
                              () {
                                setState(() {
                                  s1();
                                });
                              },
                              use.ctnh(
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    use.txt('Commission formation',
                                        Colors.black, 20),

                                    use.ctnh( use.txt('20', Colors.white, 20), Colors.black38, 50, 50)
                                  ],
                                )
                                 ,


                                  c1
                                      ? Colors.white.withOpacity(0.9)
                                      : Colors.white.withOpacity(0.6),
                                  c1 ? 180 : 140,
                                  c1 ? 180 : 140),
                            ),
                            use.gst(
                              () {

                                setState(() {
                                  s2();
                                });
                              },
                              use.ctnh(
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      use.txt('SG',
                                          Colors.black, 20),

                                      use.ctnh( use.txt('7', Colors.white, 20), Colors.black38, 50, 50)
                                    ],
                                  ),
                                  c2
                                      ?  Color(0XFFFBB076)
                                      : Colors.white.withOpacity(0.6),
                                  c2 ? 180 : 140,
                                  c2 ? 180 : 140),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            use.gst(
                              () {
                                setState(() {
                                  s3();
                                });
                              },
                              use.ctnh(
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      use.txt('Espace membre',
                                          Colors.black, 20),

                                      use.ctnh( use.txt('04', Colors.white, 20), Colors.black38, 50, 50)
                                    ],
                                  ),
                                  c3
                                      ? Colors.white.withOpacity(0.9)
                                      : Colors.white.withOpacity(0.6),
                                  c3 ? 180 : 140,
                                  c3 ? 180 : 140),
                            ),
                            use.gst(
                              () {
                                setState(() {
                                  s4();
                                });
                              },
                              use.ctnh(
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      use.txt('Commission croissance',
                                          Colors.black, 20),

                                      use.ctnh( use.txt('2', Colors.white, 20), Colors.black38, 50, 50)
                                    ],
                                  ),
                                  c4
                                      ? Colors.white.withOpacity(0.9)
                                      : Colors.white.withOpacity(0.6),
                                  c4 ? 180 : 140,
                                  c4 ? 180 : 140),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
