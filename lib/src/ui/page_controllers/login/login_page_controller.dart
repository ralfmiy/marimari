import 'package:flutter/material.dart';
import 'package:flutter_template/src/enums/page_names.dart';
import 'package:flutter_template/src/interfaces/i_view_controller.dart';
import 'package:flutter_template/src/managers/page_manager.dart';
import 'package:flutter_template/src/managers/page_manager_n.dart';
import 'package:flutter_template/src/ui/pages/dashboard_page.dart';
import 'package:flutter_template/src/utils/page_args.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginPageController extends ControllerMVC implements IViewController {
  static late LoginPageController _this;

  factory LoginPageController() {
    _this = LoginPageController._();
    return _this;
  }

  static LoginPageController get con => _this;
  PageArgs? args;
  LoginPageController._();

  late BuildContext cntx;
  bool isLoading = false;
  TextEditingController controller = TextEditingController();

  @override
  void initPage({PageArgs? arguments}) {
    controller = TextEditingController();
  }

  @override
  disposePage() {}

  void onPressLogin() {
    PageManagerN().goPage(PageNames.dashboard, cntx);
  }
}
