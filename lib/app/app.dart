import 'package:flutter/material.dart';
import 'package:gestao_usuario/app/data/change_notifier_models/users.dart';
import 'package:gestao_usuario/app/routes/app_routes.dart';
import 'package:gestao_usuario/app/view/user_form.dart';
import 'package:gestao_usuario/app/view/user_list.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (ctx) => Users())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            AppRoutes.HOME: (_) => UserList(),
            AppRoutes.USER_FORM: (_) => UserForm()
          },
        ));
  }
}
