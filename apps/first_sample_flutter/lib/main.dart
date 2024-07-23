import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'First Sample Flutter App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  int _counter = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Padding(
            padding: EdgeInsets.all(24),
            child:Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Flexible(
                flex: 2,
                child: Card(
                    elevation: 16,
                    child: Text(
                      'You have pushed the button this many',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      )
            ))),
            Flexible(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Next value is ${_counter + 1}'),
                    CounterWidget(initialValue: _counter)
                  ],
                )),
            Flexible(
                flex: 2,
                child: _buildListView(context, [1,2,3,4,5]),
                )
          ],
        ),
    ));
  }

  Widget _buildListView(BuildContext context, List<int> list)
    => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => _buildItemListView(context, list[index]));

  Widget _buildItemListView(BuildContext context, int list)
    => InkWell(
      onTap: () => {},
      child: Card(
        child: ColoredBox(
          color: Colors.pinkAccent,
          child: Row(
            children: [
              Text('The list element is: ${list}')
            ],
          ),
        ),
    ));
}

class CounterWidget extends StatefulWidget {
  final int initialValue;

  CounterWidget({required this.initialValue});

  @override
  State<StatefulWidget> createState()
    => CounterStateWidget(initialValue);

}

class CounterStateWidget extends State<CounterWidget> {
  CounterStateWidget(int counter)
    : _counter = counter;

  int _counter;
  @override
  Widget build(BuildContext context)
    => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        TextButton(
            onPressed: () => setState(() {
              _counter++;
            }),
              child: Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color:  Colors.grey.withOpacity(0.7),
                  )
                ]),
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                children: [
                  Text('Pulsa para agregar', style: TextStyle(color: Colors.white),),
                  Icon(Icons.add, color: Colors.white,),
                ],
              )
            ))),
      ],
    );

}



