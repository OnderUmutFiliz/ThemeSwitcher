import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;
  bool isButtonPressed = false;

  final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );

  final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? darkTheme : lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tema Değiştirici Uygulama'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tema: ${isDarkTheme ? "Karanlık" : "Açık"}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: isButtonPressed 
                      ? (isDarkTheme ? Colors.redAccent : Colors.blueAccent)
                      : (isDarkTheme ? Colors.red : Colors.blue),
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(isButtonPressed ? 20 : 10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isDarkTheme = !isDarkTheme;
                    isButtonPressed = true;
                  });
                  Future.delayed(Duration(milliseconds: 200), () {
                    setState(() {
                      isButtonPressed = false;
                    });
                  });
                },
                child: Text('Temayı Değiştir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
