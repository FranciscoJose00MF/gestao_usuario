import 'package:flutter/material.dart';
import 'package:gestao_usuario/app//routes/app_routes.dart';
import 'package:gestao_usuario/app/data/change_notifier_models/users.dart';
import 'package:gestao_usuario/app/widgets/user_tile.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários Cadastrados'),
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i))),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
          }),
    );
  }
}
