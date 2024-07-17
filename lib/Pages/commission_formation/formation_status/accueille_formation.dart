import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_des_taches/Pages/commission_formation/Gestion_des_aspirant/accueille_aspirant.dart';
import 'package:gestion_des_taches/Pages/home_pages.dart';
import 'package:gestion_des_taches/widget-reuse.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class formation_status_home extends StatefulWidget {
  const formation_status_home({super.key});

  @override
  State<formation_status_home> createState() => _formation_status_homeState();
}

class _formation_status_homeState extends State<formation_status_home> {
  widgetuse use = Get.put(widgetuse());

  String selectoption = 'ok';
  bool onview = false;
  bool inscriptiontab = true;
  DateTime dateTimeb = DateTime.now();

  TextEditingController _nom_ctrl = TextEditingController();
  TextEditingController _autres_ctrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getall_membres();
  }

  @override
  void cleaner() {
    // TODO: implement dispose
    _nom_ctrl.clear();
    _autres_ctrl.clear();

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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Selectctn(140, 140, Colors.blue,

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(27),
                                      child:
                                      IconButton(icon: Icon(Icons.list_alt , size: 40,),onPressed: (){
                                        showModalBottomSheet(context: context,  isScrollControlled: true, builder: (context) {

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: SizedBox(
                                              height: 520,
                                              width: 300,
                                              child: Column(
                                                children: [
                                                  formations_liste('formation Mouvement'),
                                                  formations_liste('formation jci'),
                                                  formations_liste('formation art oratoire'),


                                                ],
                                              ),
                                            ),
                                          );

                                        },);
                                       

                                      },)),
                                  Expanded(child:  Txt('Liste de presence', Colors.white, 16))
                                ],
                              ) ,homeP()
                          ),
                          Selectctn(140, 140, Colors.blue,

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.circular(27),
                                      child:
                                     IconButton(icon: Icon(Icons.table_rows_rounded, size: 40,),onPressed: (){
                                       setState(() {
                                         table = true ;
                                       });

                                     },)),

                                  Expanded(child:Txt('Ma liste de formation', Colors.white, 16) )

                                ],
                              ), formation_accuiell_aspiran()
                          ),
                        ],
                      ),
                      spc(5, 0),

                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width,
                            height: 400,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent.shade100,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Show_espace()


                          )
                        ],
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


  //les fonction de controle et widget

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

  champs(String name, TextEditingController ctrl , IconData icn) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: TextField(
          controller: ctrl,
          decoration: InputDecoration(
              prefixIcon: Icon(icn),
              labelText: name
          ),


        ),
      ),
    );
  }




  // current formation remplissage

  String formations = 'oko';
  formations_liste(String current_formation){
    return TextButton(onPressed: (){
      formations = current_formation;
      Navigator.pop(context);
      showModalBottomSheet(context: context,   isScrollControlled: true,builder: (context) {

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 530,

            child: Column(
              children: [
                Text("List de présence $current_formation"),
                champs('Nom', _nom_ctrl, Icons.person_outline_outlined),
                champs('Information optionel', _autres_ctrl, Icons.info_outlined),
                MaterialButton(color: Colors.green,onPressed: (){
                 // Navigator.pop(context);
                  cleaner();


                } , child: Text('Validé ma présence'),),
                SizedBox(
                  height: 40,
                ),
                MaterialButton(color: Colors.red,onPressed: (){


                } , child: Text('Envoyé la liste'),),


              ],
            ),
          ),
        );

      },);
      
    }, child: Text(current_formation));
  }





  // formation faite  et liste de presence de formation

  bool table = true ;
  Show_espace(){
    return table ? Show_form_liste() : Show_form_presence();
  }
  formation_tile( String titre){
    return ListTile( leading: Icon(Icons.folder_zip_outlined),
      title: Text(titre),subtitle: Text('${DateTime.now()}'),
      onTap: (){
        setState(() {
          table =! table;
        });
      },


    );
  }
  Show_form_presence(){
    return Text('Resultat de la formation ');
  }
  Show_form_liste(){
    return Column(
      children: [
        formation_tile('Formation connaissance'),
        formation_tile('Formation connaissance'),
        formation_tile('Formation connaissance'),

      ],
    );
  }


}
