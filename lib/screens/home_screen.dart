import 'package:covidapp/constants.dart';
import 'package:covidapp/screens/detail_screen.dart';
import 'package:covidapp/wiget/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(.03),
        elevation: 0,
        leading: IconButton(
            icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
        actions: [
          IconButton(
              icon: SvgPicture.asset("assets/icons/search.svg"),
              onPressed: () {})
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
            width: double.infinity,
            decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                InfoCard(
                  effectedNum: 1062,
                  title: "Confirmed Cases",
                  iconColor: Color(0xFFFF9C00),
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen();
                    }));
                  },
                ),
                InfoCard(
                    effectedNum: 75,
                    title: "Total Deaths",
                    iconColor: Color(0xFFFF2D55),
                    press: () {}),
                InfoCard(
                    effectedNum: 689,
                    title: "Total Recovered",
                    iconColor: Color(0xFF50E3C2),
                    press: () {}),
                InfoCard(
                    effectedNum: 52,
                    title: "New Cases",
                    iconColor: Color(0xFF5856D6),
                    press: () {}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Preventions",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    preven("assets/icons/hand_wash.svg", "Wash Hands"),
                    preven("assets/icons/use_mask.svg", "User Masks"),
                    preven(
                        "assets/icons/Clean_Disinfect.svg", "Clean Dislnfect")
                  ],
                ),
                SizedBox(height: 20),
                Container(
                    height: 150,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .4),
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [Color(0xFF60BE93), Color(0xFF1B8D59)],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SvgPicture.asset("assets/icons/nurse.svg"),
                        ),
                        Positioned(
                          top: 40,
                          right: 100,
                          child: RichText(
                            text: TextSpan(
                                // style: TextStyle(color: kBackgroundColor),
                                children: [
                                  TextSpan(
                                      text: "Dial 999 for\nMedical Help!\n",
                                      style: Theme.of(context)
                                          .textTheme
                                          .title
                                          .copyWith(color: Colors.white)),
                                  TextSpan(
                                      text: "if any symptoms appear",
                                      style: TextStyle(fontSize: 12))
                                ]),
                          ),
                        ),
                        Positioned(
                            top: 30,
                            right: 10,
                            child: SvgPicture.asset("assets/icons/virus.svg"))
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column preven(primage, prtext) {
    return Column(
      children: [
        Container(
          child: SvgPicture.asset(
            primage,
            width: 100,
            height: 100,
          ),
        ),
        Text(
          prtext,
          style: TextStyle(
              color: kPrimaryColor.withOpacity(0.8),
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
