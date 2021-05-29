import 'package:covidapp/constants.dart';
import 'package:covidapp/wiget/week_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildDetailAppBar(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 21),
                          blurRadius: 53,
                          color: Colors.black.withOpacity(0.05))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitleWithMore(),
                    SizedBox(
                      height: 15,
                    ),
                    buildCaseNumber(context),
                     SizedBox(
                      height: 15,
                    ),
                    Text(
                      "From Health Center",
                      style: TextStyle(
                          color: kTextMediumColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 16),
                    ),
                    WeeklyChart()
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: [
        Text("547 ",
            style: Theme.of(context)
                .textTheme
                .display3
                .copyWith(color: kPrimaryColor, height: 1.2)),
        Text(
          "5.9%",
          style: TextStyle(color: kPrimaryColor),
        ),
        SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Row buildTitleWithMore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("New Cases",
            style: TextStyle(
                color: kTextMediumColor,
                fontSize: 15,
                fontWeight: FontWeight.w600)),
        SvgPicture.asset("assets/icons/more.svg")
      ],
    );
  }

  AppBar buildDetailAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackgroundColor,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: () {
            Navigator.pop(context);
          }),
      actions: [
        IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"), onPressed: () {})
      ],
    );
  }
}
