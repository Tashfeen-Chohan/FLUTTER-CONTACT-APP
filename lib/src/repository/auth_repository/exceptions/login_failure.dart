class LoginFailure {
  final String message;

  LoginFailure([
    this.message = "Something went wrong!",
  ]);

  factory LoginFailure.fromCode(String code) {
    switch (code) {
      case "wrong-password":
        return LoginFailure("Incorrect password. Please try again!");
      case "user-not-found":
        return LoginFailure("User not found. Check your email or Sign up!");
      case "invalid-email":
        return LoginFailure("Email is not valid or badly formated.");
      case "invalid-credential":
        return LoginFailure("Invalid credentials. Please try again.");
      default:
        return LoginFailure();
    }
  }
}
