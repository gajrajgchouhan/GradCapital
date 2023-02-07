import 'package:flutter/material.dart';
import 'package:gc_frontend/AppSettings.dart';
import 'package:gc_frontend/screens/ledger/ledgers.dart';
// import 'package:gc_frontend/screens/authenticate/sign_up.dart';
import 'package:gc_frontend/screens/authenticate/sign_in.dart';
import 'package:gc_frontend/screens/notifications/notifications.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await StreamingSharedPreferences.instance;

  runApp(MyApp(
    preferences: preferences,
  ));
}

class MyApp extends StatelessWidget {
  final StreamingSharedPreferences _preferences;

  const MyApp({super.key, required StreamingSharedPreferences preferences})
      : _preferences = preferences;

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return AppSettings(
        preferences: _preferences,
        child: Builder(builder: (context) {
          return const MaterialApp(
            title: _title,
            home: HomePage(),
          );
        }));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const NotificationsPage(),
    const LedgerPage(title: 'Ledger Groups'),
    const SignIn()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'Ledger Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(244, 92, 92, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
