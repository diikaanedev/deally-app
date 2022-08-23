import 'package:deally_app/screen/loading-screen.dart';
import 'package:deally_app/screen/mes-commandes-screen.dart';
import 'package:deally_app/screen/mon-compte.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/widgets/menu-bottom-by-dii.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileMenuFournisseurScreen extends StatefulWidget {
  const ProfileMenuFournisseurScreen({Key? key}) : super(key: key);

  @override
  State<ProfileMenuFournisseurScreen> createState() =>
      _ProfileMenuFournisseurScreenState();
}

class _ProfileMenuFournisseurScreenState
    extends State<ProfileMenuFournisseurScreen> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: .0,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: size.height * .5,
                child: Column(
                  children: [
                    Spacer(),
                    SizedBox(
                      height: size.height * .1,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MonCompteScreen(),
                              )),
                          child: Text(
                            "My account",
                            style: TextStyle(
                                fontSize: size.height * .025,
                                color: blanc,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MesCommandesScreen(),
                              )),
                          child: Text(
                            "My orders",
                            style: TextStyle(
                                fontSize: size.height * .025,
                                color: blanc,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Text(
                          "Messaging",
                          style: TextStyle(
                              fontSize: size.height * .025,
                              color: blanc,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Text(
                          "Help & Contact",
                          style: TextStyle(
                              fontSize: size.height * .025,
                              color: blanc,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .05,
                        ),
                        GestureDetector(
                          onTap: () {
                            SharedPreferences.getInstance()
                                .then((prefs) => prefs.clear());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoadingScreen(),
                                ));
                          },
                          child: Text(
                            "Sign out",
                            style: TextStyle(
                                fontSize: size.height * .025,
                                color: blanc,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                    Spacer()
                  ],
                ),
                width: size.width,
                color: meuveFonce,
              )),
          Positioned(
              child: Container(
            height: size.height * .6,
            width: size.width,
            child: Column(
              children: [
                Spacer(),
                Container(
                  height: size.height * .3,
                  width: size.width,
                  child: Center(
                    child: Image.asset(
                      'assets/images/LOGO-FINAL.png',
                      height: size.height * .1,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            decoration: BoxDecoration(
                color: blanc,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
          )),
          Positioned(
              bottom: size.height * .4,
              child: Container(
                height: size.height * .1,
                width: size.width,
                child: Center(
                    child: MenuBottomByDii(
                  choix: 3,
                )),
              )),
        ],
      ),
    );
  }
}
