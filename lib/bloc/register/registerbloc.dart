import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleauth/bloc/base/basestate.dart';
import 'package:simpleauth/bloc/base/basevent.dart';
import 'package:simpleauth/repositories/repository.dart';

class RegisterBloc extends Bloc<BaseEvent, BaseState> {
  final ApiRepository apiRepository = ApiRepository();

  RegisterBloc() : super(Empty()) {
    on<PostRegister>((event, emit) async {
      emit(Loading());
      final failureOrGetMe = await apiRepository.postRegister(
          event.email, event.username, event.password);
      if (failureOrGetMe.isLeft) {
        emit(Error(message: failureOrGetMe.left));
      } else {
        emit(Loaded(baseResponse: failureOrGetMe.right));
      }
    });
  }
}
