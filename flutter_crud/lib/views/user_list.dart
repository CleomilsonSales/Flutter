import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //{...} é clanando o metodo
    //chamando o metodo diretamente, será chamado pelo provider
    //final users = {...DUMMY_USERS};
    //instanciando o provider
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
              );
              //adicionando manual para testar
              /*users.put(
                User(
                  name: 'Teste',
                  email: 'teste@familia.com.br',
                  avatarUrl: '',
                ),
              );*/
              //removendo manual para testar
              /*users.remove(users.byIndex(0));*/
              //alterando manual para testar
              /*users.put(
                User(
                  id: '2',
                  name: 'Teste',
                  email: 'teste@familia.com.br',
                  avatarUrl: '',
                ),
              );*/
            },
          )
        ],
      ),
      body: ListView.builder(
        //antes do provider
        //itemCount: users.length,
        itemCount: users.count,
        itemBuilder: (ctx, i) =>
            //Text(users.values.elementAt(i).name),
            //antes do provider
            //UserTile(users.values.elementAt(i)),
            UserTile(users.byIndex(i)),
      ),
    );
  }
}
