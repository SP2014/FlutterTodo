import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_todo/core/services/modal/modal_service.dart';
import 'package:flutter_todo/locator.dart';

class ModalSheetManager extends StatefulWidget {
  final Widget child;
  const ModalSheetManager({Key key, this.child}) : super(key: key);

  _ModalSheetManagerState createState() => _ModalSheetManagerState();
}

class _ModalSheetManagerState extends State<ModalSheetManager> {
  final _modalService = locator<ModalService>();

  @override
  void initState() {
    super.initState();
    _modalService.registerModalListener(_showModalSheet);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showModalSheet() {
    showPlatformModalSheet(
      androidBackgroundColor: Colors.transparent,
        context: context,
        builder: (context) => WillPopScope(
              onWillPop: () async {
                _modalService.modelComplete(null);
                return false;
              },
              child: Container(
                margin: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.white
                  ),
                  padding: const EdgeInsets.only(top:8.0, left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: 'Enter a title'
                        ),
                        onFieldSubmitted: (v){

                        },
                      ),
                      const SizedBox(height: 8.0,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                          hintText: 'Add some notes'
                        ),
                        onFieldSubmitted: (v){

                        },
                      ),
                      const SizedBox(height: 16.0,),
                      PlatformButton(
                        child: Text('Save'),
                        onPressed: (){

                        },
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
