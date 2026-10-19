
String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is required';
    }
    if (value.length < 8) {
      return 'The password must be at least 8 characters long';
    }
    return null;
  }

   String? validateEmail(String? value,) {
    if (value == null || value.trim().isEmpty) {
      return 'email is required';
    }
    if (!value.contains('@') || !value.contains('.')) {
      return 'invalid email address';
    }
    return null;
  }
  String? validateConfirmPassword(String? value,dynamic password) {
    if (value == null || value.isEmpty) {
      return 'password is required';
    }
    if (value !=password ) {
      return 'the two password do not match';
    }
    return null;}

   String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This failed is required';
    }
    return null;
  }

