import 'package:flutter/material.dart';

import 'package:be_alive/repository/repository_service.dart';
import 'package:be_alive/parameters.dart';

class MenuItems extends StatefulWidget {
  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  final _formKey = GlobalKey<FormState>();
  List<List> itemsCounts;
  Future<int> future;
  String name;
  int id;

  @override
  initState() {
    super.initState();
    _fetchList();
  }

  Future _fetchList() async {
    List<List> _itemsCounts = [
      [
        RepositoryService.countOf('Dreams'),
        RepositoryService.countOf('Targets'),
        RepositoryService.countOf('GoodDeals'),
        RepositoryService.countOf('Motivations')
      ],
      [
        RepositoryService.countOf('GoodDeals'),
        RepositoryService.countOf('GoodDeals')
      ]
    ];
    setState(() {
      itemsCounts = _itemsCounts;
    });
  }

  //future = RepositoryServiceDreams.todosCount();

  static List<List<String>> itemsNames = [
    ['мрії', 'цілі', 'добрі справи', 'мотивації'],
    ['друзі', 'історія']
  ];

  // static List<Map<String, Future<int>>> _menuItems = [
  //   contentInstanceItems,
  //   {
  //     'друзі': RepositoryService.countOf('GoodDeals'),
  //     'історія': RepositoryService.countOf('GoodDeals')
  //   }
  // ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> _menu = [];
    List<List<Widget>> _menuBlocks =
        List.generate(itemsNames.length, (int index) {
      return new List<Widget>.generate(itemsNames[index].length,
          (int subindex) {
        String _key = itemsNames[index][subindex];
        Future<int> _value = itemsCounts[index][subindex];
        return new Padding(
            padding: EdgeInsets.only(top: 20),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(_key, style: TextStyle(fontSize: 20)),
                FutureBuilder(
                  future: _value,
                  builder: (context, snapshot) {
                    print('==>');
                    print(snapshot.data);
                    if (snapshot.hasData) {
                      return new Text(
                          (snapshot.data > 0)
                              ? '+' + snapshot.data.toString()
                              : '',
                          style: TextStyle(fontSize: 20));
                    } else {
                      return new Text('');
                    }
                  },
                ),
              ],
            ));
      });
    });
    for (List<Widget> block in _menuBlocks) {
      _menu.addAll(block);
      if (_menuBlocks.length - 1 != _menuBlocks.indexOf(block)) {
        _menu.add(new Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 20),
            child: new Container(
              height: 1.5,
              width: size.width / 3,
              color: Colors.black,
            )));
      }
    }
    return Column(children: _menu);
  }
}

class MenuWidget extends StatelessWidget {
  // const MenuWidget({
  //   Key key,
  //   this.scaffoldKey
  // }) : super(key: key);

  // final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Drawer build(BuildContext context) {
    return Drawer(
        child: Container(
      padding: EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 15),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new IconButton(
            alignment: Alignment.bottomRight,
            iconSize: 40,
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          new Container(
              margin: EdgeInsets.only(top: 20, bottom: 40),
              height: 60,
              child: new Row(
                children: <Widget>[
                  new CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        new AssetImage('assets/profile/ava100.png'),
                  ),
                  new Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'MARMELAD',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                            Text(
                              'onenadis_gmail@gmail.com',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            )
                          ]))
                ],
              )),
          Expanded(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                new Row(children: <Widget>[
                  new Column(), // Name
                ]),
                MenuItems(),
                new Text('заворотній звязок', style: TextStyle(fontSize: 20))
              ]))
        ],
      ),
    ));
  }
}
