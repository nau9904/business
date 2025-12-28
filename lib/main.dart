import 'package:business/ViewPage/contact.dart';
import 'package:business/ViewPage/favorite.dart';
import 'package:business/ViewPage/login.dart';
import 'package:business/ViewPage/userInfoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'Controller/LoginHandler.dart';
import 'Utils/showAlertDialog.dart';
import 'ViewPage/generator.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// Add this import

void main() {
  // Initialize the database factory before using any database operations
  // databaseFactory = databaseFactoryFfi;
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'STORE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/home',
  routes: [
    /// SHELL = Layout có NavigationRail
    ShellRoute(
      builder: (context, state, child) {
        return MyShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (_, __) => GeneratorPage(),
        ),
        GoRoute(
          path: '/favorite',
          name: 'favorite',
          builder: (_, __) => const Favorite(),
        ),
        GoRoute(
          path: '/contact',
          name: 'contact',
          builder: (_, __) => const Contact(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (_, __) => const LoginPage(),
        ),
        GoRoute(
            path: '/userinfo',
            name: 'userinfo',
            builder: (_, __) => const UserInfoScreen()),
      ],
    ),
  ],
);

class MyShell extends StatelessWidget {
  final Widget child;
  const MyShell({super.key, required this.child});

  int _getIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/favorite')) return 1;
    if (location.startsWith('/contact')) return 2;
    if (location.startsWith('/login')) return 3;
    return 0;
  }

  void _onSelect(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/favorite');
        break;
      case 2:
        context.go('/contact');
        break;
      case 3:
        final destination = loginState.value ? '/userinfo' : '/login';
        context.go(destination);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = _getIndex(context);

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: true,
              selectedIndex: index,
              onDestinationSelected: (i) => _onSelect(context, i),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.email),
                  label: Text('Contact'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person),
                  label: Text('User'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: child,
            ),
          ), // <-- nội dung page hiện tại
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAlertDialog(
            context, "Setting title", "Setting message content"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.settings),
        mini: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
