import 'package:flutter/material.dart';

Color customerColor({String? date}) {
  switch (date) {
    case 'Today':
      return Colors.blue;
    case 'Tommorow':
      return Colors.red;
    case 'Yesterday':
      return Colors.blue.shade400;
    default:
      return Colors.grey;
  }
}
