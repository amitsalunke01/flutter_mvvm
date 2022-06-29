import 'package:flutter/material.dart';
//import 'package:mvvvm_demo/Components/app_title.dart';
import 'package:mvvvm_demo/user_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:rakuten_ui/rakuten_ui.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(usersViewModel.selectedUser?.name ?? ''),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitleNormal(text: usersViewModel.selectedUser?.name ?? 'no name'),
            Text(
              usersViewModel.selectedUser?.email ?? 'no email',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
