import 'package:flutter/material.dart';
import 'package:mvvvm_demo/user_list/models/DialogData.dart';
import 'package:mvvvm_demo/user_list/view_models/dialog_shared_view_model.dart';
import 'package:provider/provider.dart';

import '../../utils/navigational_utils.dart';

class AddUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String data1 = '';
    String data2 = '';
    DialogViewModel dialogViewModel = context.watch<DialogViewModel>();
    DialogData dialogData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
        actions: [
          IconButton(
              onPressed: () async {
                bool status = await dialogViewModel.addUser();
                if (status) {
                  dialogData = DialogData(data1, data2);
                  Navigator.pop(context, dialogData);
                } else {
                  print('Enter value');
                  ScaffoldMessenger.of(context).showSnackBar(snackBar(
                      Duration(seconds: 1), "Please enter name and email"));
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Name'),
              onChanged: (val) async {
                data1 = val;
                dialogViewModel.setData1(val);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (val) async {
                data2 = val;
                dialogViewModel.setData2(val);
              },
            )
          ],
        ),
      ),
    );
  }
}
