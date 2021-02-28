import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../User.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({@required this.userRepository})
      : assert(UserRepository != null),
        super(UserLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UsersLoad) {
      print("Users load method");
      yield UserLoading();

      try {
        final user = await userRepository.getUsers();
        print("This is the User $user");
        yield UsersLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserLoad) {
      print("User load method");
      yield UserLoading();

      try {
        User user;
        user= await userRepository.getUser(event.email);
        print("This is the User $user");
        yield UserLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }


    if (event is UserCreate) {
      try {
        await userRepository.createUser(event.user);
        final user= await userRepository.getUser(event.user.email);
        yield UserLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserUpdate) {
      try {
        await userRepository.updateUser(event.user);
        final user = await userRepository.getUsers();
        yield UsersLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserDelete) {
      try {
        await userRepository.deleteUser(event.user.email);
        final user = await userRepository.getUsers();
        yield UsersLoadSuccess(user);
      } catch (e) {
        print("Error de,ete=$e");
        yield UserOperationFailure();
      }
    }
  }
}
