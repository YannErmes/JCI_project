import 'package:flutter/material.dart';
import 'package:gestion_des_taches/Pages/home_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Splach extends StatefulWidget {
  const Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    next();
  }

Future <void> next ()async {

  Future.delayed(Duration(seconds: 4) ,() =>  Navigator.push(context , MaterialPageRoute(builder: (context) => homeP(),)));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gagné du temps et de l\'energie avec JCI task manager',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "La bonne gestion du temps est essentielle pour réduire le stress, augmenter la productivité et atteindre ses objectifs efficacement.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 32),

                  SizedBox(height: 32),
                 CachedNetworkImage(imageUrl: 'https://i.Postimg.cc/WbgYgFL9/fon.png')

                ],
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black54,
                       Colors.black45,
                        Colors.black12,




                        Color(0XFF),
                        Color(0XFF),
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}
