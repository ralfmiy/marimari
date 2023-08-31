import 'package:flutter/material.dart';
import 'package:flutter_template/src/ui/page_controllers/login/login_page_controller.dart';
import 'package:flutter_template/src/utils/page_args.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginPage extends StatefulWidget {
  final PageArgs? args;
  const LoginPage(this.args, {Key? key}) : super(key: key);

  @override
  LoginPagePageState createState() => LoginPagePageState();
}

class LoginPagePageState extends StateMVC<LoginPage> {
  late LoginPageController _con;
  PageArgs? args;

  LoginPagePageState() : super(LoginPageController()) {
    _con = LoginPageController.con;
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
        body: Center(
          child: SingleChildScrollView(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Image.asset(
                  "images/logo.jpg",
                  width: 600,
                ),
                const SizedBox(
                  width: 40,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                            label: Text("Usuario"), alignLabelWithHint: true),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                            label: Text("Contraseña"),
                            alignLabelWithHint: true),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150,
                            child: FilledButton(
                                onPressed: () {
                                  _con.onPressLogin();
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.login),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Ingresar")
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 150,
                            child: FilledButton(
                                onPressed: () {},
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.person_add),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Registrarse")
                                  ],
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          onTap: () {},
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: const Text(
                            "Olvidé mi constraseña",
                            style: TextStyle(color: Colors.green),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
