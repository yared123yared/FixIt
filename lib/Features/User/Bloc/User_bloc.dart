import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:meta/meta.dart';

import '../User.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final Util util;
  UserBloc({@required this.userRepository,@required this.util})
      : assert(userRepository != null),
        super(UserLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {//CRUD events on the User including the login
    if (event is UsersLoad) {//For multiple User
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

    if (event is UserLoad) {//for one User
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
    if (event is UserLoadEmail) {//for one User
      print("User load method");
      yield UserLoading();

      try {
        User user;
        user= await userRepository.getUserByEmail(event.email);
        print("This is the User $user");
        yield UserLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }


    if (event is UserCreate) {
      try {
        await userRepository.createUser(event.user);
        final user= await userRepository.getUser(event.user.Email);
        yield UserLoadSuccess(user);
        print('');
      } catch (err) {
        print('user create err$err');
        yield UserOperationFailure();
      }
    }

    if (event is UserUpdate) {
      try {
        print('Users Update in the bloc');
        await userRepository.updateUser(event.user);
        final user = await userRepository.getUsers();
        print('Done ---- Users Update in the bloc');
        yield UsersLoadSuccess(user);
      } catch (err) {
        print("Some exception happened : $err");
        yield UserOperationFailure();
      }
    }

    if (event is UserDelete) {
      try {
        await userRepository.deleteUser(event.user.UserId);
        final user = await userRepository.getUsers();
        yield UsersLoadSuccess(user);
      } catch (e) {
        print("Error de,ete=$e");
        yield UserOperationFailure();
      }
    }
  }

  // Stream<UserState> _mapAppLoginEventToState(UserEvent event)  async* {//For Auto login if the user has already logged in
  //
  //   yield AutoLoginState();
  //   try {
  //     String token = await util.getUserToken();
  //     if (token == null) {
  //       yield AutoLoginFailedState();
  //       return;
  //     }
  //     String expiry = await util.getUserToken();
  //     if (expiry == null) {
  //       yield AutoLoginFailedState();
  //       return;
  //     }
  //     bool isExpired = util.isExpired(expiry);
  //     if (isExpired) {
  //       yield AutoLoginFailedState();
  //       return;
  //     } else {
  //       User user = await util.getUserInformation();
  //       yield AutoLoginSuccessState(user: user);
  //     }
  //   } catch (e) {
  //     yield AutoLoginFailedState();
  //   }
  // }
}
