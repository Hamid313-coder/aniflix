import 'package:flutter/material.dart';

snackBar(String message, BuildContext context, {Color? color}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.red,
      content: Text(message),
    ),
  );
}

List<Text> showAuthors(List<dynamic> authors) => authors
    .map((author) => authors.indexOf(author) == authors.length - 1
        ? Text(author.toString())
        : Text("${author.toString()}, "))
    .toList();
