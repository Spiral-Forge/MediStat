import 'package:dbapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

_makingPhoneCall() async {
  const url = 'tel:102';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: Column(children: [
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
                    "MediStat",
                    style: kTitleTextstyle,
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      // width: MediaQuery.of(context).size.height / 2,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mediBlue.withOpacity(0.3)),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 6 -
                          MediaQuery.of(context).size.height / 6.6,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 6.6,
                      child: Container(
                        width: MediaQuery.of(context).size.height / 3.3,
                        height: MediaQuery.of(context).size.height / 3.3,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mediBlue.withOpacity(0.7)),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 6 -
                          MediaQuery.of(context).size.height / 7.4,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 7.4,
                      child: InkResponse(
                        onTap: () => print("coolcoolcool"),
                        child: Container(
                          width: MediaQuery.of(context).size.height / 3.7,
                          height: MediaQuery.of(context).size.height / 3.7,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.mediBlue),
                          child: Center(
                            child: Text("Get instant help",
                                style: kHeadingTextStyle
                                // TextStyle(color: Colors.white, fontSize: 24),
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40),
                Stack(
                  children: <Widget>[
                    Container(
                      // width: MediaQuery.of(context).size.height / 2,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mediBlue.withOpacity(0.3)),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 6 -
                          MediaQuery.of(context).size.height / 6.6,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 6.6,
                      child: Container(
                        width: MediaQuery.of(context).size.height / 3.3,
                        height: MediaQuery.of(context).size.height / 3.3,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mediBlue.withOpacity(0.7)),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 6 -
                          MediaQuery.of(context).size.height / 7.4,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 7.4,
                      child: InkResponse(
                        onTap: () => _makingPhoneCall(),
                        child: Container(
                          width: MediaQuery.of(context).size.height / 3.7,
                          height: MediaQuery.of(context).size.height / 3.7,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.mediBlue),
                          child: Center(
                            child: Text("Call an ambulance",
                                style: kHeadingTextStyle
                                // TextStyle(color: Colors.white, fontSize: 24),
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ]),
        )))
      ]),
    );
  }
}
