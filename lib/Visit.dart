import 'package:flutter/material.dart';
import 'package:testt/component/fom.dart';
import 'package:testt/setting.dart';

class Visit extends StatefulWidget {
  const Visit({super.key});

  @override
  State<Visit> createState() => _VisitState();
}

class _VisitState extends State<Visit> {
  @override
  var searchController = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(lebar(context) * 0.053),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: searchfield(
                        searchController, context, "Search Pelanggan")),
                SizedBox(
                  width: lebar(context) * 0.07,
                ),
                Container(
                    height: lebar(context) * 0.06,
                    width: lebar(context) * 0.06,
                    child: searchButton(Icons.search, biru, hitam)),
              ],
            ),
            Expanded(child: cardSearch(context))
          ],
        ),
      ),
    );
  }

  Widget cardSearch(context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: tinggi(context) * 0.2,
            width: lebar(context),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              // shadowColor: Color.fromRGBO(237, 155, 12, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: tinggi(context) * 0.014,
                      ),
                      Text(
                        "Kevin Prayitno ",
                        style: TextStyle(
                            color: hitam,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: tinggi(context) * 0.014,
                      ),
                      Text(
                        "JL.JAGIR JAYA GG  6 Surabaya",
                        style: TextStyle(
                            color: hitam,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: tinggi(context) * 0.014,
                      ),
                      Text(
                        "08213555665",
                        style: TextStyle(
                            color: hitam,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
                  Column(
                    children: [
                      Text(
                        "Active",
                        style: TextStyle(
                            color: hitam,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: tinggi(context) * 0.014,
                      ),
                      Container(
                          height: tinggi(context) * 0.09,
                          width: lebar(context) * 0.15,
                          child: loginButton('Visit',
                              Color.fromARGB(255, 129, 199, 132), hitam))
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
