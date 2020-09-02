import 'package:biodriver/app/modules/auth/form/form_widget.dart';
import 'package:biodriver/app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'auth_controller.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key key, this.title = "Auth"}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(body: Observer(
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: colorA,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.06),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorC,
                    borderRadius: BorderRadius.circular(sw * 0.06),
                  ),
                  height: sh * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: sw * 0.03),
                        height: sh * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FormWidget(
                              hint: 'Email',
                              obscure: false,
                              type: TextInputType.emailAddress,
                              onChanged: (value) {
                                controller.email = value;
                              },
                            ),
                            FormWidget(
                              hint: 'Password',
                              obscure:
                                  controller.ispassword == false ? true : false,
                              type: TextInputType.text,
                              onChanged: (value) {
                                controller.password = value;
                              },
                            ),
                            controller.password.isEmpty
                                ? SizedBox()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FlatButton(
                                        onPressed: () {
                                          controller.viewPassword();
                                        },
                                        child: Text(
                                          'View Password',
                                          style: TextStyle(color: colorA),
                                        ),
                                      )
                                    ],
                                  )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(sw * 0.06),
                          ),
                        ),
                        height: sh * 0.1,
                        width: sw,
                        child: FlatButton(
                          onPressed: () {
                            controller.login();
                          },
                          child: Text(
                            'Acessar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}
