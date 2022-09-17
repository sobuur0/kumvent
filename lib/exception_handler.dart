import 'package:kumvent/constants/enums.dart';

class AuthExceptionHandler {

  static handleException(e) {
    print(e.code);
    var status;
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        status = NewtworkResultStatus.invalidEmail;
        break;
      case "ERROR_WRONG_PASSWORD":
        status = NewtworkResultStatus.wrongPassword;
        break;
      case "ERROR_USER_NOT_FOUND":
        status = NewtworkResultStatus.userNotFound;
        break;
      case "ERROR_USER_DISABLED":
        status = NewtworkResultStatus.userDisabled;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = NewtworkResultStatus.tooManyRequests;
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        status = NewtworkResultStatus.operationNotAllowed;
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        status = NewtworkResultStatus.emailAlreadyExists;
        break;
      default:
        status = NewtworkResultStatus.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case NewtworkResultStatus.invalidEmail:
        errorMessage = "Your email address appears to be invalid.";
        break;
      case NewtworkResultStatus.wrongPassword:
        errorMessage = "Your password is wrong.";
        break;
      case NewtworkResultStatus.userNotFound:
        errorMessage = "User with this email or password doesn't exist.";
        break;
      case NewtworkResultStatus.userDisabled:
        errorMessage = "User with this email has been disabled.";
        break;
      case NewtworkResultStatus.tooManyRequests:
        errorMessage = "Too many requests. Try again later.";
        break;
      case NewtworkResultStatus.operationNotAllowed:
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      case NewtworkResultStatus.emailAlreadyExists:
        errorMessage =
            "The email has already been registered. Please login or reset your password.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }

    return errorMessage;
  }
}