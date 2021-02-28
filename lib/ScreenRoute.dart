import 'package:flutter/material.dart';
import 'Features/Service/Service.dart';
import 'Features/job/models/job.dart';
import 'Role/users.dart';


class ServiceAppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch(settings.name){
//       case '/':
// //        /
//         return MaterialPageRoute(
//             builder: (context) => AdminServiceMainPage(
// //              the arguments will pass here
//             ));
//         break;
      case AdminMainPage.routeName:
//        /admin
        AdminArgument args = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => AdminMainPage(
//              the arguments will pass here
            ));
        break;


//       case AdminServiceMainPage.routeName:
// //        /admin/service
//         return MaterialPageRoute(
//             builder: (context) => AdminServiceMainPage(
// //              the arguments will pass here
//             ));
//         break;
      case AdminServiceDetail.routeName:
//        /admin/service/detail
        return MaterialPageRoute(
            builder: (context) => AdminServiceDetail(
//              the arguments will pass here
            ));
        break;
      case AdminServiceCreate.routeName:
//        /admin/service/create
        return MaterialPageRoute(
            builder: (context) => AdminServiceCreate(
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
      case AdminTechnicianMainPage.routeName:
//        /admin/technician
        return MaterialPageRoute(
            builder: (context) => AdminTechnicianMainPage(
//              the arguments will pass here
            ));
        break;
      case AdminTechnicianDetail.routeName:
//        /admin/technician/detail
        return MaterialPageRoute(
            builder: (context) => AdminTechnicianDetail(
//              the arguments will pass here
            ));
        break;
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
        return MaterialPageRoute(
            builder: (context) => UserServiceDetail(
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
//  Login in admin object
}

class JobArguments {
  final Job job;
  final bool edit;
  JobArguments({this.job, this.edit});
}
