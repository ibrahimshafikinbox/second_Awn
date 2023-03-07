import 'package:flutter_application_2/application/Local/shared_pref.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_application_2/presentation/USER/Login/login_view.dart';

void signOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      navigateAndFinish(context, LoginView());
    }
  });
}

/**************************************************************** */
void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

/***************************************************************** */
String? token = '';
String? HOMEDATA = "";
