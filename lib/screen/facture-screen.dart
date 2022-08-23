import 'package:deally_app/models/invoice-model.dart';
import 'package:deally_app/utils/colors-by-dii.dart';
import 'package:deally_app/utils/requette-by-dii.dart';
import 'package:flutter/material.dart';

class FactureScreen extends StatefulWidget {
  const FactureScreen({Key? key}) : super(key: key);

  @override
  State<FactureScreen> createState() => _FactureScreenState();
}

class _FactureScreenState extends State<FactureScreen> {
  late Size size;
  bool isAllSelect = false;
  int isSelect = 0;

  List<InvoiceModel> listeInvoice = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListOrderItem();
  }

  getListOrderItem() async {
    await getResponse(url: "invoices?populate=*").then((value) {
      setState(() {
        listeInvoice = InvoiceModel.fromList(data: value['data']);
      });
    });
    if (listeInvoice.isEmpty) {
      print("is here");
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blanc,
      appBar: AppBar(
        backgroundColor: meuveFonce,
        elevation: .0,
        title: Row(
          children: [
            Text(
              'My bills'.toUpperCase(),
              style: TextStyle(
                fontSize: size.height * .025,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
          ),
          Positioned(
              child: Container(
            height: size.height,
            width: size.width,
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * .03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * .05,
                    ),
                    Text(
                      "My bills",
                      style: TextStyle(
                          fontSize: size.width * .045,
                          color: meuveFonce,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Container(
                  child: Column(
                    children: listeInvoice
                        .map(
                          (e) => Container(
                            height: size.height * .2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              // child: ListFacture(
                              //   isSelectable: isSelect,
                              //   // invocationModel: e,
                              //   onTap: () => Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               DetailsFactureScreen(

                              //               ))),
                              // ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: size.height * .2,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
