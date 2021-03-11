import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Role/models/role.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Users/NormalUser/UserUpdate/AddUpdateUser.dart';
import 'Features/Authentication/authntication.dart';
import 'Features/Job/models/job.dart';
import 'Features/Service/Service.dart';
import 'Users/Admin/RoleDisplayScreen/AdminRoleUpdate.dart';
import 'Users/Admin/RoleDisplayScreen/adminRoleMainPage.dart';
import 'Users/Admin/UserManagement/AddUpdateAdmin.dart';
import 'Users/Admin/UserManagement/UserDetail.dart';
import 'Users/Admin/UserManagement/User_main_screen.dart';
import 'Users/Common/loading_screen.dart';
import 'Users/Common/login_page.dart';
import 'Users/Common/signup_page.dart';
import 'Users/NormalUser/UserUpdate/Users_main.dart';
import 'Users/Technicians/TechnicianUpdate/Technician_main.dart';
import 'Users/users.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart' as User;


bool isAuthenticated = false;
bool isAdmin = false;
bool isTechnician = false;
User.User user;
class ServiceAppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch(settings.name){
       case '/':

           return MaterialPageRoute(
               builder: (context) =>
                   BlocBuilder<AuthBloc, AuthStates>(builder: (context, state) {

                     if (state is AutoLoginState) {

                       return loading_screen(title: 'Authenticating');
                     } else if (state is AutoLoginSuccessState) {
                       print("This is the user role++++++++++${state.user.Role.roleName}");
                       //If the User has already signed in switch by the role
                       isAdmin = state.user.Role.roleName == "ADMIN";

                       isAuthenticated = true;
                       user=state.user;
                     } else if (state is AutoLoginFailedState) {
                       isAuthenticated = false;
                     } else if (state is LoggingOutState) {
                       return loading_screen(title: 'Logging out');
                     } else if (state is LoggingOutSuccessState) {
                       print("logingng out $isAuthenticated");
                       isAuthenticated = false;
                     } else if (state is LoggingOutErrorState) {
                       showDialog(
                         context: context,
                         builder: (ctx) => AlertDialog(
                           title: Text('An Error Occurred!'),
                           content: Text('Failed to log out'),
                           actions: <Widget>[
                             FlatButton(
                               child: Text('Okay'),
                               onPressed: () {
                                 Navigator.of(ctx).pop();
                               },
                             )
                           ],
                         ),
                       );
                     }
//                     return UserMain();
                     return isAuthenticated
                         ? (isAdmin ? AdminMainPage(args: user,) :  UserMain(args: user,))
                         : SignIn();
                   }));


         break;
      case SignIn.routeName:
        loading_screen(title: 'Authenticating');
             return MaterialPageRoute(builder: (context) => SignIn());
      case  Register.routeName:
        return MaterialPageRoute(builder: (context) => Register());
      case UserDetail.routeName:
        User.User user = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => UserDetail(
              user: user,
            ));

      case AdminMainPage.routeName:
//        final UserArgument adminArgs = settings.arguments;
//        /admin
       final UserArgument args = settings.arguments;
       print("the user arrguent is ${args.user}");
        return MaterialPageRoute(
            builder: (context) => AdminMainPage(
                    args: args.user,
//              the arguments will pass here
            ));
        break;
      case UserMain.routeName:
//        final UserArgument adminArgs = settings.arguments;
//        /admin
        final UserArgument args = settings.arguments;
        print("the user arrguent is ${args.user}");
        return MaterialPageRoute(
            builder: (context) => UserMain(
              args: args.user,
//              the arguments will pass here
            ));
        break;


       case AdminServiceMainPage.routeName:


         //        /admin/service
         return MaterialPageRoute(
             builder: (context) => AdminServiceMainPage(

 //              the arguments will pass here
             ));
         break;
       case AdminServiceDetail.routeName:
         final Service service = settings.arguments;
 //        /admin/service/detail
         return MaterialPageRoute(
             builder: (context) => AdminServiceDetail(
               service: service,
 //              the arguments will pass here
             ));
         break;
       case AdminServiceCreate.routeName:
         final ServiceArgument argument = settings.arguments;
 //        /admin/service/create
         return MaterialPageRoute(
             builder: (context) => AdminServiceCreate(
               args: argument,
 //              the arguments will pass here
             ));
         break;
      case AdminJobMainPage.routeName:
