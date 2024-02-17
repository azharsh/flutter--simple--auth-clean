import 'package:flutter/cupertino.dart';
import 'package:simpleauth/domain/model/baseresponse.dart';

@immutable
abstract class BaseState {
  List<Object> get props => [];
}

class Empty extends BaseState {}

class Loading extends BaseState {}

class Loaded extends BaseState {
  final BaseReponse baseResponse;

  Loaded({required this.baseResponse});
}

class Error extends BaseState {
  final String message;

  Error({required this.message});
}
