import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NameNotifier extends Notifier<TextEditingController> {
  @override
   build() {
    return TextEditingController(text: 'NameNotifier');
  }
}

class EmailNotifier extends Notifier<TextEditingController> {
  @override
   build() {
    return TextEditingController(text: 'EmailNotifier');
  }
}

final nameNotifierProvider = NotifierProvider<NameNotifier, TextEditingController>(NameNotifier.new);
final emailNotifierProvider = NotifierProvider<EmailNotifier, TextEditingController>(EmailNotifier.new);