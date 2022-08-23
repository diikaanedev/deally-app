import 'package:deally_app/screen/adresse-livraison-screen.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/get-position.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:deally_app/widgets/btn-by-dii-connexion.dart';
import 'package:deally_app/widgets/btn-by-dii.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdresseLivraisonAjoutScreen extends StatefulWidget {
  const AdresseLivraisonAjoutScreen({Key? key}) : super(key: key);

  @override
  _AdresseLivraisonAjoutScreenState createState() =>
      _AdresseLivraisonAjoutScreenState();
}

class _AdresseLivraisonAjoutScreenState
    extends State<AdresseLivraisonAjoutScreen> {
  late Size size;
  TextEditingController nom = TextEditingController();
  FocusNode focusNodeNom = FocusNode();
  TextEditingController prenom = TextEditingController();
  FocusNode focusNodePrenom = FocusNode();
  TextEditingController phone = TextEditingController();
  FocusNode focusNodePhone = FocusNode();
  TextEditingController pays = TextEditingController();
  FocusNode focusNodePays = FocusNode();
  TextEditingController ville = TextEditingController();
  FocusNode focusNodeVille = FocusNode();
  TextEditingController cp = TextEditingController();
  FocusNode focusNodeCp = FocusNode();
  TextEditingController rue = TextEditingController();
  FocusNode focusNodeRue = FocusNode();
  TextEditingController apartement = TextEditingController();
  FocusNode focusNodeApartement = FocusNode();

  bool isMap = false;
  bool isMapSelect = false;
  bool chargement = false;
  String localizationAdress = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  getInfo() async {
    await getResponse(url: "/users").then((value) => setState(() {
          print(value['data']['user']);
          nom.value = TextEditingValue(text: value['data']['user']['lastName']);
          prenom.value =
              TextEditingValue(text: value['data']['user']['firstName']);
          phone.value = TextEditingValue(text: value['data']['user']['phone']);
          pays.value = TextEditingValue(text: value['data']['user']['contry']);
          ville.value = TextEditingValue(text: value['data']['user']['city']);
        }));
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
        height: size.height * .95,
        width: size.width,
        child: ListView(
          reverse: false,
          shrinkWrap: false,
          children: [
            SizedBox(
              height: size.height * .02,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * .05,
                ),
                Text(
                  'Add new address'.toUpperCase(),
                  style: TextStyle(
                    fontSize: size.width * .035,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Center(
              child: Container(
                width: size.width * .9,
                height: size.height * .06,
                decoration: BoxDecoration(
                  border: Border.all(color: noir.withOpacity(.6)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * .03),
                  child: TextFormField(
                    // cursorHeight: constraints.maxHeight * .4,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    focusNode: focusNodeNom,
                    controller: nom,
                    onChanged: (value) => null,
                    obscureText: false,
                    style: TextStyle(fontSize: size.height * .02),
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Center(
              child: Container(
                width: size.width * .9,
                height: size.height * .06,
                decoration: BoxDecoration(
                  border: Border.all(color: noir.withOpacity(.6)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * .03),
                  child: TextFormField(
                    // cursorHeight: constraints.maxHeight * .4,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    focusNode: focusNodePrenom,
                    controller: prenom,
                    onChanged: (value) => null,
                    obscureText: false,
                    style: TextStyle(fontSize: size.height * .02),
                    decoration: InputDecoration(
                      hintText: 'Firts Name',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            Center(
              child: Container(
                width: size.width * .9,
                height: size.height * .06,
                decoration: BoxDecoration(
                  border: Border.all(color: noir.withOpacity(.6)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.height * .03),
                  child: TextFormField(
                    // cursorHeight: constraints.maxHeight * .4,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    focusNode: focusNodePhone,
                    controller: phone,
                    onChanged: (value) => null,
                    obscureText: false,
                    style: TextStyle(fontSize: size.height * .02),
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: size.height * .02),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: size.width * .03,
            //     ),
            //     CupertinoSwitch(
            //       value: isMap,
            //       activeColor: meuveFonce,
            //       onChanged: (v) => setState(() {
            //         isMap = v;
            //       }),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: size.height * .02,
            // ),
            isMap
                ? Container(
                    height: size.height * .37,
                    child: Column(
                      children: [
                        Container(
                          height: size.height * .2,
                          width: size.width * .84,
                          decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.4)),
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/map.png"),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              Spacer(),
                              Container(
                                height: size.height * .07,
                                width: size.height * .07,
                                child: Center(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: Center(
                                      child: Icon(
                                        Icons.circle,
                                        size: 15,
                                        color: meuveFonce,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: blanc,
                                        border:
                                            Border.all(color: noir, width: .2)),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: meuveFonce.withOpacity(.2),
                                    borderRadius: BorderRadius.circular(
                                        size.height * .1)),
                              ),
                              Spacer()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        SizedBox(
                          height: size.height * .05,
                          width: size.width * .85,
                          child: Container(
                            child: BtnByDii(
                              titre: isMapSelect
                                  ? "Geolocated "
                                  : "save geolocation",
                              onTap: () async {
                                getPosition().then((value) async {
                                  var d = await getAdress(Coordinates(
                                      latitude: value.latitude,
                                      longitude: value.longitude));
                                  setState(() {
                                    localizationAdress = d.toString();
                                  });
                                });
                                print(localizationAdress);
                                setState(() {
                                  isMapSelect = !isMapSelect;
                                });
                              },
                              haveBg: isMapSelect,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            width: size.width * .9,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height * .03),
                              child: TextFormField(
                                // cursorHeight: constraints.maxHeight * .4,
                                keyboardType: TextInputType.name,
                                focusNode: focusNodePays,
                                controller: pays,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) => null,
                                obscureText: false,
                                style: TextStyle(fontSize: size.height * .02),
                                decoration: InputDecoration(
                                  hintText: 'Country',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: size.height * .02),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Center(
                          child: Container(
                            width: size.width * .9,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height * .03),
                              child: TextFormField(
                                // cursorHeight: constraints.maxHeight * .4,
                                keyboardType: TextInputType.name,
                                focusNode: focusNodeVille,
                                controller: ville,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) => null,
                                obscureText: false,
                                style: TextStyle(fontSize: size.height * .02),
                                decoration: InputDecoration(
                                  hintText: 'State and/or locality',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: size.height * .02),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Center(
                          child: Container(
                            width: size.width * .9,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height * .03),
                              child: TextFormField(
                                // cursorHeight: constraints.maxHeight * .4,
                                keyboardType: TextInputType.name,
                                focusNode: focusNodeCp,
                                controller: cp,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) => null,
                                obscureText: false,
                                style: TextStyle(fontSize: size.height * .02),
                                decoration: InputDecoration(
                                  hintText: 'Postal code',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: size.height * .02),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Center(
                          child: Container(
                            width: size.width * .9,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height * .03),
                              child: TextFormField(
                                // cursorHeight: constraints.maxHeight * .4,
                                keyboardType: TextInputType.name,
                                focusNode: focusNodeRue,
                                controller: rue,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) => null,
                                obscureText: false,
                                style: TextStyle(fontSize: size.height * .02),
                                decoration: InputDecoration(
                                  hintText: 'Street, number & city',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: size.height * .02),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        Center(
                          child: Container(
                            width: size.width * .9,
                            height: size.height * .06,
                            decoration: BoxDecoration(
                              border: Border.all(color: noir.withOpacity(.6)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height * .03),
                              child: TextFormField(
                                // cursorHeight: constraints.maxHeight * .4,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.done,
                                focusNode: focusNodeApartement,
                                controller: apartement,
                                onChanged: (value) => null,
                                obscureText: false,
                                style: TextStyle(fontSize: size.height * .02),
                                decoration: InputDecoration(
                                  hintText: 'Further informations for location',
                                  hintStyle: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: size.height * .02),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

            SizedBox(
              height: size.height * .05,
            ),
            Center(
              child: SizedBox(
                height: size.height * .08,
                width: size.width * .9,
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Expanded(
                        child: Container(
                            child: BtnByDiiConnexion(
                                titre: chargement == false
                                    ? "Save new address"
                                    : "Loading ...",
                                onTap: chargement == false
                                    ? () async {
                                        setState(() {
                                          chargement = true;
                                        });
                                        Map<String, dynamic> body;
                                        if (isMapSelect) {
                                          body = {
                                            "name":
                                                "delevry adress de ${prenom.text} ${nom.text} ",
                                            "addr1": localizationAdress,
                                            "addr2": "",
                                            "city": ville.text,
                                            "country": localizationAdress
                                                .split(',')
                                                .last,
                                            "zipcode": "",
                                            "phone": phone.text,
                                            "firstName": nom.text,
                                            "lastName": prenom.text,
                                            "default": false,
                                          };
                                        } else {
                                          body = {
                                            "name":
                                                "delevry adress ${prenom.text} ${nom.text} ",
                                            "addr1": rue.text,
                                            "addr2": apartement.text,
                                            "city": ville.text,
                                            "country": pays.text,
                                            "zipcode": cp.text,
                                            "phone": phone.text,
                                            "firstName": nom.text,
                                            "lastName": prenom.text,
                                            "default": false,
                                          };
                                        }

                                        print(body);

                                        var response = await postResponse(
                                            url: '/address', body: body);

                                        print(response['body']);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AdresseLivraisonScreen(),
                                            ));
                                      }
                                    : () {},
                                bgNormal: isMap
                                    ? isMapSelect
                                        ? 1
                                        : 0
                                    : 1))),
                    SizedBox(
                      height: size.height * .01,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            )
          ],
        ),
      ),
    );
  }
}
