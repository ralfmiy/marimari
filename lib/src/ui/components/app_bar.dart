import 'package:flutter/material.dart';

PreferredSize getAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50.0),
    child: AppBar(
      title: const Text("Dashboard"),
      centerTitle: true,
    ),
  );
}
