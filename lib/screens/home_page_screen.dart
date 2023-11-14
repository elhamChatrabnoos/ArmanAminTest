import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_arman/screens/data_from_server_screen.dart';
import 'package:test_arman/screens/remove_data_screen.dart';
import 'package:test_arman/screens/save_data_screen.dart';
import 'package:test_arman/screens/show_data_screen.dart';
import 'package:test_arman/widgets/custom_button.dart';

import '../constants/app_global.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShowDataScreen(),
                      ));
                },
                buttonText: 'Show data',
              ),
              CustomButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SaveDataScreen(),
                        ));
                  },
                  buttonText: 'Save data'),
              CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RemoveDataScreen(),
                      ),
                    );
                  },
                  buttonText: 'Remove data'),
            ],
          ),
          CustomButton(
            style: AppGlobal.buttonStyle(),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataFromServerScreen(),
                  ));
            },
            buttonText: 'Data from server',
          ),
        ],
      ),
    );
  }
}
