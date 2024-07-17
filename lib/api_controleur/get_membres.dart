import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;




class membre extends GetxController {

  List _listmembers = [];



  get_membres(String column, String valeur ) async {
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

          _listmembers = responseData['todos'];
          update();


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

          _listmembers = responseData['todos'];
          update();
          return _listmembers ;

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