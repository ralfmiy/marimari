import 'package:flutter/material.dart';

Drawer getDrawer(BuildContext context){
  return Drawer(
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
                onTap: (){onPressDashboard();},
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
        );
}


//Functions
void onPressDashboard(){

}
