import 'package:countries_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:responsiveui_container/responsiveui_container.dart';

class MyTheme with ChangeNotifier {
  static bool _isDark = true;

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  currentLogo() {
    print(_isDark);
    String logo;
    if (_isDark == true) {
      logo = "images/logo.png";
      // print(logo);
    } else {
      logo = "images/ex_logo.png";
      // print(logo);
    }
    print(logo);
    return logo;
  }

  void switchTheme() {
    _isDark = !_isDark;
    currentLogo();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Explore',
      // home: LanguageBuilder(
      //   useDeviceLanguage: false,
      //   defaultLanguage: 'en',
      //   textsMap: Languages.languages,
      //   child: const MyHomePage(title: 'My Resume'),
      //   splash: Container(),
      // ),
      theme: ThemeData.light(),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
