import 'package:dbapp/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:dbapp/shared/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

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
                                        "When you think 'life-saving skills,' the first thing that probably comes to mind is CPR, the technique that could make all the difference for someone who has collapsed and is under cardiac arrest. Learn More:",
                                    link:"https://youtu.be/-NodDRTsV88",
                                    image: "assets/images/wear_mask.png",
                                    title: "How to Perform CPR",
                                  ),
                                  PreventCard(
                                    text:
                                        "With one out of every seven deaths happening in the India because of heart disease, it's important to know the common signs of heart attacks and what you can do to help a person going through it",
                                    image: "assets/images/wash_hands.png",
                                    title: "What to Do If Someone May Be Having a Heart Attack",
                                    link:"https://youtu.be/gDwt7dD3awc"
                                  ),
                                  PreventCard(
                                    text:
                                        "Drowning is one of the most common causes of accidental death, especially among children. If you're not a skilled swimmer who knows how to swim with a possibly flailing person, the most important thing to know is.",
                                    image: "assets/images/wear_mask.png",
                                    title: "What to Do If Someone May Be Having a Heart Attack",
                                    link:"https://youtu.be/v-kCzuUYadI",
                                  ),
                                  PreventCard(
                                    text:
                                        "There are different kinds of bleeding, from a minor scrape to the most dangerous type, arterial bleeding. In either case, your goal is to stop the bleeding as soon as possible. ",
                                    image: "assets/images/wash_hands.png",
                                    title: "How to Treat a Bleeding",
                                    link:"https://youtu.be/NxO5LvgqZe0",
                                  ),
                                  PreventCard(
                                    text:
                                        "Immediately after a burn, run cool tap water over the skin for 10 minutes. Then, cool the skin with a moist compress. Don't put ice, butter or anything else directly on the burned skin.",
                                    image: "assets/images/wash_hands.png",
                                    title: "How to Treat a Burn",
                                    link:"https://youtu.be/EaJmzB8YgS0",
                                  ),
                                  PreventCard(
                                    text:
                                        "The fear of every pregnant woman and her partner: Having to deliver the baby without help. This might not be a priority life skill for you if you don't often find yourself in the company of a pregnant lady, but one of the things about survival skills is you never know when you're going to need them",
                                    image: "assets/images/wear_mask.png",
                                    title: "How to Deliver Baby in a Car ",
                                    link:"https://youtu.be/4pOSNcEOaTI",
                                  ),
                                  PreventCard(
                                    text:
                                        "Usually it's best to leave a person who's hurt where they are until medical help comes. You should never move a person who might have a head, neck, or spinal injury. In other cases, however, you might need to move someone to a safer location. If you're not very strong or that person is heavier than you, here's how to lift that person.",
                                    image: "assets/images/wear_mask.png",
                                    title: "How to Carry Someone Heavier Than You",
                                    link:"https://youtu.be/U0yDJ0udMkg",
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
  final String link;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
    this.link
  }) : super(key: key);

  void urlLaunch(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

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
                height: 150,
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
                      child: Column(
                        children: [
                          Expanded(
                            child: Text(
                              text,
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()=> urlLaunch(link),
                      child: Text(
                        link,
                        style: TextStyle(
                              fontSize: 12,
                              color: AppColors.mediBlue
                            ),
                      ),
                    ),
                        ],
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

