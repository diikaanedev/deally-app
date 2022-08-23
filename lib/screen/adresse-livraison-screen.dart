import 'package:deally_app/models/adress-model.dart';
import 'package:deally_app/screen/adresse-livraison-ajout-screen.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/adresse_livraison_widget_all.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdresseLivraisonScreen extends StatefulWidget {
  final String textAdress;
  const AdresseLivraisonScreen({Key? key, this.textAdress = "Delivery address"})
      : super(key: key);

  @override
  _AdresseLivraisonScreenState createState() => _AdresseLivraisonScreenState();
}

class _AdresseLivraisonScreenState extends State<AdresseLivraisonScreen> {
  late Size size;

  List<AdresseModel> listes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAdresse();
  }

  getAdresse() async {
    await getResponse(url: '/address/me').then((value) {
      print(value);
      setState(() {
        listes = AdresseModel.fromJson(data: value['data']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: .0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
            ),
            Positioned(
                top: 0,
                child: Container(
                  height: size.height * .75,
                  width: size.width,
                  child: LayoutBuilder(
                    builder: (context, constraints) => ListView(
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * .05,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: constraints.maxWidth * .07,
                            ),
                            Text(
                              widget.textAdress.toUpperCase(),
                              style: TextStyle(
                                fontSize: size.width * .035,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxHeight * .05,
                        ),
                        Column(
                          children: listes
                              .map((e) => Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: constraints.maxHeight * .25,
                                          width: constraints.maxWidth,
                                          child: AdresseLivraisonWidgetAll(
                                              adresse: e,
                                              bp: '75015',
                                              city: 'Paris',
                                              contry: 'France',
                                              nom: 'Voinea Emmanuel',
                                              numero: '+33 65 44 53 32',
                                              rue: '4 rue de Fécamp',
                                              isDefault: e.isDefault,
                                              isMap: e.isMap,
                                              asset_contry:
                                                  "assets/images/drapeau-nigeria.png"),
                                        ),
                                        SizedBox(
                                          height: constraints.maxHeight * .02,
                                        ),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
                bottom: size.height * .02,
                left: size.width * .05,
                child: Container(
                  height: size.height * .15,
                  width: size.width * .9,
                  color: blanc,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AdresseLivraisonAjoutScreen(),
                              )),
                          child: Container(
                            width: size.width * .9,
                            child: Center(
                              child: Text(
                                'add a new address'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: size.width * .03,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: noir, width: .5),
                                borderRadius:
                                    BorderRadius.circular(size.width * .02)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Expanded(
                          child: Container(
                        child: BtnByDiiConnexion(
                            titre: "Save",
                            onTap: () {
                              Navigator.pop(context, true);
                            },
                            bgNormal: 1),
                      )),
                      SizedBox(
                        height: size.height * .01,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
