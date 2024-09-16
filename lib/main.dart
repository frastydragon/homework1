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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  int _counter = 0;
  int _pictureCounter = 0;
  String _picture = 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif';
  final String _picture1 = 'https://cdn.pixabay.com/photo/2024/02/28/07/42/european-shorthair-8601492_1280.jpg'; 
  final String _picture2 = 'https://picsum.photos/id/237/200/300';
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _reset(){
    setState(() {
      _counter=0;
      _picture = 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif';
    });
  }

  void _pictureChange() {
    if (_pictureCounter == 0){
      _picture = _picture1;
      _pictureCounter++;
    }
    else {
      _picture = _picture2;
      _pictureCounter--;
    }
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Center(
              child: Image.network(
                _picture,
                  width: 250,
                  height: 250,
                     ),
                  ),
            const Text('\n'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
                children:[
                  
                  Center(
	                child: ElevatedButton(
	                  onPressed: _incrementCounter,                               
	                  child: const Text('Increment'),
	                  )    ,
                  ) ,

                  Center(
	                child: ElevatedButton(
	                  onPressed: _pictureChange,
                    child: const Text('Toggle Image'),
	                  )    ,                   
                  ), 
                  //did reset button for fun            
                  Center(
	                child: ElevatedButton(
	                  onPressed: _reset,
                    child: const Text('Reset'),
	                  )    ,                   
                  ),            
                ]
              ),
          ],
        ),
      ),  
    );
  }
}
