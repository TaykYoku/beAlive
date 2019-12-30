import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:be_alive/parameters.dart';

// Menu of possible instances
const _instances = {
  'Dreams': 'МРІЯ',
  'Targets': 'МЕТА',
  'GoodDreams': 'ДОБРА СПРАВА',
  'Motivations': 'МОТИВАЦІЯ'
};

class ChooseInstance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    String _bg = 'assets/background.png';
    double _buttonHeight = size.height * 0.05;
    return Scaffold(
        body: Stack(children: <Widget>[
      Image.asset(
        _bg,
        width: size.width,
        height: size.height,
        fit: BoxFit.fill,
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
        Column(
          children: <Widget>[
            Container(
                height: padding.top, width: size.width, color: Colors.white),
            FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[Icon(Icons.arrow_back_ios)]),
                  Center(
                    child: Text(
                      "СТВОРИТИ",
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
                Navigator.pop(context, false);
              },
            ),
          ],
        ),
        Expanded(child: InstancesMenu()),
        Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'ДАЛІ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(height: padding.bottom),
                    ]),
                color: BeColors.primary,
                onPressed: () {
                },
              )
            ])
      ])
    ]));
  }
}

class InstancesMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    String _bg = 'assets/background.png';
    double _buttonHeight = size.height * 0.05;

    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List<Widget>.generate(5, (int index) {
            if (index == 0) {
              return Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.05, bottom: size.height * 0.05),
                  child: Center(
                    child: Text(
                      'оберіть тип',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ));
            } else {
              return Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.1,
                      right: size.width * 0.1,
                      bottom: size.height * 0.05),
                  child: FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Text(
                      _instances.values.toList()[index - 1].toString(),
                      style: TextStyle(
                        color: BeColors.primary,
                      ),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(
                          context, _instances.keys.toList()[index - 1].toString());
                    },
                  ));
            }
          })),
    );
  }
}
