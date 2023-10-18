<img src = "https://github.com/Krunxx/MobProg-Activity/assets/82696971/e30dc49d-ad67-4518-b1a8-aca26683f81b" height = '500px' >

<h6>FULL CODE</h6>
<pre>
    <code>import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          //APPLICATION BAR
          appBar: AppBar( 
            leading: const Icon(Icons.code),
            title: const Text("Basic App Layout"),
            //TAB BAR
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home),
                ),
                Tab(icon: Icon(Icons.message),
                ),
              ],
            ),
          ),

          //BODY -> TAB BAR VIEW
          body: const TabBarView(
            children: [
              Center(
                child: Text("1st Tab"),
              ),
              Center(
                child: Text("2nd Tab"),
              ),
            ],
          ),

          //FLOATING ACTION BUTTON
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: const Icon(Icons.add),
          ),

          //BOTTOM NAVIGATION BAR
          bottomNavigationBar:
          Container(
            color: Colors.blue,
            height: 50,
            child: Center(
              child: Text("Counter = $counter"),
            ),
          ),
        ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:app_basic_layout/home.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
    </code>
</pre>



