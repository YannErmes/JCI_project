import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Sondage_aspirant extends StatefulWidget {
  const Sondage_aspirant({super.key});

  @override
  _Sondage_aspirantState createState() => _Sondage_aspirantState();
}


class _Sondage_aspirantState extends State<Sondage_aspirant> {
  TextEditingController titre_ctrl = TextEditingController();
  TextEditingController description_ctrl = TextEditingController();
  DateTime slecteddate = DateTime.now();
  TextEditingController ch1_ctrl = TextEditingController();
  TextEditingController ch2_ctrl = TextEditingController();
  TextEditingController ch3_ctrl = TextEditingController();
  TextEditingController ch4_ctrl = TextEditingController();
  TextEditingController ch5_ctrl = TextEditingController();

  DateTime slecteddate2 = DateTime.now();
  int step = 1 ;


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


    if(step == 1){
     return Scaffold(

          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: AnimatedContainer(
                  duration: Duration(seconds: 4),
                  child:init_form()
                ),
              ),
            ),
          ),
        );


    }else if (step == 2) {
    return  Scaffold(

        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: AnimatedContainer(
                duration: Duration(seconds: 4),
                child:named_form( null,null,null,null,null,),
            ),
          ),
        ),
      ),
    );

    }else {
      return Scaffold(

        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: AnimatedContainer(
                duration: Duration(seconds: 4),
                child:final_form(),
              ),
            ),
          ),
        ),
      );


    };
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
            Text("Deadline: ${slecteddate2.day}-${slecteddate2.month}-${slecteddate2.year}")
          ],
        ),
      ),
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

  Btn(){
    return ElevatedButton.icon(
      onPressed: (){
        setState(() {
          step = 2 ;
        });

      }, label: Text('Validé'),
      icon: Icon(Icons.offline_pin_outlined,color: Colors.green,),);
  }

  init_form(){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade50
          ),

          height: 359,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CachedNetworkImage(imageUrl: 'https://i.pinimg.com/564x/08/d6/06/08d60626a00cf729346aa1107f7efe12.jpg', height: 40,),
              champs('Donnez un titre a votre formulaire', titre_ctrl),
              champs('Decrivez-le 5 ligne max ', description_ctrl),
              Datechamps2(),
            ],
          ),
        ),
        Btn(),


      ],
    ) ;
  }

  named_form(String? T1 ,String? T2 ,String? T3 ,String? T4 ,String? T5 , ){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade50
          ),

          height: 359,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CachedNetworkImage(imageUrl: 'https://i.pinimg.com/564x/08/d6/06/08d60626a00cf729346aa1107f7efe12.jpg', height: 40,),
              champs( T1 ?? 'Titre champs 1', ch1_ctrl),
              champs( T2 ?? 'Titre 2 champs 2', ch2_ctrl),
              champs( T3 ?? 'Titre 3 champs 3',ch3_ctrl),
              champs( T4 ?? 'Titre 4 champs 4', ch4_ctrl),
              champs( T5 ?? 'Titre 5 champs 5', ch5_ctrl),


            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: (){
            setState(() {
              step = 3 ;
              T1 = '${ch1_ctrl.text}';
              T2 = '${ch2_ctrl.text}';
              T3 = '${ch3_ctrl.text}';
              T4 = '${ch4_ctrl.text}';
              T5 = '${ch5_ctrl.text}';
            });

          }, label: Text('validé'),
          icon: Icon(Icons.send,color: Colors.green,),)


      ],
    ) ;
  }

  final_form(){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade50
          ),

          height: 359,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CachedNetworkImage(imageUrl: 'https://i.pinimg.com/564x/08/d6/06/08d60626a00cf729346aa1107f7efe12.jpg', height: 40,),
             Text(titre_ctrl.text),
              champs(  ch1_ctrl.text, ch1_ctrl),
              champs(  ch2_ctrl.text, ch2_ctrl),
              champs(  ch3_ctrl.text, ch3_ctrl),
              champs(  ch4_ctrl.text, ch4_ctrl),
              champs(  ch5_ctrl.text, ch5_ctrl),


            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: (){


          }, label: Text('validé'),
          icon: Icon(Icons.send,color: Colors.green,),)


      ],
    ) ;
  }

  chek_formulaire() {

  }
}


