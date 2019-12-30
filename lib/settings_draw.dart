import 'package:flutter/material.dart';

class SettingsWidget extends StatelessWidget {

  static List<List<String>> _settingItems = [
    ['змінити нікнейм', 'змінити почтову скриньку', 'змінити фото', 'обрати мову', 'приватність', 'вимкнути сповіщення'],
    ['видалити обліковий запис']
  ];
  static List<List<Widget>> _settingBlocks =
      List.generate(_settingItems.length, (int index) {
    return new List<Widget>.generate(_settingItems[index].length, (int subindex) {
      String _value = _settingItems[index][subindex];
      return new Padding(
          padding: EdgeInsets.only(top: 20),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Text(_value, style: TextStyle(fontSize: 20))
            ],
          ));
    });
  });

  @override
  Drawer build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> _settings = [];
    for (List<Widget> block in _settingBlocks) {
      _settings.addAll(block);
      if (_settingBlocks.length - 1 != _settingBlocks.indexOf(block)) {
        _settings.add(new Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(top: 20),
            child: new Container(
              height: 1.5,
              width: size.width / 2,
              color: Colors.black,
            )));
      }
    }

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
          Expanded(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                Column(children: _settings)
              ]))
        ],
      ),
    ));
  }
}