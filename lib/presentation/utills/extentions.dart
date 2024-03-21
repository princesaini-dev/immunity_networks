import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:immunity_networks/app/constants.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:intl/intl.dart';

typedef RedirectValue = void Function();

extension Validator on String {
  printMessage() {
    if (kDebugMode) {
      print(this);
    }
  }

  bool isValidatePhoneNumber() {
    if (isEmpty) {
      showToast(StringManager.phoneRequiredField);
      return false;
    } else if (length != 10) {
      showToast(StringManager.invalidPhoneNumber);
      return false;
    } else {
      return true;
    }
  }

  validatePetalsPoint(int totalPetals, RedirectValue onComplete) {
    if (isEmpty) {
      showToast(StringManager.petalsRequiredField);
    } else if (toInt()! < 1) {
      showToast(StringManager.invalidPetals);
    } else if (toInt()! > (totalPetals)) {
      showToast(StringManager.insufficientPetals);
    } else {
      onComplete();
    }
  }

  bool isValidateEmail() {
    if (isEmpty) {
      showToast(StringManager.emailRequiredField);
      return false;
    } else if (!RegExp(Constants.phoneNumberRegex).hasMatch(this)) {
      showToast(StringManager.invalidEmail);
      return false;
    } else {
      return true;
    }
  }

  bool validateOTPField() {
    if (length != Constants.optFieldLength) {
      showToast(StringManager.invalidOtp);
      return false;
    } else {
      return true;
    }
  }

  bool validateField(String fieldName) {
    if (isEmpty) {
      showToast(fieldName + StringManager.fieldIsRequired);
      return false;
    } else {
      return true;
    }
  }

  bool isValidatePassword() {
    if (isEmpty) {
      showToast(StringManager.passwordRequiredField);
      return false;
    } else if (length < 6) {
      showToast(StringManager.passwordLengthError);
      return false;
    } else {
      return true;
    }
  }

  bool isValidatePasswordAndConfirmPassword(String password) {
    if (this != password) {
      showToast(StringManager.passwordConfirmPasswordNotMatch);
      return false;
    } else {
      return true;
    }
  }

  double toDoubleOrNull() {
    return double.tryParse(this) ?? 0;
  }

  int? toInt() {
    return int.parse(this);
  }

  String convertDateFormat() {
    try {
      final parsedDate =
          DateFormat('yyyy-MM-ddTHH:mm:ss.ssssssZ').parse(this, true);
      return DateFormat('dd MMM, hh:mm a').format(parsedDate.toLocal());
    } catch (e) {
      // Handle error if the date parsing fails
      return StringManager.invalidDate;
    }
  }
}

extension NumberExtension on num {
  bool isEvenNumber() {
    return this % 2 == 0;
  }

  bool isOddNumber() {
    return this % 2 != 0;
  }
}

typedef ClickListener = void Function();

extension ClickListenerExtension on Widget {
  Widget setOnClickListener(ClickListener onClick) {
    return InkWell(
      onTap: onClick,
      child: this,
    );
  }

  Widget addBorder({bool showNextIcon = false, double verticalPadding = 15}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 12, vertical: verticalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            this,
            Visibility(
                visible: showNextIcon,
                child: const SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(Icons.arrow_forward),
                ))
          ],
        ),
      ),
    );
  }
}

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
