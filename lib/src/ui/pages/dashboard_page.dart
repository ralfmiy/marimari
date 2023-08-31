import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/components/app_bar.dart';
import 'package:flutter_template/src/ui/components/drawer_custom.dart';
import 'package:flutter_template/src/ui/components/standart_page.dart';
import 'package:flutter_template/src/ui/page_controllers/dashboard_page_controller.dart';
import 'package:flutter_template/src/ui/popups/loading_popup.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../utils/page_args.dart';

class DashboardPage extends StatefulWidget {
  final PageArgs? args;
  const DashboardPage(this.args, {Key? key}) : super(key: key);

  @override
  DashboardPagePageState createState() => DashboardPagePageState();
}

class DashboardPagePageState extends StateMVC<DashboardPage> {
  late DashboardPageController _con;
  PageArgs? args;

  DashboardPagePageState() : super(DashboardPageController()) {
    _con = DashboardPageController.con;
  }

  @override
  void initState() {
    _con.initPage(arguments: widget.args);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _con.cntx = context;
    return standartPage(
      context,
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300, minWidth: 200),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      LoadingPopup(
                        context: context,
                        onLoading: Future.delayed(Duration(seconds: 3)),
                        onError: (){},
                        onResult: (){}
                      ).show();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Agregar")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
