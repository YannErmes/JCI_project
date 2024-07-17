import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../api_controleur/get_membres.dart';








class List_members extends StatefulWidget {
  const List_members({super.key});

  @override
  State<List_members> createState() => _List_membersState();
}

class _List_membersState extends State<List_members> {
  membre m = Get.put(membre());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   print('${m.getall_membres()}');

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 12,
            itemBuilder: (context, index) {
            return indiv();
          },),

      ),
    );
  }

}



class indiv extends StatefulWidget {
  const indiv({super.key});

  @override
  State<indiv> createState() => _indivState();
}

class _indivState extends State<indiv> {
  bool view = false  ;
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(), ScaleEffect()],
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.person_outline_outlined), onPressed: () {
            setState(() {
              view =! view ;
            }); },),
          Expanded(
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(vertical: 5),
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                  color:view ? Colors.purple.shade100 : Colors.blue
                  ,borderRadius: BorderRadius.circular(20)),

              height: view ?  200 : 50,

            ),
          ),
        ],
      ),
    ).flip(duration: Duration(seconds: 1)) ;
  }
}

