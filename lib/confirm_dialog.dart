library confirm_dialog;

import 'package:flutter/material.dart';

class ConfirmDialog {
  static Future<bool?> show(
    BuildContext context,
    String alertMessage, {
    bool? isDismissable,
    String? cancelText,
    String? confirmText,
  }) {
    bool? res;
    return showDialog(
      barrierDismissible: isDismissable ?? true,
      context: context,
      builder: (BuildContext context) => DeleteDialogBody(
        cancelText: cancelText,
        confirmText: confirmText,
        msg: alertMessage,
        onCancel: (v) {
          res = v;
          Navigator.pop(context);
        },
        onConfirm: (v) {
          res = v;
        },
      ),
    ).then((value) {
      return res;
    });
  }
}

//returns true or false

class DeleteDialogBody extends StatelessWidget {
  const DeleteDialogBody({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    this.msg,
    this.cancelText,
    this.confirmText,
  });
  final String? msg, cancelText, confirmText;
  final String defaultMsg = 'Are you sure?';
  final ValueSetter<bool> onConfirm, onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        msg ?? defaultMsg,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
      actions: [
        ElevatedButton(
          onPressed: () => onCancel(false),
          child: Text(cancelText ?? 'cancel'),
        ),
        ElevatedButton(
          onPressed: () => onCancel(true),
          child: Text(confirmText ?? 'ok'),
        ),
      ],
    );
  }
}
