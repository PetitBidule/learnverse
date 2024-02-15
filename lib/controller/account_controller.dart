class CreateAccountController {
  bool verificationPasswordsEmail(
      String email, String password, String cpassword, bool ispwd) {
    bool emailIsValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (password == cpassword) {
      if (emailIsValid == true) {
        ispwd = true;
        return ispwd;
      } else {
        return false;
      }
    } else {
      ispwd = false;
      return ispwd;
    }
  }
}
