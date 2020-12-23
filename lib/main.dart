import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Transparent Image Dialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _showDialog() async {
    await showGeneralDialog(
        // if showDialog will be used instead of this, there will be little changes in parameters
        barrierDismissible: true,
        barrierLabel: 'dismiss',
        context: context,
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        },
        pageBuilder: (context, _, __) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset('assets/transparent.png'),
              GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'Work harder,\nthe cat is watching',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
          );
        });
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.green, Colors.lightGreen],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
