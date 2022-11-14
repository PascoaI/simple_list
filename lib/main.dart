
import 'package:simple_list/modules/lista/store/controller.dart';
import 'package:simple_list/modules/lista/components/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_list/modules/lista/home_list.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Controller>(
          create: (_) => Controller(),
          dispose: (_, controller) => controller.dispose(),
        )
      ],
      child: MaterialApp(
        title: 'Simple List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);
    return Scaffold(
      body: List(),
      appBar: AppBar(title: Text('Simple List')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addDialog(context, controller);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
