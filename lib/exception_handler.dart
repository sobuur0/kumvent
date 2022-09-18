import 'package:kumvent/constants/enums.dart';

class AuthExceptionHandler {
  static handleException(e) {
    print(e.code);
    var status;
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        status = NetworkResultStatus.invalidEmail;
        break;
      case "ERROR_WRONG_PASSWORD":
        status = NetworkResultStatus.wrongPassword;
        break;
      case "ERROR_USER_NOT_FOUND":
        status = NetworkResultStatus.userNotFound;
        break;
      case "ERROR_USER_DISABLED":
        status = NetworkResultStatus.userDisabled;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = NetworkResultStatus.tooManyRequests;
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        status = NetworkResultStatus.operationNotAllowed;
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        status = NetworkResultStatus.emailAlreadyExists;
        break;
      default:
        status = NetworkResultStatus.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case NetworkResultStatus.invalidEmail:
        errorMessage = "Your email address appears to be invalid.";
        break;
      case NetworkResultStatus.wrongPassword:
        errorMessage = "Your password is wrong.";
        break;
      case NetworkResultStatus.userNotFound:
        errorMessage = "User with this email or password doesn't exist.";
        break;
      case NetworkResultStatus.userDisabled:
        errorMessage = "User with this email has been disabled.";
        break;
      case NetworkResultStatus.tooManyRequests:
        errorMessage = "Too many requests. Try again later.";
        break;
      case NetworkResultStatus.operationNotAllowed:
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      case NetworkResultStatus.emailAlreadyExists:
        errorMessage =
            "The email has already been registered. Please login or reset your password.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }

    return errorMessage;
  }
}
