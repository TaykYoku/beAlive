import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:be_alive/intro.dart';
import 'package:be_alive/parameters.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _email, _password, _login;
  final GlobalKey<FormFieldState> _passwordField = GlobalKey<FormFieldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String beforeLogo = 'Увійдіть за допомогою облікового запису';
  final String afterLogo = 'або використайте e-mail';

  Future<void> register() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult auth = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        log(auth.toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Intro()),
        );
      } catch (e) {
        log(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
        body: Stack(children: <Widget>[
      Center(
          child: Image.asset(
        'assets/background.png',
        width: size.width,
        height: size.height,
        fit: BoxFit.fill,
      )),
      Column(children: <Widget>[
        Container(height: padding.top, width: size.width, color: Colors.white),
        Expanded(
            child: SingleChildScrollView(
                child: Container(
                    height: size.height - padding.top,
                    width: size.width,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.arrow_back_ios)
                                    ]),
                                Center(
                                  child: Text(
                                    "ЛИШАЙСЯ З НАМИ",
                                    style: TextStyle(
                                      color: BeColors.primary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Expanded(
                              flex: 2,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(beforeLogo,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white)),
                                    Image.asset('assets/basic/google_plus.png',
                                        height: size.width * 0.2,
                                        width: size.width * 0.2),
                                    Text(afterLogo,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white)),
                                  ])),
                          Expanded(
                              flex: 3,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Form(
                                      key: _formKey,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            TextFormField(
                                              style: TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                  labelText: 'Login',
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                  labelStyle: TextStyle(
                                                      color: Colors.white),
                                                  prefixIcon: Icon(
                                                      BeIcons.be_user,
                                                      color: BeColors.white)),
                                              onSaved: (input) =>
                                                  _login = input,
                                            ),
                                            TextFormField(
                                                style: TextStyle(
                                                    color: Colors.white),
                                                decoration: InputDecoration(
                                                    labelText: 'Email',
                                                    fillColor: Colors.white,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                    labelStyle: TextStyle(
                                                        color: Colors.white),
                                                    prefixIcon: Icon(
                                                        BeIcons.be_mail,
                                                        color: BeColors.white)),
                                                onSaved: (input) =>
                                                    _email = input,
                                                validator: (value) {
                                                  return !RegExp(
                                                              r'^[^@]+@[^@]+\.[^@]+')
                                                          .hasMatch(value)
                                                      ? 'Email adress must be in my@mail.com format.'
                                                      : null;
                                                }),
                                            TextFormField(
                                              key: _passwordField,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              obscureText: true,
                                              decoration: InputDecoration(
                                                  labelText: 'Password',
                                                  fillColor: Colors.white,
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                  labelStyle: TextStyle(
                                                      color: Colors.white),
                                                  prefixIcon: Icon(
                                                      BeIcons.be_lock,
                                                      color: BeColors.white)),
                                              onSaved: (input) =>
                                                  _password = input,
                                            ),
                                            TextFormField(
                                                style: TextStyle(
                                                    color: Colors.white),
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Password(repeate)',
                                                    fillColor: Colors.white,
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                    labelStyle: TextStyle(
                                                        color: Colors.white),
                                                    prefixIcon: Icon(
                                                        BeIcons.be_lock,
                                                        color: BeColors.white)),
                                                validator: (value) {
                                                  var p = _passwordField
                                                      .currentState.value;
                                                  return value != p
                                                      ? 'Password $value is not match with $p.'
                                                      : null;
                                                })
                                          ]),
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          FlatButton(
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'ЗАВЕРШИТИ',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Container(
                                                      height: padding.bottom),
                                                ]),
                                            color: BeColors.primary,
                                            onPressed: () => register(),
                                          )
                                        ])
                                  ])),
                        ],
                      ),
                    ))))
      ]),
    ]));
  }
}
