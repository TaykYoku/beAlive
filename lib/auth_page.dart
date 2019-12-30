import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:be_alive/register_page.dart';
import 'package:be_alive/intro.dart';
import 'package:be_alive/parameters.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Axis _orientation = Axis.vertical;
    Size size = MediaQuery.of(context).size;
    double _padding = size.width * 0.1;
    double _logoSize = size.width * 0.35 > 100 ? size.width * 0.35 : size.width * 0.6;

    return Padding(
        padding: EdgeInsets.only(left: _padding, right: _padding),
        child: Flex(
            direction: _orientation,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(BeLogo.logo, height: _logoSize, width: _logoSize),
              AutoSizeText(BeLogo.introSlogan,
                  textAlign: TextAlign.center,
                  maxFontSize: 24,
                  style: TextStyle(color: Colors.white))
            ]));
  }
}

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult auth = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
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
    MediaQueryData _media = MediaQuery.of(context);
    EdgeInsets padding = MediaQuery.of(context).padding;
    String _bg = 'assets/background.png';
    double _buttonHeight = _media.size.height * 0.05;

    return Scaffold(
        body: Stack(children: <Widget>[
      Image.asset(
        _bg,
        width: _media.size.width,
        height: _media.size.height + _media.viewInsets.bottom,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
      SingleChildScrollView(
          child: Container(
              height: _media.size.height,
              width: _media.size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(),
                    LogoWidget(),
                    Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText: 'Login',
                                  fillColor: Colors.white,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(BeIcons.be_user,
                                      color: Colors.white)),
                              onSaved: (input) => _email = input,
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  fillColor: Colors.white,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  labelStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(BeIcons.be_lock,
                                      color: Colors.white)),
                              onSaved: (input) => _password = input,
                            ),
                          ]),
                    ),
                    Column(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ButtonTheme(
                              height: _buttonHeight,
                              child: FlatButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                child: AutoSizeText('УВІЙТИ',
                                    maxFontSize: 24,
                                    style: TextStyle(color: Colors.black)),
                                color: BeColors.primary,
                                onPressed: () => signIn()
                              )),
                          ButtonTheme(
                              height: _buttonHeight + padding.bottom,
                              padding: EdgeInsets.only(bottom: padding.bottom),
                              child: FlatButton(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                child: AutoSizeText('ЗАРЕЄСТРУВАТИСЬ',
                                    maxFontSize: 24,
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()),
                                  );
                                },
                              ))
                        ])
                  ])))
    ]));
  }
}
