import 'package:flutter/material.dart';

import '../enums/page_names.dart';
import '../ui/pages/home_page.dart';
import '../utils/page_args.dart';

class PageManager {
  static final PageManager _instance = PageManager._constructor();
  final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();

  PageNames? currentPage;

  factory PageManager() {
    return _instance;
  }

  PageNames? getPageNameEnum(String? pageName) {
    try {
      return PageNames.values.where((x) => x.toString() == pageName).single;
    } catch (e) {
      throw Exception(e);
    }
  }

  PageManager._constructor();

  MaterialPageRoute? getRoute(RouteSettings settings) {
    PageArgs? arguments;

    if (settings.arguments != null) {
      arguments = settings.arguments as PageArgs;
    }

    PageNames? page = getPageNameEnum(settings.name);

    currentPage = page;
    switch (page) {
      case PageNames.home:
        return MaterialPageRoute(builder: (context) => HomePage(arguments));
    default:
        return throw Exception("No existe página con este PageName");
    }
  }

  _goPage(String pageName, {PageArgs? args, Function(PageArgs args)? actionBack, bool makeRootPage = false}) {
    if (!makeRootPage) {
      return navigatorKey.currentState?.pushNamed(pageName, arguments: args).then((value) {
        if (actionBack != null) actionBack(value as PageArgs);
      });
    } else {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(pageName, (route) => false, arguments: args);
    }
  }
}
