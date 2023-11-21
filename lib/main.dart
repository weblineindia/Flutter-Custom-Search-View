import 'package:fl_search_field/search_field.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Search Filed Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SearchField(
          controller: TextEditingController(),
          enabled: true,
          labelText: 'Search City',
          focusNode: FocusNode(),
          key: const Key('search_field'),
          readOnly: false,
          selectedData: (data){
            print(data);
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
