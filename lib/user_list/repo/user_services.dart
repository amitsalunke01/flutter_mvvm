
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvvm_demo/user_list/models/users_list_model.dart';
import 'package:mvvvm_demo/utils/constants.dart';
import 'api_status.dart';

class UserService {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USERS_LIST);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(response: usersListModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'Failure Response');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Format Response');
    } catch (e) {
      print(e.toString());
      return Failure(code: UNKNOWN_ERROR, errorResponse: e.toString());
      //return e.toString();
    }
  }
}
