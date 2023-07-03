// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ozb_cli/repo/api_status.dart';

class ProductError extends Failure {
  Object message;
  int code;

  ProductError({
    required this.message,
    required this.code,
  }) : super(code: 0, errorResponse: message);
}
