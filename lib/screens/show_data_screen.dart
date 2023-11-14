import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_arman/local_database/cashed_info.dart';

class ShowDataScreen extends StatelessWidget {
  const ShowDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('First page'),),
        body: FutureBuilder<String?>(
          future: _getData(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return Center(
                child: Text(snapshot.data ?? 'nothing'),
              );
            }
            return const Center(
              child: Text('There is no data in local storage'),
            );
          },
        ));
  }

  Future<String?> _getData() async {
    return await CashedInfo.getSavedData();
  }
}
