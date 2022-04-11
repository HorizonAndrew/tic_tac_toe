import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  List<Color> _colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  List twoDimArray = List.generate(3, (i) => List.generate(3, (j) => i * 3 + j));

  // TODO
  void testGameOver() {
    // Horizontal
    for(int i = 0; i < 3; i++) {
      if((_colors[twoDimArray[i][0]] == _colors[twoDimArray[i][1]]) == _colors[twoDimArray[i][2]]) {
        // winner twodim [i][0]
        print("[$i][0]");
      }
    }

    // Vertical
    for(int i = 0; i < 3; i++) {
      if((_colors[twoDimArray[0][i]] == _colors[twoDimArray[0][i]]) == _colors[twoDimArray[0][i]]) {
        // winner twodim [0][i]
        print("[0][$i]");
      }
    }

    // Diagonal
    if((twoDimArray[0][0] == twoDimArray[1][1]) == twoDimArray[2][2]) {
      // winner twodim [0][0]
      print("[0][0]");
    }
    if((twoDimArray[2][0] == twoDimArray[1][1]) == twoDimArray[0][2]) {
      // winner twodim [2][0]
      print("[2][0]");
    }

    /// else:
    newRound();
  }

  void newRound() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.yellow),
        title: const Text('Tic Tac Toe', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_counter % 2 == 0 && _colors[index] == Colors.white) {
                  _colors[index] = Colors.red;
                  testGameOver();
                } else {
                  if (_colors[index] == Colors.white) {
                    _colors[index] = Colors.green;
                    testGameOver();
                  }
                }
              });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  color: _colors[index],
                  border: Border.all(color: Colors.black)),
              duration: const Duration(milliseconds: 300),
            ),
          );
        },
      ),
    );
  }
}
