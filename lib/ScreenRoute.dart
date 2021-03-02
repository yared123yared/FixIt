import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/Role/models/role.dart';
import 'Features/Job/models/job.dart';
import 'Features/Service/Service.dart';
import 'Users/Admin/RoleDisplayScreen/AdminRoleUpdate.dart';
import 'Users/Admin/RoleDisplayScreen/adminRoleMainPage.dart';
import 'Users/users.dart';


class ServiceAppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch(settings.name){
       case '/':
 //        /
         return MaterialPageRoute(
             builder: (context) => AdminServiceMainPage(
 //              the arguments will pass here
             ));
         break;
      case AdminMainPage.routeName:
        final AdminArgument adminArgs = settings.arguments;
//        /admin
        AdminArgument args = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => AdminMainPage(

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
//       case AdminRoleDetail.routeName:
// //        /admin/technician/detail
//         return MaterialPageRoute(
//             builder: (context) => AdminRoleDetail(
// //              the arguments will pass here
//             ));
//         break;
       case UserMain.routeName:
 //        /user
         return MaterialPageRoute(
             builder: (context) => UserMain(
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
        final args = settings.arguments;
//        /user/job/detail
        return MaterialPageRoute(
            builder: (context) => UserJobDetail(

//              the arguments will pass here
            ));
        break;
      case UserCreateJob.routeName:
//        /user/job/create
        return MaterialPageRoute(
            builder: (context) => UserCreateJob(
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
      final CategoryArgument lists = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => UserServiceDetail(
              services: lists
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
  final Role role;
  final bool edit;
  RoleArgument({this.role, this.edit});
}

class CategoryArgument{
  final List<Service> services;
  final String title;
  final String image;
  CategoryArgument({this.services, this.title, this.image});
}