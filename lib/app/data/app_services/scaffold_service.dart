import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestao_usuario/app/data/app_services/locator_service.dart';
import 'package:gestao_usuario/app/data/app_services/navigation_service.dart';

class ScaffoldService {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void openDrawer() {
    return _scaffoldKey.currentState.openDrawer();
  }

  void showSnackBar(SnackBar snackbar) {
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  void showSnackBarInContext(SnackBar snackbar) {
    Scaffold.of(locator<NavigationService>().context).showSnackBar(snackbar);
  }
}
