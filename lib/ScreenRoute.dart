import 'package:flutter/material.dart';
import 'package:flutter_group_project/Service/Screen/AddUpdateService.dart';
import 'package:flutter_group_project/Service/Service.dart';

import 'Admin/admin.dart';


class ServiceAppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch(settings.name){
      case '/':
//        do the initial route here
        break;
      case '/user':
        break;
      case '/technician':
        break;
      case AdminMainPage.routeName:
        AdminArgument args = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => AdminMainPage(
//              the arguments will pass here
            ));
        break;
      case '/user/service':
        break;
      case 'user/service/detail':
        break;
      case '/user/service/job':
        break;
      case AdminServiceMainPage.routeName:
        return MaterialPageRoute(
            builder: (context) => AdminServiceMainPage(
//              the arguments will pass here
            ));
        break;
      case AdminServiceDetail.routeName:
        return MaterialPageRoute(
            builder: (context) => AdminServiceDetail(
//              the arguments will pass here
            ));
        break;
      case AdminServiceCreate.routeName:
        return MaterialPageRoute(
            builder: (context) => AdminServiceCreate(
//              the arguments will pass here
            ));
        break;
      case AdminJobMainPage.routeName:
        return MaterialPageRoute(
            builder: (context) => AdminJobMainPage(
//              the arguments will pass here
            ));
        break;
      case AdminJobDetail.routeName:
        return MaterialPageRoute(
            builder: (context) => AdminJobDetail(
//              the arguments will pass here
            ));
        break;
      case AdminTechnicianMainPage.routeName:
        return MaterialPageRoute(
            builder: (context) => AdminTechnicianMainPage(
//              the arguments will pass here
            ));
        break;
      case AdminTechnicianDetail.routeName:
        return MaterialPageRoute(
            builder: (context) => AdminTechnicianDetail(
//              the arguments will pass here
            ));
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
