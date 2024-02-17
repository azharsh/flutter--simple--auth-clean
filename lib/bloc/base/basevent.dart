import 'package:flutter/widgets.dart';

@immutable
abstract class BaseEvent {
  List<Object> get props => [];
}

class PostLogin extends BaseEvent {
  final String username;
  final String password;

  PostLogin(this.username, this.password);
}

class PostRegister extends BaseEvent {
  final String email;
  final String username;
  final String password;

  PostRegister(this.email, this.username, this.password);
}
