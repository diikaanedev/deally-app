// @dart=2.9
import 'package:deally_app/screen/fournisseur/home-page-screen.dart';
import 'package:deally_app/screen/fournisseur/home-screen.dart';
import 'package:deally_app/screen/fournisseur/menu-profile-fournisseur-screen.dart';
import 'package:deally_app/screen/loading-screen.dart';
import 'package:deally_app/screen/profile-menu-screen.dart';
import 'package:deally_app/screen/recouver-password.dart';
import 'package:deally_app/screen/register-one.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sodidin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: createMaterialColor(meuveFonce),
          fontFamily: 'Resolve_sans'),
      // initialRoute: '/loading',
      initialRoute: '/',
      routes: {
        '/loading': (context) => const LoadingScreen(),
        '/choice-register': (context) => const RegisterOne(),
        '/recouver-password': (context) => const RecouverPassword(),
        '/home-menu': (context) => FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.getString('token') != "" &&
                      snapshot.data.containsKey("token")) {
                    if (snapshot.data.getString('role') == "commercant") {
                      return const ProfileMenuScreen();
                    } else if (snapshot.data.getString('role') ==
                        "fournisseur") {
                      return const ProfileMenuFournisseurScreen();
                    } else {
                      return const ProfileMenuScreen();
                    }
                  } else {
                    print("pas voila");
                    return const LoadingScreen();
                  }
                } else {
                  print("voile ");
                  return const LoadingScreen();
                }
              },
            ),
        '/': (context) => FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.getString('token') != "" &&
                    snapshot.data.containsKey("token")) {
                  if (snapshot.data.getString('role') == "commercant") {
                    return const HomePageScreen();
                  } else if (snapshot.data.getString('role') == "fournisseur") {
                    return const HomeFournisseurScreen();
                  } else {
                    return const HomeFournisseurScreen();
                  }
                } else {
                  return const LoadingScreen();
                }
              } else {
                return const LoadingScreen();
              }
            }),
      },
    );
  }
}
