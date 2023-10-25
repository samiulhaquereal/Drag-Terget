import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color CaughtColor = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Draggable(
                  data: Colors.orangeAccent,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.orangeAccent,
                      child: Center(
                        child: Text('Box'),
                      ),
                    ),
                    onDraggableCanceled: (velocity,offset){

                    },
                    feedback: Container(
                      width: 150,
                      height: 150,
                      color: Colors.orangeAccent.withOpacity(0.5),
                      child: Center(
                        child: Text('Box...',style: TextStyle(color: Colors.white,decoration: TextDecoration.none,fontSize: 18),),
                      ),
                    )
                ),
                DragTarget(onAccept: (Color color){
                  CaughtColor = color;
                },
                builder: (
                BuildContext context,List<dynamic> accepted,List<dynamic> rejected
                ){
                  return Container(
                    width: 200,
                    height: 200,
                    color: accepted.isEmpty ? CaughtColor : Colors.grey.shade200,
                    child: Center(
                      child: Text("Drag here"),
                    ),
                  );
                },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

