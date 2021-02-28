import 'package:flutter/material.dart';
import 'Features/Service/Service.dart';
import 'Role/role.dart';


class ServiceAppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch(settings.name){
      case '/':
//        /
//        do the initial route here
        break;
      case AdminMainPage.routeName:
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
//        /admin/job/detail
        return MaterialPageRoute(
            builder: (context) => AdminJobDetail(
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
        break;
      case UserJobMain.routeName:
//        /user/job
      break;
      case UserJobDetail.routeName:
//        /user/job/detail
        break;
      case UserCreateJob.routeName:
//        /user/job/create
        break;
      case UserCategoryMain.routeName:
//        /user/category
        break;
      case UserServiceMain.routeName:
//        /user/category/service
        break;
      case UserServiceDetail.routeName:
//        /user/category/service/detail
        break;
      case '/technician/request':
//        /technician
        break;
      case '/technician/request/detail':
//        /technician
        break;




    }




    if (settings.name == '/') {
//      initial route
//      return MaterialPageRoute(builder: (context) => CategoryMainScreen());

    }

    if (settings.name == AddUpdateService.routeName) {
      ServiceArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddUpdateService(
            args: args,
          ));
    }

    if (settings.name == ServiceDetail.routeName) {
      Service service = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => ServiceDetail(
            service: service,
          ));
    }

    return MaterialPageRoute(builder: (context) => CategoryMainScreen());
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
