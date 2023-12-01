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
      debugShowCheckedModeBanner: false,
      home: FirstPage()
    );
  }
}

class FirstPage extends StatelessWidget{
  TextEditingController nameController = TextEditingController();
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: Colors.blue,
      ),
      body:
      ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
                labelText: "Name" )
          ),
          Padding(padding:EdgeInsets.only(top:20),
          child: OutlinedButton(
            child: Text("Go to Second Page"),
            onPressed: (){
              name = nameController.text;

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage(name:name)));
            },
          )
          )
        ],
      )
    );
  }
 }

 class SecondPage extends StatelessWidget{
  String? name;
  SecondPage({ this.name  });

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text('Welcome $name!')
        ],
      )
    );
  }
 }