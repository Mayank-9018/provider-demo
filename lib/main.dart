import 'package:flutter/material.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';
import 'package:provider/provider.dart';
import 'page_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageManager(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _pages = const [Page1(), Page2(), Page3()];

  @override
  Widget build(BuildContext context) {
    return Consumer<PageManager>(
      builder: (con, manager, _) {
        return Scaffold(
          body: _pages[manager.activePage],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: manager.activePage,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  label: 'Page 1', icon: Icon(Icons.favorite)),
              BottomNavigationBarItem(label: 'Page 2', icon: Icon(Icons.lock)),
              BottomNavigationBarItem(label: 'Page 3', icon: Icon(Icons.face)),
            ],
            onTap: (val) {
              manager.changePage(val);
            },
          ),
        );
      },
    );
  }
}