//        /admin/job
        return MaterialPageRoute(
            builder: (context) => AdminJobMainPage(
//              the arguments will pass here
            ));
        break;
      case AdminJobDetail.routeName:
        Job job = settings.arguments;
//        /admin/job/detail
        return MaterialPageRoute(
            builder: (context) => AdminJobDetail(
              job: job ,
//              the arguments will pass here
            ));
        break;
       case RoleAddUpate.routeName:
         final RoleArguments args = settings.arguments;
 //        /admin/technician
         return MaterialPageRoute(
             builder: (context) => RoleAddUpate(
               args: args,
 //              the arguments will pass here
             ));
         break;
      case AddUpdateAdmin.routeName:
          UserArgument args = settings.arguments;
          return MaterialPageRoute(
              builder: (context) => AddUpdateAdmin(
                    args: args,
                ));
          break;

       case AddUpdateUser.routeName:
 //        /admin/technician/detail
         return MaterialPageRoute(
             builder: (context) => AddUpdateUser(
 //              the arguments will pass here
             ));
         break;
       case Users_mainProfile.routeName:
 //        /user
         return MaterialPageRoute(
             builder: (context) => Users_mainProfile(
 //              the arguments will pass here
             ));
         break;
      case UserJobMain.routeName:
//        /user/job
        return MaterialPageRoute(
            builder: (context) => UserJobMain(
//              the arguments will pass here
            ));
      break;
      case UserJobDetail.routeName:
//        /user/job/detail
      final Job job = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => UserJobDetail(
              job: job,
//              the arguments will pass here
            ));
        break;
      case UserCreateJob.routeName:
//        /user/job/create
      final JobArguments args = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => UserCreateJob(
              args: args,
//              the arguments will pass here
            ));
        break;
      case UserCategoryMain.routeName:
//        /user/category
        return MaterialPageRoute(
            builder: (context) => UserCategoryMain(
//              the arguments will pass here
            ));

        break;
      case UserServiceMain.routeName:
//        /user/category/service
        return MaterialPageRoute(
            builder: (context) => UserServiceMain(
//              the arguments will pass here
            ));
        break;
      case UserServiceDetail.routeName:
//        /user/category/service/detail
      final CategoryArgument args = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => UserServiceDetail(
              services: args,
//              the arguments will pass here
            ));
        break;
      case TechnicianRequestMain.rotueName:
//        /technician
        return MaterialPageRoute(
            builder: (context) => TechnicianRequestMain(
//              the arguments will pass here
            ));
        break;
      case TechnicianRequestDetail.routeName:
        return MaterialPageRoute(
            builder: (context) => TechnicianRequestDetail(
//              the arguments will pass here
            ));
//        /technician
        break;




    }


//    return MaterialPageRoute(builder: (context) => CategoryMainScreen());
  }
}

class ServiceArgument {
  final Service service;
  final bool edit;
  ServiceArgument({this.service, this.edit});
}
class AdminArgument {
final int index;
AdminArgument({this.index});
}

class JobArguments {
  final Job job;
  final bool edit;
  JobArguments({this.job, this.edit});
}

class RoleArgument{
  final Rolee role;
  final bool edit;
  RoleArgument({this.role, this.edit});
}
class UserArgument {
  final User.User user;
  final bool edit;
  UserArgument({this.user, this.edit});
}

class CategoryArgument{
  final String title;
  final String image;
  final List<Service> services;

  CategoryArgument({this.services, this.title,this.image});
}