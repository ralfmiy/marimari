import 'package:flutter/material.dart';
import 'package:flutter_template/src/enums/page_names.dart';
import 'package:flutter_template/src/managers/page_manager_n.dart';
import 'package:flutter_template/src/ui/pages/dashboard_page.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../interfaces/i_view_controller.dart';
import '../../utils/page_args.dart';

class DashboardPageController extends ControllerMVC implements IViewController {
  static late DashboardPageController _this;

  factory DashboardPageController() {
    _this = DashboardPageController._();
    return _this;
  }

  static DashboardPageController get con => _this;
  PageArgs? args;
  DashboardPageController._();

  late BuildContext cntx;
  bool isLoading = false;
  TextEditingController controller = TextEditingController();

  @override
  void initPage({PageArgs? arguments}) { 
    controller = TextEditingController(); 
  }

  @override
  disposePage() {}

  onPressDashboard(){
    PageManagerN().goPage(PageNames.dashboard, cntx);
  }
}
