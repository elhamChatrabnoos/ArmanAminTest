// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_arman/constants/app_global.dart';
import 'package:test_arman/local_database/cashed_info.dart';

class RemoveDataScreen extends StatefulWidget {
  const RemoveDataScreen({Key? key}) : super(key: key);

  @override
  State<RemoveDataScreen> createState() => _RemoveDataScreenState();
}

class _RemoveDataScreenState extends State<RemoveDataScreen> {
  bool showBtnLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Third page')),
      body: Center(
        child: OutlinedButton(
          style: AppGlobal.buttonStyle(),
          onPressed: () async {
            await _clearData(context);
          },
          child: showBtnLoading
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : const Text('Clear data'),
        ),
      ),
    );
  }

  Future<void> _clearData(BuildContext context) async {
    setState(() {
      showBtnLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    await CashedInfo.clearStorage();
    setState(() {
      showBtnLoading = false;
    });
    AppGlobal.showMessage(context, 'Data clear success');
  }


}
