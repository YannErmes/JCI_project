

import 'package:firebase_messaging/firebase_messaging.dart';

class Firebaseapi {
final _firemessaging = FirebaseMessaging.instance;

Future<void> initnitif ()async {

  await _firemessaging.requestPermission();
  final fcttkn = await _firemessaging.getToken();

  print ('Token: $fcttkn');





}








}