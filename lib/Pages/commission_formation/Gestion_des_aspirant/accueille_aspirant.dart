import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_des_taches/Pages/commission_formation/Gestion_des_menbres/Information_membre.dart';
import 'package:gestion_des_taches/Pages/commission_formation/Gestion_des_menbres/create_fom_step.dart';
import 'package:gestion_des_taches/Pages/commission_formation/Gestion_des_menbres/form_home.dart';
import 'package:gestion_des_taches/widget-reuse.dart';
import 'package:gestion_des_taches/Pages/commission_formation/Gestion_des_menbres/add_members.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class formation_accuiell_aspiran extends StatefulWidget {
  const formation_accuiell_aspiran({super.key});

  @override
  State<formation_accuiell_aspiran> createState() => _formation_accuiell_aspiranState();
}

class _formation_accuiell_aspiranState extends State<formation_accuiell_aspiran> {
  widgetuse use = Get.put(widgetuse());

  String selectoption = 'ok';
  bool onview = false;
  bool inscriptiontab = true;
  DateTime dateTimeb = DateTime.now();
  DateTime dateTimew = DateTime.now();

  TextEditingController titre_ctrl = TextEditingController();
  TextEditingController content_ctrl = TextEditingController();

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
                              CachedNetworkImage(imageUrl: 'https://i.pinimg.com/564x/84/62/e4/8462e4378ef0d8e4dec6d88ddf62727b.jpg'
                                , fit: BoxFit.cover,),
                              Expanded(
                                child: Txt("Espace Aspirant", Colors.white, 15) ,
                              )

                            ],
                          )),
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
                                      GestureDetector(
                                        child: Icon(Icons.add_circle, size: 40,),
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => FixForm(),));
                                        },
                                      )),


                                  Expanded(child:  Txt('Ajouté des aspirant', Colors.white, 16))
                                ],
                              )
                          ),
                          Selectctn(140, 140, Colors.blue,

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(11),
                                      child:
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => List_members(),));
                                        },
                                        child: Icon(Icons.folder_copy, size: 40,),
                                      )),

                                  Expanded(child:Txt('Infomation et status aspirant', Colors.white, 16) )

                                ],
                              )
                          ),
                        ],
                      ),
                      spc(5, 0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selectctn(140, 140, Colors.blue,

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(27),
                                      child: IconButton(icon: Icon(Icons.notifications_active_outlined, size: 40,),onPressed: (){

                                        showModalBottomSheet(context: context, builder: (context) {
                                          return  Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                champs('Titre', titre_ctrl),

                                                champs('Contenu de la notification', content_ctrl),
                                                MaterialButton(color: Colors.blue,onPressed: (){
                                                  Navigator.pop(context);

                                                },child: Text('Envoyé'),)


                                              ],
                                            ),
                                          );
                                        },);
                                      },) ),

                                  Expanded(child: Txt('Envoye de notification', Colors.white, 20))

                                ],
                              )
                          ),

                          Selectctn(140, 140, Colors.blue,

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(icon : Icon(Icons.list_alt, size: 40), onPressed: () {  
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => home_form(),));
                                  },),

                                  Expanded(child: Txt('Envoyer de formulaire/Sondage/Questionnaire ', Colors.white, 16) )

                                ],
                              )
                          ),
                        ],
                      ),


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
  Selectctn(double h, double w, var clr, var child) {
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
      child: child,
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

  champs(String name, TextEditingController ctrl ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: TextField(
          controller: ctrl,
          decoration: InputDecoration(

              labelText: name
          ),


        ),
      ),
    );
  }


}
