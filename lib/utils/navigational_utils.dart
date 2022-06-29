import 'package:flutter/material.dart';
import 'package:mvvvm_demo/user_list/views/add_users_screen.dart';
import 'package:mvvvm_demo/user_list/views/user_details_screen.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => UserDetailsScreen()));
}

Future<dynamic> openAddUsers(BuildContext context) async {
  return await Navigator.push(
      context, MaterialPageRoute(builder: (context) => AddUsersScreen()));
}

snackBar(timer, msg) => SnackBar(
      duration: timer,
      content: Text(msg),
    );
