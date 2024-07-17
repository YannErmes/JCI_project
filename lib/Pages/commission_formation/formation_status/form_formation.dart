import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FixForm extends StatefulWidget {
  const FixForm({super.key});

  @override
  _FixFormState createState() => _FixFormState();
}

class _FixFormState extends State<FixForm> {
  TextEditingController name_ctrl = TextEditingController();
  TextEditingController promotion_ctrl = TextEditingController();
  TextEditingController carriere_ctrl = TextEditingController();
  TextEditingController info_ctrl = TextEditingController();
  DateTime slecteddate = DateTime.now();
  DateTime slecteddate2 = DateTime.now();


  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery
        .of(context)
        .size
        .height;
    final double w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://i.pinimg.com/564x/97/60/74/976074d519d0c12e6be89bc4e3fe9c51.jpg',
                height: h,
                width: w,),
              SizedBox(
                height: h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(


                        height: 359,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: BackdropFilter(

                            filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                champs('Nom', name_ctrl, Icons.person_outline_outlined),
                                champs('Promotion', name_ctrl, Icons.people_outline_sharp),
                                champs('Carriere', name_ctrl, Icons.work_history_outlined),
                                Datechamps(),
                                Datechamps2(),
                                champs('Information complementaire', info_ctrl, Icons.info_outlined),


                              ],
                            ),

                          ),
                        ),
                      ),
                      Btn(),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Datechamps() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            IconButton(onPressed: () async {
              final DateTime ? dateTime = await showDatePicker(
                  context: context,
                  initialDate: slecteddate ,
                  firstDate:DateTime(2000) ,
                  lastDate: DateTime(3000));

              if(dateTime != null){
                setState(() {
                  slecteddate = dateTime;
                });
              }
            }, icon: Icon(Icons.calendar_month)),
            Text("Accuille : $slecteddate")
          ],
        ),
      ),
    );
  }
  Datechamps2() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            IconButton(onPressed: () async {
              final DateTime ? dateTime2 = await showDatePicker(
                  context: context,
                  initialDate: slecteddate2 ,
                  firstDate:DateTime(2000) ,
                  lastDate: DateTime(3000));

              if(dateTime2 != null){
                setState(() {
                  slecteddate2 = dateTime2;

                });
              }
            }, icon: Icon(Icons.calendar_month)),
            Text("Née : $slecteddate2")
          ],
        ),
      ),
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
  Btn(){
    return ElevatedButton.icon(
      onPressed: (){

      }, label: Text('Ajouté'),
      icon: Icon(Icons.add_circle,color: Colors.green,),);
  }


}
