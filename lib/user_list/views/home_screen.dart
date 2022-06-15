//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mvvvm_demo/Components/app_loading.dart';
import 'package:mvvvm_demo/Components/app_title.dart';
import 'package:mvvvm_demo/Components/users_list_row.dart';
import 'package:mvvvm_demo/user_list/models/users_list_model.dart';
import 'package:mvvvm_demo/user_list/view_models/user_view_model.dart';
import 'package:mvvvm_demo/utils/navigational_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [_ui(usersViewModel)],
          ),
        ));
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    if (usersViewModel.userError != null) {
      return Container();
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UsersModel usersModel = usersViewModel.userListModel[index];
          return UserListRow(
            usersModel: usersModel,
            onTap: () async {
              usersViewModel.setSelectedUser(usersModel);
              openUserDetails(context);
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: usersViewModel.userListModel.length,
      ),
    );
  }
}
