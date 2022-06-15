import 'package:flutter/material.dart';

import '../user_list/models/users_list_model.dart';
import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UsersModel? usersModel;
  final Function() onTap;

  UserListRow({this.usersModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(
            text: usersModel?.name ?? '',
          ),
          Text(usersModel?.email ?? 'no email',
              style: TextStyle(color: Colors.black))
        ],
      )),
    );
  }
}
