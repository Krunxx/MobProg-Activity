import 'package:flutter/material.dart';

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
          appBar: AppBar(
            leading: const Icon(Icons.code),
            title: const Text("Basic App Layout"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home),
                ),
                Tab(icon: Icon(Icons.message),
                ),
              ],
            ),
          ),

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

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: const Icon(Icons.add),
          ),

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
