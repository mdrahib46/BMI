
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/input_page.dart';

void main() {
  runApp( BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.cyanAccent,
          primarySwatch: MaterialColor(
            0xFF0A0E21,
            {
            50: Color(0xFFFFFFFF),
            100: Color(0xFFFFFFFF),
            200: Color(0xFFFFFFFF),
            300: Color(0xFFFFFFFF),
            400: Color(0xFFFFFFFF),
            500: Color(0xFFFFFFFF),
            600: Color(0xFFFFFFFF),
            700: Color(0xFFFFFFFF),
            800: Color(0xFFFFFFFF),
            900: Color(0xFFFFFFFF),
            },
          ),
        ),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF1D1E33)),
        // primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      ),
      home: InputPage(),
    );
  }
}
