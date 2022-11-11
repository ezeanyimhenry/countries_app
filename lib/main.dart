import 'package:countries_app/views/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:language_builder/language_builder.dart';
import 'package:responsiveui_container/responsiveui_container.dart';
// import 'languages.dart';

class MyTheme with ChangeNotifier {
  static bool _isDark = true;

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  currentLogo() {
    String logo;
    if (_isDark == true) {
      logo = "images/logo.png";
    } else {
      logo = "images/ex_logo.png";
    }
    return logo;
  }

  iconMode() {
    IconData icon;
    if (_isDark == true) {
      icon = Icons.light_mode_outlined;
    } else {
      icon = Icons.dark_mode;
    }
    return icon;
  }

  void switchTheme() {
    _isDark = !_isDark;
    currentLogo();
    iconMode();
    notifyListeners();
  }
}

MyTheme currentTheme = MyTheme();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    const MaterialColor white = MaterialColor(
      0xFFFFFFFF,
      <int, Color>{
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
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explore',
      theme: ThemeData(primarySwatch: white),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: const RContainer(
        mobile: Home(),
        // tablet: TabHomePage(),
        // desktop: DesktopHomePage(),
      ),
    );
  }
}
