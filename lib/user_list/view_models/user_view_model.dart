import 'package:flutter/material.dart';
import 'package:mvvvm_demo/user_list/models/user_error.dart';
import 'package:mvvvm_demo/user_list/repo/api_status.dart';
import 'package:mvvvm_demo/user_list/repo/user_services.dart';

import '../models/users_list_model.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UsersModel> _usersListModel = [];
  UserError? _userError;
  UsersModel? _selectedUser;
  UsersModel? _addingUser;

  UsersViewModel() {
    getUsers();
  }

  bool get loading => _loading;

  UserError? get userError => _userError;

  List<UsersModel> get userListModel => _usersListModel;

  UsersModel? get selectedUser => _selectedUser;

   setAddingUser(UsersModel value) {
    _addingUser = value;
  }
    setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setUsersListModel(List<UsersModel> userListModel) {
    _usersListModel = userListModel;
  }

  setUsersError(UserError userError) {
    _userError = userError;
  }

  setSelectedUser(UsersModel usersModel) {
    _selectedUser = usersModel;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserService.getUsers();
    if (response is Success) {
      setUsersListModel(response.response as List<UsersModel>);
    }

    if (response is Failure) {
      UserError userError =
          UserError(code: response.code, errorResponse: response.errorResponse);
      setUsersError(userError);
    }
    setLoading(false);
  }

  addUsers(String? data1, String? data2) {
    print('value recivied viewmodel a');
    UsersModel usersModel = UsersModel(name: data1,email: data2);
    setAddingUser(usersModel);
      print('value recivied viewmodel b ${_addingUser?.name}');
      _usersListModel.add(_addingUser!);
      _addingUser = UsersModel();

  }
}
