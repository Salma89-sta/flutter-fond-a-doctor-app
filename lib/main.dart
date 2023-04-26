import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'authentication/firesroreAthuntication.dart';
late AuthenticationMethods authenticationMethods;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  authenticationMethods = AuthenticationMethods();
  runApp( MyApp());
}
