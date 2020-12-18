import 'package:dbapp/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

_makingPhoneCall() async {
  const url = 'tel:9898989899';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class Contact extends StatelessWidget {
  void sendMail(context) async {
    final MailOptions mailOptions = MailOptions(
      body: '',
      subject: "Medistat Help ",
      recipients: ["spiralforge4@gmail.com"],
      isHTML: true,
    );
    try {
      await FlutterMailer.send(mailOptions);
    }  catch (error) {
      Toast.show(error, context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(children: [
      Expanded(
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 32),
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(height: 25),
                    Text("Contact us ",
                        style: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 32)),
                    SizedBox(height: 30.0),
                    Center(
                      child: Text("Facing a problem?",
                      style: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 25)),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: MaterialButton(
                                  onPressed: ()=>_makingPhoneCall(),
                                  minWidth: double.infinity,
                                  height: 48,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(
                                          color: AppColors.mediGrey)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 8.0, 0),
                                        child: new Icon(Icons.call,color:AppColors.mediBlue)
                                      ),
                                      Text(
                                        'Call us',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'GoogleSans'),
                                      ),
                                    ],
                                  ),
                                  
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                child: MaterialButton(
                                  onPressed: ()=>sendMail(context),
                                  minWidth: double.infinity,
                                  height: 48,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(
                                          color: AppColors.mediGrey)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 8.0, 0),
                                        child: new Icon(Icons.email,color:AppColors.mediBlue)
                                      ),
                                      Text(
                                        'Email us',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'GoogleSans'),
                                      ),
                                    ],
                                  ),
                                  
                                ),
                              ),            
        ])))
            ]));
  }
 
}

