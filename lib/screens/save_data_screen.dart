// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_arman/local_database/cashed_info.dart';

class SaveDataScreen extends StatefulWidget {
  SaveDataScreen({Key? key}) : super(key: key);

  @override
  State<SaveDataScreen> createState() => _SaveDataScreenState();
}

class _SaveDataScreenState extends State<SaveDataScreen> {
  bool showBtnLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second page')),
      body: Center(
        child: OutlinedButton(
          style: _buttonColor(),
          onPressed: () async {
            await _saveNewData(context);
          },
          child: showBtnLoading
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : const Text('Save a data'),
        ),
      ),
    );
  }

  Future<void> _saveNewData(BuildContext context) async {
    setState(() {
      showBtnLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    await CashedInfo.saveData('Arman Amin Company');
    setState(() {
      showBtnLoading = false;
    });
    _showSuccessMessage(context);
  }

  ButtonStyle _buttonColor() {
    return const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
        foregroundColor: MaterialStatePropertyAll(Colors.white));
  }

  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Data saved success')));
  }
}
