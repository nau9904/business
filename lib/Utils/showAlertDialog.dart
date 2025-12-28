import 'package:flutter/material.dart';

Future<void> showAlertDialog(
    BuildContext context, String title, String ArgContent) async {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(ArgContent),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK')),
      ],
    ),
  );
}
