import 'package:flutter/material.dart';
import 'api_service.dart';
import 'shared_preferences_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService('https://jsonplaceholder.typicode.com/todos/1');
  final SharedPreferencesService sharedPreferencesService = SharedPreferencesService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('API & Preferences Demo'),
        ),
        body: FutureBuilder(
          future: apiService.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final data = snapshot.data as Map<String, dynamic>;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Data from API: ${data['title']}'),
                  SizedBox(height: 20),
                  UserDataWidget(sharedPreferencesService: sharedPreferencesService),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
class UserDataWidget extends StatefulWidget {
  final SharedPreferencesService sharedPreferencesService;

  UserDataWidget({required this.sharedPreferencesService});

  @override
  _UserDataWidgetState createState() => _UserDataWidgetState();
}

class _UserDataWidgetState extends State<UserDataWidget> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(labelText: 'Enter Username'),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            final username = _usernameController.text;
            await widget.sharedPreferencesService.setUsername(username);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Username set successfully!'),
            ));
          },
          child: Text('Set Username'),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await widget.sharedPreferencesService.removeUsername();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Username removed successfully!'),
            ));
          },
          child: Text('Remove Username'),
        ),
        SizedBox(height: 10),
        FutureBuilder(
          future: widget.sharedPreferencesService.getUsername(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final username = snapshot.data as String?;
              return Text('Stored Username: ${username ?? 'None'}');
            }
          },
        ),
      ],
    );
  }
}