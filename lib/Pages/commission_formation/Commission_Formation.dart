import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_des_taches/Pages/commission_formation/Gestion_des_aspirant/accueille_aspirant.dart';
import 'package:gestion_des_taches/Pages/commission_formation/Gestion_des_menbres/accueille_membres.dart';
import 'package:gestion_des_taches/widget-reuse.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'formation_status/accueille_formation.dart';

class formation extends StatefulWidget {
  const formation({super.key});

  @override
  State<formation> createState() => _formationState();
}

class _formationState extends State<formation> {
  widgetuse use = Get.put(widgetuse());

  String selectoption = 'ok';
  bool onview = false;
  bool inscriptiontab = true;
  DateTime dateTimeb = DateTime.now();
  DateTime dateTimew = DateTime.now();
  TextEditingController nom_ctrl = TextEditingController();
  TextEditingController promo_ctrl = TextEditingController();
  TextEditingController autres_ctrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getall_membres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        color: Colors.white,
        hoverColor: Colors.white,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),

      body: SafeArea(
        child: Stack(
          children: [
            Image.network('https://i.postimg.cc/T1Wg8DqB/download-8.jpg',height: MediaQuery.of(context).size.height,fit: BoxFit.cover,),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spc(10, 0),
                      Txt('JCI', Colors.blue, 30),
                      spc(20, 0),
                      Container(
                          height: 130,
                          width : MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.redAccent
                                ,borderRadius: BorderRadius.circular(20)
                          ),
                         
                         child:  Row(
                            children: [
                              CachedNetworkImage(imageUrl: 'https://i.postimg.cc/bJ4L286c/mag.png'
                                , fit: BoxFit.cover,),
                              Expanded(
                                child: Txt("Commission Formation", Colors.white, 15) ,
                              )

                            ],
                          )),
                      spc(20, 0),
                      Selectctn(150, MediaQuery.of(context).size.width, Colors.red,
                          Row(
                            children: [
                              CachedNetworkImage(imageUrl: 'https://i.postimg.cc/bJ4L286c/mag.png'
                                , fit: BoxFit.cover,),
                              Expanded(
                                child: Txt("Verifié le status de mes formations", Colors.white, 15) ,
                              )

                            ],
                          ), formation_status_home()),
                      spc(20, 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selectctn(140, 140, Colors.blue,

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(27),
                                      child:
                                      CachedNetworkImage(imageUrl: 'https://i.postimg.cc/kMkh2NZ6/list.png'
                                          , height: 55, width:70,fit: BoxFit.cover)),
                                  Expanded(child:  Txt('Gestion des Membres', Colors.white, 20))
                                ],
                              ) , formation_accuiell()
                          ),
                          Selectctn(140, 140, Colors.blue,

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(27),
                                      child:
                                      CachedNetworkImage(imageUrl: 'https://i.postimg.cc/jqWFq38Y/fon-1.png'

                                        , height: 55, width:70, fit: BoxFit.cover,)),

                                  Expanded(child:Txt('Getion des aspirant', Colors.white, 20) )
                                  
                                ],
                              ), formation_accuiell_aspiran()
                          ),
                        ],
                      ),
                      spc(5, 0),



                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //

  //
  //
  //
  // les fonction de controle et widget
  Selectctn(double h, double w, var clr, var child , var page) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: h,
      width: w,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white),
        color: clr,
      )
      ,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => page,));
        },
        child: child,
      ),
    );
  }

  Txt(String text, var clr, double sze) {
    return Text(
      text,
      style: TextStyle(color: clr, fontSize: sze),

    );
  }

  spc(double? h, double? w) {
    return SizedBox(
      height: h ?? 0,
      width: w ?? 0,
    );
  }

  membres(String nom, String accuielle_date, String date, String autres,
      String promotion) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: onview ? 150 : 60,
      width: 400,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: const Color(0xFFFBC691),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white, width: 2)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(CupertinoIcons.person_fill),
              use.txt(' Amis $nom ', Colors.black, 15)
            ],
          ),
          onview
              ? SizedBox(
            child: Column(
              children: [
                use.txt(
                    'Accuiller sous la promotion $promotion \n'
                        ' le $accuielle_date'
                        ' \n Autres information: \n',
                    Colors.black,
                    15),
              ],
            ),
          )
              : const Spacer(),
        ],
      ),
    );
  }

  //
  //
  // gestion de la requete de neauveaux

  DateTime date = DateTime.timestamp();

  add_membres() async {
    try {
      var response = await http.post(
        Uri.parse('http://localhost/JCI/add_membres.php'),
        body: {
          "nom": '${nom_ctrl.text} né le $dateTimeb',
          'accueille_date': '$dateTimew',
          'date': '$date',
          'autres': '${autres_ctrl.text}',
          'promotion': promo_ctrl.text,
          'anif_date': '${dateTimeb.month}',
        },
      );

      if (response.statusCode == 200) {
        print("le statuts ${response.statusCode}");
        final Map<dynamic, dynamic> responseData = json.decode(response.body);
        print(" le resutta  ${responseData['message']}");
        Fluttertoast.showToast(
            msg: " ajout réussi  ${responseData['message']}");
        setState(() {
          inscriptiontab = true;
        });
      } else {
        Get.defaultDialog(
            title:
            'Oups! la connection à réseau a été interrompue veillez juste réessayé aprés 1 minute !',
            titleStyle: const TextStyle(fontSize: 15),
            content: const SizedBox(height: 30, child: Icon(Icons.wifi_off)));
      }
    } catch (e) {
      print(e.toString());

      Get.defaultDialog(
          title:
          'Oups! la connection à réseau a été interrompue veillez juste réessayé aprés 1 minute !',
          titleStyle: const TextStyle(fontSize: 15),
          content: const SizedBox(height: 30, child: Icon(Icons.wifi_off)));
    }
  }

  List _listmembers = [];

  get_membres(String column, String valeur) async {
    try {
      var response = await http.post(
        Uri.parse('http://localhost/JCI/get.php'),
        body: {
          "colomn": column,
          "valeur": valeur,
        },
      );

      if (response.statusCode == 200) {
        print("le statuts ${response.statusCode}");
        final Map<dynamic, dynamic> responseData = json.decode(response.body);
        print(" le resutta  ${responseData['todos']}");
        setState(() {
          _listmembers = responseData['todos'];
        });
      } else {
        Get.defaultDialog(
            title:
            'Oups! la connection à réseau a été interrompue veillez juste réessayé aprés 1 minute !',
            titleStyle: const TextStyle(fontSize: 15),
            content: const SizedBox(height: 30, child: Icon(Icons.wifi_off)));
      }
    } catch (e) {
      print(e.toString());

      Get.defaultDialog(
          title:
          'Oups! la connection à réseau a été interrompue veillez juste réessayé aprés 1 minute !',
          titleStyle: const TextStyle(fontSize: 15),
          content: const SizedBox(height: 30, child: Icon(Icons.wifi_off)));
    }
  }

  getall_membres() async {
    try {
      var response = await http.post(
        Uri.parse('http://localhost/JCI/getall.php'),
        body: {
          "colomn": 'id',
          "valeur": '0',
        },
      );

      if (response.statusCode == 200) {
        print("le statuts ${response.statusCode}");
        final Map<dynamic, dynamic> responseData = json.decode(response.body);
        print(" le resutta  ${responseData['todos']}");
        setState(() {
          _listmembers = responseData['todos'];
        });
      } else {
        Get.defaultDialog(
            title:
            'Oups! la connection à réseau a été interrompue veillez juste réessayé aprés 1 minute !',
            titleStyle: const TextStyle(fontSize: 15),
            content: const SizedBox(height: 30, child: Icon(Icons.wifi_off)));
      }
    } catch (e) {
      print(e.toString());

      Get.defaultDialog(
          title:
          'Oups! la connection à réseau a été interrompue veillez juste réessayé aprés 1 minute !',
          titleStyle: const TextStyle(fontSize: 15),
          content: const SizedBox(height: 30, child: Icon(Icons.wifi_off)));
    }
  }
}
