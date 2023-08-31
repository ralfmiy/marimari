
import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/components/app_bar.dart';
import 'package:flutter_template/src/ui/components/drawer_custom.dart';

Widget standartPage(BuildContext context, {Widget? body}){
  return WillPopScope(
    onWillPop: () async {
      return false;
    },
    child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: getAppBar(),
          drawer: getDrawer(context),
          body: body,
        ),
      ),
  );
}