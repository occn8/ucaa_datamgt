import 'package:flutter/material.dart';

SnackBar buildSnackBar(String text) {
  return SnackBar(
    backgroundColor: Colors.grey[300],
    duration: const Duration(milliseconds: 800),
    content: SizedBox(
      height: 40,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    ),
  );
}
