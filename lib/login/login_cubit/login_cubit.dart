import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quicklab/firebase_function.dart';

import '../../helpers/hive_helper.dart';
import '../../user_profile/profile_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  login() async {
    emit(LoginLoading());
    var response = await FirebaseFunction.signIn(
        emailController.text, passwordController.text);
    response.fold((error) => (emit(LoginFailure(error))), (user) {
      HiveHelper.setId(user?.user!.uid ?? "");
      emit(LoginSuccessful(result: user, isEmail: true));
    });
  }

  signInWithGoogle() async {
    emit(LoginLoading());
    var response = await FirebaseFunction.signInWithGoogle();
    response.fold((error) => emit(LoginFailure(error)), (user) {
      emit(LoginSuccessful(result: user.user!.uid, isEmail: false));
      HiveHelper.setId(user.user!.uid);
    });
  }

  signInWithFaceBook() async {
    emit(LoginLoading());
    var response = await FirebaseFunction.signInWithFacebook();
    response.fold((error) => emit(LoginFailure(error)), (user) {
      emit(LoginSuccessful(result: user.user!.uid, isEmail: false));
      HiveHelper.setId(user.user!.uid);
    });
  }

  Future<bool> fetchUserProfile() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(HiveHelper.getId())
          .get();
      if (userDoc.exists) {
        return userDoc.get("check");
      } else {
        return false;
      }
    } catch (e) {
      return false ;
    }
  }
}
