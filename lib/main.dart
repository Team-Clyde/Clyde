import 'package:flutter/material.dart';
import 'ui/component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clyde Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

enum TabItem { home, explore, notification, setting }

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TabItem _currentItem = TabItem.home;
  final List<TabItem> _bottomTabs = [
    TabItem.home,
    TabItem.explore,
    TabItem.notification,
    TabItem.setting
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
              left: const Icon(
                Icons.notes,
                color: Colors.black54,
              ),
              title: 'Wallets',
              right: const Icon(
                Icons.account_balance_wallet,
                color: Colors.black54,
              )),
        ),
      ),
      body: _buildScreen(),
      buttomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs
          .map((tabItem) => _bottomNavigationBarItem(_icon(tabItem), tabItem))
          .toList(),
      onTap: _onSelectTab,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }

  void _onSelectTab(int index) {
    TabItem selectedTabItem = _bottomTabs[index];
    setState(() {
      _currentItem = selectedTabItem;
    });
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, TabItem tabItem) {
    final Color color =
        _currentItem == tabItem ? Colors.black54 : Colors.black26;
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: color,
        ),
        label: '');
  }

  IconData _icon(TabItem item) {
    switch (item) {
      case TabItem.home:
        return Icons.account_balance_wallet;
      case TabItem.explore:
        return Icons.explore;
      case TabItem.notification:
        return Icons.notifications;
      case TabItem.setting:
        return Icons.settings;
    }
  }

  Widget _buildScreen() {
    switch (_currentItem) {
      case TabItem.home:
        return Container(
          child: const Center(child: Text('Home')),
        );
        break;
      default:
    }
  }
}
