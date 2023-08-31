import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/page_controllers/dashboard_page_controller.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            title: const Text("Dashboard"),
            centerTitle: true,
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const SizedBox(
                height: 50,
                child: DrawerHeader(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.only(left:10),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Producción',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Dashboard'),
                onTap: (){_con.onPressDashboard();},
              ),
              ListTile(
                leading: Icon(Icons.production_quantity_limits),
                title: Text('Proyectos'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Modulos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
