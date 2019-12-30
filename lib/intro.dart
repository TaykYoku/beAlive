import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:be_alive/parameters.dart';
import 'package:be_alive/home_page.dart';

final List<String> _slogan = [
  'створюйте свої мрії,\nцілі та добрі справи,\nвказуйте кінцевий термін їх реалізації\nі досягайте їх!',
  'обирайте та мотивації з каталогу,\nдодавайте до них друзів\nі здійснюйте задумане разом!',
  'спішіть жити яскраво,\nнадихайтеся емоціями, втілюйте задумане,\nдаруйте гарний настрій рідним та близьким!'
];

final List<List<String>> _iconsList = [
  [
    'assets/basic/cloud_up.png',
    'assets/basic/equal.png',
    'assets/basic/picture.png'
  ],
  [
    'assets/basic/picture.png',
    'assets/basic/plus.png',
    'assets/basic/users.png',
    'assets/basic/equal.png',
    'assets/basic/smile.png'
  ],
  ['assets/basic/like.png']
];

final List<Widget> _pages =
    new List<Widget>.generate(_iconsList.length, (int index) {
  return new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      new Text(_slogan[index],
          textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: new List<Widget>.generate(_iconsList[index].length,
              (int subindex) {
            return new Container(
                padding: EdgeInsets.only(top: 50, right: 20, left: 20),
                child: new Image.asset(
                  _iconsList[index][subindex],
                  height: 30,
                ));
          }))
    ],
  );
});

class DotsIndicator extends AnimatedWidget {
  DotsIndicator(
      {this.controller, this.itemCount, this.onPageSelected, this.diameter})
      : super(listenable: controller);

  final PageController controller;

  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  final double diameter;

  Widget build(BuildContext context) {
    Widget _buildDot(int index) {
      final Color color = index == (controller.page ?? controller.initialPage)
          ? BeColors.primary
          : Colors.white;
      List<Widget> dot = [
        new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: diameter,
            height: diameter,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        )
      ];

      if ((index == controller.page ?? controller.initialPage) && index == 2) {
        dot.add(new Container(
            padding: EdgeInsets.only(left: diameter * 2),
            child: IconButton(
              icon: Icon(Icons.arrow_forward),
              iconSize: diameter * 1.5,
              color: color,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            )));
      }

      return new Container(
        padding: EdgeInsets.all(diameter),
        child: new Row(children: dot),
      );
    }

    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IntroState();
  }
}

class _IntroState extends State<Intro> {
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    double _logoSize =
        size.width * 0.35 > 100 ? size.width * 0.35 : size.width * 0.6;
    return Scaffold(
        body: Stack(alignment: Alignment.center, children: <Widget>[
      new Center(
          child: new Image.asset(
        'assets/background.png',
        width: size.width,
        height: size.height,
        fit: BoxFit.fill,
      )),
      new Column(children: <Widget>[
        Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(top: padding.top),
              child: new Image.asset('assets/basic/logo.png',
                height: _logoSize, width: _logoSize))),
        Expanded(flex: 4, child: Column())
      ]),
      new PageView.builder(
        physics: new AlwaysScrollableScrollPhysics(),
        controller: _controller,
        itemBuilder: (context, position) {
          return new Column(children: <Widget>[
            Expanded(flex: 2, child: Column()),
            Expanded(flex: 3, child: _pages[position]),
            Expanded(flex: 1, child: Column())
          ]);
        },
        itemCount: _pages.length,
      ),
      new Column(children: <Widget>[
        Expanded(flex: 5, child: Column()),
        Expanded(
            flex: 1,
            child: new DotsIndicator(
              diameter: 20,
              controller: _controller,
              itemCount: _pages.length,
              onPageSelected: (int page) {
                _controller.animateToPage(
                  page,
                  duration: _kDuration,
                  curve: _kCurve,
                );
              },
            ))
      ])
    ]));
  }
}
