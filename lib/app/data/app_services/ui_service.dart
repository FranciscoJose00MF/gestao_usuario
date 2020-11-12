import 'package:flutter/material.dart';
import 'package:gestao_usuario/app/data/app_services/locator_service.dart';
import 'package:gestao_usuario/app/data/app_services/navigation_service.dart';
import 'package:gestao_usuario/app/utils/color.dart';
import 'package:gestao_usuario/app/widgets/custom_flat_button.dart';

class UIService {
  static NavigationService _navigationService = locator<NavigationService>();

  static showUISuccess(
      {String message: "Operação bem sucedida", String description}) {
    showGeneralDialog(
      context: locator<NavigationService>().context,
      transitionDuration: Duration(milliseconds: 350),
      barrierDismissible: false,
      pageBuilder: (context, _, __) {
        return _UIResponseStatus(
          title: message,
          description: description,
          isError: false,
        );
      },
    );
  }

  static showUIError(
      {String message: "Ocorreu um erro desconhecido. Tente novamente",
      String description,
      Color color}) {
    showGeneralDialog(
      context: locator<NavigationService>().context,
      transitionDuration: Duration(milliseconds: 350),
      barrierDismissible: false,
      pageBuilder: (context, _, __) {
        return _UIResponseStatus(
          title: message,
          description: description,
          isError: true,
        );
      },
    );
  }
}

class _UIResponseStatus extends StatelessWidget {
  _UIResponseStatus({
    this.isError: false,
    @required this.title,
    this.description,
  });

  final bool isError;
  final String title;
  final String description;
  final double iconSize = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (isError)
                ? Icon(
                    Icons.error,
                    color: Colors.red,
                    size: iconSize,
                  )
                : Icon(
                    Icons.check_circle_rounded,
                    color: greenColor,
                    size: iconSize,
                  ),
            const SizedBox(height: 50),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: blackColor,
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: 30),
            Text(
              description ?? "",
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: greyColor6,
                    fontSize: 14,
                  ),
            ),
            const SizedBox(height: 30),
            CustomFlatButton(
              text: "OK",
              width: double.infinity,
              backgroundColor: Colors.white,
              border: Border.all(
                color: greyColor7,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
