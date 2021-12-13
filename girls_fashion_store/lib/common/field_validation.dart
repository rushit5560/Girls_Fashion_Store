
class FieldValidator {
  String? validateFullName(String value) {
    if (value.isEmpty) {
      return 'Full name is Required';
    }
    // if (!RegExp(r"^[A-Z a-z-]{2,25}$").hasMatch(value)) {
    //   return 'invalid first name';
    // }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!isNumeric(value) &&
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "password is Required";
    } else if (value.length < 6) {
      return "Length should be 6 character";
    } else {
      return null;
    }
  }

  String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.isEmpty) {
      return "Phone number is Required";
    } else if (value.length != 10) {
      return 'Phone Number must be of 10 digit';
    } else {
      return null;
    }
  }

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? validateSubject(String value) {
    if (value.isEmpty) {
      return 'Subject is Required';
    }

    if (!RegExp(r"^[A-Z a-z-]{2,25}$").hasMatch(value)) {
      return 'invalid first name';
    }
    return null;
  }

  String? validateComment(String value) {
    if (value.isEmpty) {
      return 'Comment is Required';
    }

    if (!RegExp(r"^[A-Z a-z-]{2,25}$").hasMatch(value)) {
      return 'invalid first name';
    }
    return null;
  }

  String? validateCardNumber(String number) {
    if(number.isEmpty){
      return 'Card Number Not be Empty';
    } else if(number.length != 16) {
      return 'Card Number not Valid';
    }
    return null;
  }

  String? validateCardExpiryDate(String expDate) {
    if(expDate.isEmpty) {
      return 'Date not be Empty';
    } else if(expDate.length != 5) {
      return 'Date Not Valid';
    }
    return null;
  }

  String? validateCardCvv(String cardCvv) {
    if(cardCvv.isEmpty){
      return 'Enter CVV Code';
    } else if(cardCvv.length != 3){
      return 'Enter Valid CVV';
    }
    return null;
  }
}
