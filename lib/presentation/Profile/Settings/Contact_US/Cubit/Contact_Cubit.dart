import 'package:flutter_application_2/application/EndPoints.dart';
import 'package:flutter_application_2/application/dio_helper.dart';
import 'package:flutter_application_2/components/component.dart';
import 'package:flutter_application_2/presentation/Profile/Settings/Contact_US/Cubit/Contact_States.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactCubit extends Cubit<ContactStates> {
  ContactCubit() : super(ContactInitialState());
  static ContactCubit get(context) => BlocProvider.of(context);
  void ContactUs({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    emit(ContactLoadingState());
    await DioHelper.postData(url: CONTACTUS, data: {
      "name": name,
      "email": email,
      "subject": subject,
      "message": message,
    }).then((value) {
      print(value.data);
      showToast(text: "تم ارسال الرساله بنجاح ", state: ToastStates.SUCCESS);

      emit(ContactSuccessState());
    }).catchError((error) {
      print(error);
      showToast(
          text: "برجاء التأكد من صيغه البريد الالكترونى  ",
          state: ToastStates.ERROR);

      // print(passwordModel?.message);
      emit(ContactErrorState(error.toString()));
    });
  }
}
