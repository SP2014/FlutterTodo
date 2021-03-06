import 'package:flutter/material.dart';
import 'package:flutter_todo/core/enums/action_type.dart';

import 'datetime_item.dart';

class DialogContent extends StatefulWidget {
  @override
  _DialogContentState createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  DateTime _fromDateTime = DateTime.now();
  DateTime _toDateTime = DateTime.now();
  bool _allDayValue = false;
  bool _saveNeeded = false;
  bool _hasLocation = false;
  bool _hasName = false;
  String _eventName;

  Future<bool> _onWillPop() async {
    _saveNeeded = _hasLocation || _hasName || _saveNeeded;
    if (!_saveNeeded) return true;

    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle =
        theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                'Discard new event?',
                style: dialogTextStyle,
              ),
              actions: <Widget>[
                FlatButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    Navigator.of(context).pop(
                        false); // Pops the confirmation dialog but not the page.
                  },
                ),
                FlatButton(
                  child: const Text('DISCARD'),
                  onPressed: () {
                    Navigator.of(context).pop(
                        true); // Returning true to _onWillPop will pop again.
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_hasName ? _eventName : 'Event Name TBD'),
        actions: <Widget> [
          FlatButton(
            child: Text('SAVE', style: theme.textTheme.body1.copyWith(color: Colors.white)),
            onPressed: () {
              final res = <String, dynamic>{};
              res['a'] = "hello";
              res['b'] = "bye";
              Navigator.of(context).pop(res);
              //Navigator.pop(context, DismissDialogAction.save);
            },
          ),
        ],
      ),
      body: Form(
        onWillPop: _onWillPop,
        child: Scrollbar(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                alignment: Alignment.bottomLeft,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Event name',
                    filled: true,
                  ),
                  style: theme.textTheme.headline,
                  onChanged: (String value) {
                    setState(() {
                      _hasName = value.isNotEmpty;
                      if (_hasName) {
                        _eventName = value;
                      }
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                alignment: Alignment.bottomLeft,
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    hintText: 'Where is the event?',
                    filled: true,
                  ),
                  onChanged: (String value) {
                    setState(() {
                      _hasLocation = value.isNotEmpty;
                    });
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('From', style: theme.textTheme.caption),
                  DateTimeItem(
                    dateTime: _fromDateTime,
                    onChanged: (DateTime value) {
                      setState(() {
                        _fromDateTime = value;
                        _saveNeeded = true;
                      });
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('To', style: theme.textTheme.caption),
                  DateTimeItem(
                    dateTime: _toDateTime,
                    onChanged: (DateTime value) {
                      setState(() {
                        _toDateTime = value;
                        _saveNeeded = true;
                      });
                    },
                  ),
                  const Text('All-day'),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: theme.dividerColor))
                ),
                child: Row(
                  children: <Widget> [
                    Checkbox(
                      value: _allDayValue,
                      onChanged: (bool value) {
                        setState(() {
                          _allDayValue = value;
                          _saveNeeded = true;
                        });
                      },
                    ),
                    const Text('All-day'),
                  ],
                ),
              ),
            ]
            .map<Widget>((Widget child) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                height: 96.0,
                child: child,
              );
            })
            .toList(),
          ),
        ),
      ),
    );
  
  }
}
