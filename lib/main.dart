import 'package:dialog/my_custom_dialog.dart';
import 'package:dialog/my_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    var dialogHeight = height * 0.4;
    var dialogWidth = width * 0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://img.freepik.com/free-photo/mountain-landscape-with-car-driving-down-road_1340-26701.jpg?w=740&t=st=1684047730~exp=1684048330~hmac=07397618e65d40818ce96f93f955aa68a0c7c94999af8a99f6fb101729a88198'))),
            child: Center(
              child: CupertinoButton.filled(
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return MyDialog(
                          title: Text(
                            'My Custom Dialog',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          body: Text(
                            'My Custom Dialog Content',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          negativeActionChild: const Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                          positiveActionChild: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          positiveActionOnPress: () {
                            Navigator.pop(context);
                          },
                          negativeActionOnPress: () {
                            Navigator.pop(context);
                          },
                        );
                        ;
                      },
                    );
                  },
                  child: const Text('Click here')),
            )),
      ),
    );
  }
}
