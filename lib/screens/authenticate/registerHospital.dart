import 'package:dbapp/screens/authenticate/loginUser.dart';
import 'package:dbapp/screens/home/hospitalHome.dart';
import 'package:flutter/material.dart';
import 'package:dbapp/shared/loading.dart';
import 'package:flutter/services.dart';
import 'package:dbapp/services/auth.dart';

String name = '';
String contact = '';
String email = '';
String password = '';
String address = '';

class RegisterForm2 extends StatefulWidget {
  var userMap = new Map<String, dynamic>();
  Function toggleView;
  RegisterForm2({this.toggleView});

  @override
  _RegisterForm2State createState() => _RegisterForm2State(userMap);
}

class _RegisterForm2State extends State<RegisterForm2> {
  final Map<String, dynamic> userMap;
  _RegisterForm2State(this.userMap);
  final _formKey2 = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String error = '';
  bool loading = false;

  void initState() {
    super.initState();
    setState(() {
      name = '';
      contact = '';
      email = '';
      password = '';
      address = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: loading
          ? Loading()
          : Column(children: [
              Expanded(
                  child: Container(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 32),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(32, 32, 0, 0),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                SizedBox(height: 25),
                                Expanded(
                                    child: SizedBox(
                                        child: Padding(
                                  padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                                  child: Form(
                                      key: _formKey2,
                                      child:
                                          ListView(shrinkWrap: true, children: <
                                              Widget>[
                                        new Divider(
                                            height: 35.0,
                                            color: Colors.transparent),
                                        new Text(
                                          'Register With Us',
                                          style: TextStyle(
                                            fontFamily: 'GoogleSans',
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        new Divider(
                                            height: 35.0,
                                            color: Colors.transparent),
                                        new TextFormField(
                                            keyboardType: TextInputType.text,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: const InputDecoration(
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'GoogleSans'),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              border: UnderlineInputBorder(),
                                              icon: const Icon(Icons.person),
                                              labelText: 'Hospital Name',
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              }
                                              return null;
                                            },
                                            onChanged: (val) {
                                              setState(() => name = val);
                                            }),
                                        TextFormField(
                                            keyboardType: TextInputType.phone,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: const InputDecoration(
                                                labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'GoogleSans',
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue),
                                                ),
                                                border: UnderlineInputBorder(),
                                                icon: const Icon(Icons.phone),
                                                labelText:
                                                    'Hospital Contact No.'),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              } else if (value.length != 10) {
                                                return 'Incorrect';
                                              }
                                              return null;
                                            },
                                            onChanged: (val) {
                                              setState(() => contact = val);
                                            }),
                                        TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: const InputDecoration(
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'GoogleSans'),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              border: UnderlineInputBorder(),
                                              icon: const Icon(Icons.email),
                                              labelText: 'Hospital Email id',
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              }
                                              return null;
                                            },
                                            onChanged: (val) {
                                              setState(() => email = val);
                                            }),
                                        TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: const InputDecoration(
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'GoogleSans'),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              border: UnderlineInputBorder(),
                                              icon: const Icon(Icons.lock),
                                              labelText: 'Hospital Password',
                                            ),
                                            obscureText: true,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              }
                                              return null;
                                            },
                                            onChanged: (val) {
                                              setState(() => password = val);
                                            }),
                                        TextFormField(
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: const InputDecoration(
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'GoogleSans'),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              border: UnderlineInputBorder(),
                                              icon: const Icon(Icons.home),
                                              labelText: 'Hospital Address',
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Required';
                                              }
                                              return null;
                                            },
                                            onChanged: (val) {
                                              setState(() => address = val);
                                            }),
                                        new Divider(
                                            height: 30.0,
                                            color: Colors.transparent),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: MaterialButton(
                                            minWidth: double.infinity,
                                            height: 48,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            color: new Color(0xff0350C2),
                                            child: Text(
                                              'Register',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'GoogleSans'),
                                            ),
                                            onPressed: () async {
                                              if (_formKey2.currentState
                                                  .validate()) {
                                                setState(() {
                                                  widget.userMap['name'] = name;
                                                  userMap['contact'] = contact;
                                                  userMap['address'] = address;
                                                  userMap['email'] = email;
                                                  userMap['password'] =
                                                      password;
                                                });
                                                var user = await _auth
                                                    .registerHospital(userMap);
                                                if (user != null) {
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          HospitalHome(),
                                                    ),
                                                    (route) => false,
                                                  );
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                        new Divider(
                                            height: 10.0,
                                            color: Colors.transparent),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Already Registered? ',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFF959595),
                                                    fontSize: 14.5,
                                                    fontFamily: 'GoogleSans')),
                                            SizedBox(height: 5.0),
                                            InkWell(
                                              onTap: () => {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UserLogin()))
                                              },
                                              child: Container(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 12),
                                                child: Text("Login Here",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'GoogleSans',
                                                        color: new Color(
                                                            0xff0350C2),
                                                        fontSize: 14.5,
                                                        decoration:
                                                            TextDecoration
                                                                .underline)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.0),
                                        Text(error,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 14.0))
                                      ])),
                                )))
                              ]))))
            ]),
    );
  }
}
