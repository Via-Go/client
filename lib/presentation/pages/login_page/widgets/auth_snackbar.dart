import 'package:flutter/material.dart';

SnackBar authSnackBar({required String content}) => SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 3),
    );
