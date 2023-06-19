import 'package:flutter_new/model/error_msg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormValidatorNotifier extends Notifier<ErrorMsgState> {
  @override
  build() {
    return ErrorMsgState();
  }

  void validate({String? name, String? email}) {
    String? nameError;
    String? emailError;

    if (name == null || name.isEmpty) {
      nameError = "名前が入力されていません";
    }
    if (email == null || email.isEmpty) {
      emailError = "メールアドレスが入力されていません";
    }

    state = ErrorMsgState(nameError: nameError, emailError: emailError);
  }
}

final formValidatorNotifierProvider =
    NotifierProvider<FormValidatorNotifier, ErrorMsgState>(
        FormValidatorNotifier.new);