import 'package:flutter/cupertino.dart';

import '../ViewPage/contact.dart';
import '../ViewPage/favorite.dart';
import '../ViewPage/generator.dart';
import '../ViewPage/login.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    '/home': (context) => GeneratorPage(),
    '/contact': (context) => Contact(),
    '/favorite': (context) => Favorite(),
    '/login': (context) => LoginPage(),
    // '/userProfile': (context) => userInfo(),
  };
}
