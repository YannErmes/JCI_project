import'package:flutter/material.dart';
import 'package:get/get.dart';






 class widgetuse extends GetxController {


// widget reuse home page
   ctnh (var child  , var clr , double w , double h){

     return AnimatedContainer(
       duration: Duration(seconds: 1),
       padding: EdgeInsets.all(5),
       height: h ,
         width: w ,
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),

         color:clr
       ),
       child: child ,
     );
   }




   // widget reuse every where
   txt (String text , var clr  , double sze){
     return Text(text , style: TextStyle( color: clr,fontSize:sze ) ,softWrap: true,overflow: TextOverflow.ellipsis,maxLines:15,);
   }

   icnb (var op ,var Icons , var clr , double sze ){
     return IconButton(onPressed:op ,
         icon: Icon(Icons , color: clr, size: sze,));

   }
   gst (var action , var child ) {
     return GestureDetector(
       onTap: action,
       child:child,


     );

   }





 }



