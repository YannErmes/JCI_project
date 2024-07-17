import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_des_taches/Pages/commission_formation/Gestion_des_menbres/accueille_membres.dart';
import 'package:gestion_des_taches/widget-reuse.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'create_fom_step.dart';

class home_form extends StatefulWidget {
  const home_form({super.key});

  @override
  State<home_form> createState() => _home_formState();
}

class _home_formState extends State<home_form> {
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
                      Selectctn(150, MediaQuery.of(context).size.width, Colors.red,
                          Row(
                            children: [
                              CachedNetworkImage(imageUrl: 'https://i.pinimg.com/564x/fb/d2/5d/fbd25d13e07d40b14d38e3fe83d2763e.jpg'
                                , fit: BoxFit.cover,),
                              Expanded(
                                child: Txt("Clique ici pour crée un nouveau formulaire", Colors.white, 15) ,
                              )

                            ],
                          ) , Sondage()),
                      spc(20, 0),
                      Text('Liste des formulaires crée'),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 400,

                        decoration: BoxDecoration(
                          color: Colors.blueAccent.shade100,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:SingleChildScrollView(
                          child: Column(
                            children: [

                            ],
                          ),
                        ),
                      )






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
}
