import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_template/src/enums/page_names.dart';
import 'package:flutter_template/src/ui/pages/dashboard_page.dart';
import 'package:flutter_template/src/ui/pages/login/login_page.dart';
import 'package:flutter_template/src/utils/page_args.dart';

class PageManagerN {
  static final PageManagerN _instance = PageManagerN._internal();
  // Constructor privado
  PageManagerN._internal();

  // Proporciona acceso a la instancia única
  factory PageManagerN() {
    return _instance;
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      PageNames.login.route: (context) => const LoginPage(null),
      PageNames.dashboard.route: (context) => const DashboardPage(null),
    };
  }

  void goPage(PageNames route, context) {
    if (ModalRoute.of(context)?.settings.name != route.route) {
      Navigator.pop(context);
      Navigator.pushNamed(context, route.route);
    }
  }
}
