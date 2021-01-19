import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_todo/core/enums/view_state.dart';
import 'package:flutter_todo/core/models/todos/todos.dart';
import 'package:flutter_todo/core/services/modal/modal_service.dart';
import 'package:flutter_todo/core/view_models/main_view_model.dart';
import 'package:flutter_todo/ui/shared/bottom_sheet.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../locator.dart';

class MainView extends StatelessWidget {
  final modalService = locator<ModalService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MainViewModel>.withConsumer(
      viewModel: MainViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text('ToDo'),
        ),
        body: _Todos(),
        android: (_) => MaterialScaffoldData(
            floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(
            "task",
            arguments: {},
          );
            // bool repeat = false;
            // Future<Map<String, dynamic>> future = showModalInputSheet(
            //     context: context,
            //     builder: (BuildContext bc) {
            //       return Container(
            //         color: Colors.transparent,
            //         height: MediaQuery.of(context).size.height,
            //         //margin: const EdgeInsets.all(8.0),
            //         //padding: const EdgeInsets.all(0),
            //         child: Container(
            //           padding: const EdgeInsets.all(0),
            //           height: MediaQuery.of(context).size.height,
            //           decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(12.0)),
            //           child: Column(
            //             mainAxisSize: MainAxisSize.min,
            //             children: <Widget>[
            //               Container(
            //                 padding: const EdgeInsets.all(16.0),
            //                 child: Column(
            //                   mainAxisSize: MainAxisSize.min,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: <Widget>[
            //                     Text(
            //                       'Create a new task',
            //                       style: TextStyle(
            //                           color: Color(0xFF3c4b63),
            //                           fontSize: 22,
            //                           fontWeight: FontWeight.w800),
            //                     ),
            //                     const SizedBox(
            //                       height: 16.0,
            //                     ),
            //                     TextFormField(
            //                       decoration: InputDecoration(
            //                           hintText: 'Task name',
            //                           hintStyle:
            //                               TextStyle(color: Color(0xFF3c4b63)),
            //                           border: OutlineInputBorder(),
            //                           hasFloatingPlaceholder: false),
            //                       onFieldSubmitted: (v) {
            //                         print(v);
            //                       },
            //                     ),
            //                     const SizedBox(
            //                       height: 12.0,
            //                     ),
            //                     TextFormField(
            //                       decoration: InputDecoration(
            //                           hintText: 'Category',
            //                           hintStyle:
            //                               TextStyle(color: Color(0xFF3c4b63)),
            //                           border: OutlineInputBorder(),
            //                           hasFloatingPlaceholder: false),
            //                       maxLines: 1,
            //                       onFieldSubmitted: (v) {
            //                         print(v);
            //                       },
            //                     ),
            //                     const SizedBox(
            //                       height: 12.0,
            //                     ),
            //                     Row(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       mainAxisSize: MainAxisSize.max,
            //                       children: <Widget>[
            //                         GestureDetector(
            //                           onTap: () {},
            //                           child: Container(
            //                             decoration: BoxDecoration(
            //                               color: Color(0xFFEAEEF6),
            //                               borderRadius:
            //                                   BorderRadius.circular(4.0),
            //                             ),
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: Row(
            //                               children: <Widget>[
            //                                 Icon(Icons.calendar_today),
            //                                 const SizedBox(
            //                                   width: 12.0,
            //                                 ),
            //                                 Text("Date")
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                         GestureDetector(
            //                           onTap: () {},
            //                           child: Container(
            //                             decoration: BoxDecoration(
            //                               color: Colors.blueGrey[100],
            //                               borderRadius:
            //                                   BorderRadius.circular(4.0),
            //                             ),
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: Row(
            //                               children: <Widget>[
            //                                 Icon(Icons.access_time),
            //                                 const SizedBox(
            //                                   width: 12.0,
            //                                 ),
            //                                 Text("Time")
            //                               ],
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                     const SizedBox(
            //                       height: 8.0,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               GestureDetector(
            //                 onTap: () {
            //                   Navigator.of(context).pop();
            //                 },
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.only(
            //                           bottomLeft: Radius.circular(12.0),
            //                           bottomRight: Radius.circular(12.0)),
            //                       color: Color(0xFF3c4b63)),
            //                   padding: const EdgeInsets.all(20.0),
            //                   child: Center(
            //                     child: Text(
            //                       "Save",
            //                       style: TextStyle(
            //                           color: Colors.white,
            //                           fontSize: 18,
            //                           fontWeight: FontWeight.w700),
                                      
            //                     ),
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ),
            //       );
            //     });
            // future.then((val) {});
            // // modalService.showModalSheet().then((vmap) {
            // //   if (vmap != null) {
            // //     final todo = Todos.fromMap(vmap);
            // //     model.addData(todo);
            // //   }
            // // });
            // // Map<String, dynamic> vmap = <String, dynamic>{};
            // // vmap['id'] = 45;
            // // vmap['task'] = 'Sample task 3';
            // // vmap['category'] = 'Daily';
            // // vmap['timestamp'] = '${DateTime.now().millisecondsSinceEpoch}';
            // // final todo = Todos.fromMap(vmap);
            // // model.addData(todo);
          },
        )),
      ),
    );
  }
}

class _NoTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("No items yet..."),
    );
  }
}

class _LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlatformCircularProgressIndicator(),
    );
  }
}

class _Todos extends ProviderWidget<MainViewModel> {
  @override
  Widget build(BuildContext context, MainViewModel model) {
    //print("I was called: ${model.todos.length}");
    if (model.state == ViewState.Busy) {
      return _LoadingAnimation();
    }

    if (model.todos.isEmpty) {
      return _NoTodos();
    }

    return ListView.builder(
      itemCount: model.todos.length,
      itemBuilder: (context, index) => ListTile(
        key: Key('${model.todos[index].id}'),
        title: Text(model.todos[index].task),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          iconSize: 24,
          onPressed: () {
            model.deleteTodos(model.todos[index].id);
          },
        ),
      ),
    );
  }
}
