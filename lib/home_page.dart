import 'dart:developer';

import 'package:be_alive/models/contentInstance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

import 'package:be_alive/create_new_instance.dart';
import 'package:be_alive/settings_draw.dart';
import 'package:be_alive/menu_draw.dart';
import 'package:be_alive/parameters.dart';
import 'package:be_alive/add_image_page.dart';
import 'package:be_alive/create_instance.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  final List<CircularStackEntry> data = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
        new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        // endDrawer: SettingsWidget(),
        // drawer: MenuWidget(),
        body: Stack(alignment: Alignment.center, children: <Widget>[
          new Center(
              child: new Image.asset(
            'assets/background.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          )),
          new Positioned(
            left: 20,
            top: 50,
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
          ),
          new Positioned(
            right: 20,
            top: 50,
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
            ),
          ),
          new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Expanded(
                    flex: 6,
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new CircleAvatar(
                            radius: 70.0,
                            backgroundImage:
                                new AssetImage('assets/profile/ava100.png'),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'MARMELAD',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: new Column(
                              children: <Widget>[
                                Text('145\nDay',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          )
                        ])),
                new Expanded(
                    flex: 6,
                    child: new Container(
                        color: Colors.white,
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(top: 15, bottom: 15),
                                  child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        new Column(children: <Widget>[
                                          new Material(
                                              color: Colors.red,
                                              type: MaterialType.circle,
                                              child: new Container(
                                                  width: 15, height: 15)),
                                          Padding(
                                            child: new Text('створені'),
                                            padding: EdgeInsets.all(15),
                                          ),
                                          new Text('18')
                                        ]),
                                        new Column(children: <Widget>[
                                          new Material(
                                              color: Colors.blue,
                                              type: MaterialType.circle,
                                              child: new Container(
                                                  width: 15, height: 15)),
                                          Padding(
                                            child: new Text('колективні'),
                                            padding: EdgeInsets.all(15),
                                          ),
                                          new Text('24')
                                        ]),
                                        new Column(children: <Widget>[
                                          new Material(
                                              color: Colors.green,
                                              type: MaterialType.circle,
                                              child: new Container(
                                                  width: 15, height: 15)),
                                          Padding(
                                            child: new Text('завершені'),
                                            padding: EdgeInsets.all(15),
                                          ),
                                          new Text('11')
                                        ]),
                                      ])),
                              new Expanded(
                                  child: new Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  new LayoutBuilder(
                                      builder: (context, constraint) {
                                    return new AnimatedCircularChart(
                                      key: _chartKey,
                                      size: Size(
                                          constraint.biggest.width >
                                                  constraint.biggest.height
                                              ? constraint.biggest.height
                                              : constraint.biggest.width,
                                          constraint.biggest.width >
                                                  constraint.biggest.height
                                              ? constraint.biggest.height
                                              : constraint.biggest.width),
                                      initialChartData: data,
                                      chartType: CircularChartType.Radial,
                                    );
                                  }),
                                  new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Text('47',
                                            style: TextStyle(
                                                fontSize: 60,
                                                color: Colors.black)),
                                        new Text('всього',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black))
                                      ])
                                ],
                              )),
                            ]))),
                new Expanded(
                    flex: 1,
                    child: Center(child:
                        new LayoutBuilder(builder: (context, constraint) {
                      double iconHeight = constraint.biggest.height > 40
                          ? constraint.biggest.height / 1.5
                          : constraint.biggest.height -
                              constraint.biggest.height / 4;
                      return new Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            new IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.calendar_today,
                                size: iconHeight,
                              ),
                              color: BeColors.primary,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                            ),
                            // Add new instance
                            new IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.add_circle,
                                size: iconHeight,
                              ),
                              color: BeColors.primary,
                              onPressed: () {
                                log('_instance');
                                _f (context) async {
                                  log('_instance');
                                  // Get instance
                                  final _instance = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CreateInstance()));
                                  ContentInstance newInstance;
                                  if (_instance != null) {
                                    newInstance = ContentInstance(_instance);
                                  };
                                  // Add image
                                  // final _image = await Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             AddImagePage()));
                                  // newInstance.image = _image;
                                  // Add details
                                  // final _image = await Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             AddImagePage()));
                                  // newInstance.image = _image;
                                  // Add calendar

                                  if (newInstance != null) {
                                    log(newInstance.image);
                                  }
                                  
                                };
                                _f(context);

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => ChooseInstancePage()),
                                // );
                              },
                            ),
                            new IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.search,
                                size: iconHeight,
                              ),
                              color: BeColors.primary,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                            )
                          ]);
                    })))
              ])
        ]));
  }
}
