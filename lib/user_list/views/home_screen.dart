//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:mvvvm_demo/Components/app_loading.dart';

//import 'package:mvvvm_demo/Components/app_title.dart';
import 'package:mvvvm_demo/Components/users_list_row.dart';
import 'package:mvvvm_demo/user_list/models/DialogData.dart';
import 'package:mvvvm_demo/user_list/models/users_list_model.dart';
import 'package:mvvvm_demo/user_list/view_models/dialog_shared_view_model.dart';
import 'package:mvvvm_demo/user_list/view_models/user_view_model.dart';
import 'package:mvvvm_demo/utils/navigational_utils.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    DialogViewModel dialogViewModel = context.watch<DialogViewModel>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users'),
          actions: [
            IconButton(
                onPressed: () async {
                  DialogData value = await openAddUsers(context);
                  print(
                      "value dialog data 1 ${value.data1} and data 2 ${value.data2}");
                  print(value);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              _ui(usersViewModel, dialogViewModel),
            ],
          ),
        ));
  }

  _ui(UsersViewModel usersViewModel, DialogViewModel dialogViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    if (usersViewModel.userError != null) {
      return Container();
    }
    getValueFromDialog(dialogViewModel, usersViewModel);
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

  void getValueFromDialog(
      DialogViewModel dialogViewModel, UsersViewModel usersViewModel) async {
    if (usersViewModel != null && dialogViewModel != null) {
      if (dialogViewModel.addingData1!.isNotEmpty &&
          dialogViewModel.addingData2!.isNotEmpty) {
        print('value recivied a ${dialogViewModel.addingData1}');
        print('value recivied b ${dialogViewModel.addingData2}');
        usersViewModel.addUsers(
            dialogViewModel.addingData1, dialogViewModel.addingData2);
        dialogViewModel.setData1("");
        dialogViewModel.setData2("");
      }
    }
  }
}
