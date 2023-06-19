// ConsumerWidget
// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_new/common/form_provider.dart';
import 'package:flutter_new/store/form_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormExampleNotifier extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  FormExampleNotifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameNotifierProvider);
    final email = ref.watch(emailNotifierProvider);

    ref.listen(formValidatorNotifierProvider, (previous, next) {
      if (next.nameError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.nameError.toString()),
          ),
        );
      } else if (next.emailError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.emailError.toString()),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Notifierで送信完了'),
          ),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Form Example Notifier'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(labelText: '名前'),
              ),
            ),
            const SizedBox(height: 20),
            Container(),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(labelText: 'メールアドレス'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(formValidatorNotifierProvider.notifier)
                    .validate(name: name.text, email: email.text);
              },
              child: Text('送信'),
            ),
          ],
        ),
      ),
    );
  }
}