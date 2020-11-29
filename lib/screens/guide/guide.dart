import 'package:dbapp/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:dbapp/shared/drawer.dart';

final myDrawer _drawer = new myDrawer();

class Guide extends StatefulWidget {
  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: _drawer,
      body: Column(
        children: [
          Expanded(
              child: Container(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15.0, 42, 0, 0),
                          child: Row(children: [
                            IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  _scaffoldKey.currentState.openDrawer();
                                }),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                              child: Text(
                                "Medical Guide",
                                style: kTitleTextstyle,
                              ),
                            )
                          ]),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: ListView(children: [
                                  PreventCard(
                                    text:
                                        "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                                    image: "assets/images/wear_mask.png",
                                    title: "Wear face mask",
                                  ),
                                  PreventCard(
                                    text:
                                        "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                                    image: "assets/images/wash_hands.png",
                                    title: "Wash your hands",
                                  ),
                                  PreventCard(
                                    text:
                                        "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                                    image: "assets/images/wear_mask.png",
                                    title: "Wear face mask",
                                  ),
                                  PreventCard(
                                    text:
                                        "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                                    image: "assets/images/wash_hands.png",
                                    title: "Wash your hands",
                                  ),
                                  PreventCard(
                                    text:
                                        "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                                    image: "assets/images/wear_mask.png",
                                    title: "Wear face mask",
                                  ),
                                  SizedBox(height: 50),
                                ])))
                      ]))))
        ],
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key key,
    this.image,
    this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
