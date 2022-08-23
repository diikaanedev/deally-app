// import 'dart:ui';

// import 'package:deally_app/models/categorie_by_dii.dart';
// import 'package:deally_app/models/produit_by_dii.dart';
// import 'package:deally_app/utils/colors-by-dii.dart';
// import 'package:deally_app/utils/requette-by-dii.dart';
// import 'package:deally_app/widgets/categorie-widget.dart';
// import 'package:deally_app/widgets/menu-bottom-by-dii.dart';
// import 'package:deally_app/widgets/produit-home-widget.dart';
// import 'package:flutter/material.dart';

// class HomePageScreen extends StatefulWidget {
//   const HomePageScreen({Key? key}) : super(key: key);

//   @override
//   _HomePageScreenState createState() => _HomePageScreenState();
// }

// class _HomePageScreenState extends State<HomePageScreen> {
//   late Size size;
//   List<ProduitModel> listeProduct = [];
//   List<Container> listeWidget = [];
//   @override
//   void initState() {
//     super.initState();
//     getInfo();
//     getProduct();
//   }

//   getProduct() async {
//     await getResponse(url: '/products').then((value) {
//       // print(value['data'][0]['attributes']['image']['data']);
//       setState(() {
//         listeProduct = ProduitModel.fromJson(data: value['data']);
//         listeWidget = listeProduct
//             .map(
//               (e) => Container(
//                 width: size.width * .45,
//                 child: Center(
//                     child: ProduitHomeWidget(
//                   produitModel: e,
//                 )),
//               ),
//             )
//             .toList();

//         listeWidget.add(Container(
//           width: size.width * .45,
//         ));
//         listeWidget.add(Container(
//           width: size.width * .45,
//         ));
//       });
//     });
//   }

//   getInfo() async {
//     await getResponse(url: "/users").then((value) => {print(value['data'])});
//   }

//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: meuveFonce,
//         elevation: .0,
//         toolbarHeight: .0,
//       ),
//       backgroundColor: blanc,
//       body: Stack(
//         children: [
//           Container(
//             height: size.height,
//             width: size.width,
//           ),
//           Positioned(
//               child: Container(
//             height: size.height,
//             width: size.width,
//             child: ListView(
//               children: [
//                 Container(
//                   height: size.height * .15,
//                   width: size.width,
//                   child: Column(
//                     children: [
//                       Expanded(
//                           flex: 2,
//                           child: Container(
//                             // color: rouge,
//                             child: Row(
//                               children: [
//                                 Spacer(),
//                                 Icon(
//                                   Icons.search_rounded,
//                                   size: size.width * .07,
//                                   color: meuveFonce,
//                                 ),
//                                 SizedBox(
//                                   width: size.width * .05,
//                                 )
//                               ],
//                             ),
//                           )),
//                       Expanded(
//                           flex: 3,
//                           child: FutureBuilder(
//                               future: Future.delayed(Duration(seconds: 5)),
//                               builder: (snapshot, context) {
//                                 return Container(
//                                   child: Column(
//                                     children: [
//                                       Text(
//                                         "Welcome sss,",
//                                         style: TextStyle(
//                                             fontSize: size.width * .05,
//                                             fontWeight: FontWeight.w300),
//                                       ),
//                                       Text(
//                                         "Alpha Supermaket",
//                                         style: TextStyle(
//                                             fontSize: size.width * .05,
//                                             fontWeight: FontWeight.w300,
//                                             color: meuveFonce),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               })),
//                     ],
//                   ),
//                   decoration: BoxDecoration(
//                       // image: DecorationImage(
//                       //     image: AssetImage("assets/images/bg-sododin.png"),
//                       //     fit: BoxFit.cover),
//                       // gradient: LinearGradient(
//                       //     begin: Alignment.centerLeft,
//                       //     end: Alignment.centerRight,
//                       //     tileMode: TileMode.mirror,
//                       //     colors: [
//                       //       blanc,
//                       //       blanc,
//                       //       blanc,
//                       //       gris.withOpacity(.04),
//                       //     ]),
//                       color: gris.withOpacity(.4)),
//                 ),
//                 SizedBox(
//                   height: size.height * .02,
//                 ),
//                 Container(
//                   height: size.height * .12,
//                   width: size.width,
//                   // color: gris.withOpacity(.2),
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: listCategorieShopping
//                         .map(
//                           (e) => Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               // color: rouge,
//                               width: size.width * .2,
//                               child: CategorieWidget(
//                                 categorieShopList: e,
//                                 ontap: () {},
//                               ),
//                             ),
//                           ),
//                         )
//                         .toList(),
//                   ),
//                 ),
//                 SizedBox(
//                   height: size.height * .02,
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: size.width * .05,
//                     ),
//                     Text(
//                       'Nos Meilleurs offres pour vous',
//                       style: TextStyle(
//                           fontSize: size.width * .04,
//                           fontWeight: FontWeight.w300),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: size.height * .05,
//                 ),
//                 Center(
//                   child: SizedBox(
//                     height: size.height * .6,
//                     width: size.width * .95,
//                     child: GridView.count(
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 8,
//                         childAspectRatio: .7,
//                         crossAxisCount: 2,
//                         children: listeWidget),
//                   ),
//                 ),
//                 SizedBox(
//                   height: size.height * .05,
//                 ),
//                 Row(
//                   children: [
//                     Spacer(),
//                     Text(
//                       'Voir tous les produits',
//                       style: TextStyle(
//                           fontWeight: FontWeight.w300,
//                           fontSize: size.width * .05),
//                     ),
//                     SizedBox(
//                       width: size.width * .02,
//                     ),
//                     Icon(
//                       Icons.arrow_forward_rounded,
//                       color: meuveFonce,
//                     ),
//                     Spacer(),
//                   ],
//                 ),
//                 SizedBox(
//                   height: size.height * .2,
//                 )
//               ],
//             ),
//           )),
//           Positioned(
//               bottom: size.height * .02,
//               child: Container(
//                 height: size.height * .07,
//                 width: size.width,
//                 child: Center(
//                     child: MenuBottomByDii(
//                   choix: 0,
//                 )),
//               ))
//         ],
//       ),
//     );
//   }
// }
