import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTopIcon(),
              SizedBox(height: 50.h),
              _buildLoginTitle(),
              SizedBox(height: 30.h),
              _buildEmailTextField(),
              SizedBox(height: 20.h),
              _buildPasswordTextField(),
              SizedBox(height: 10.h),
              _buildForgotPasswordButton(),
              SizedBox(height: 20.h),
              _buildLoginButton(),
              SizedBox(height: 30.h),
              _buildOrLoginWith(),
              SizedBox(height: 40.h),
              _buildSocialLoginButtons(),
              SizedBox(height: 50.h),
              _buildSignUpText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopIcon() {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Image.asset(
            'assets/images/lap.png',
            height: 100.h,
          ),
          Text(
            'QuickLap',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginTitle() {
    return Column(
      children: [
        Text(
          'Log In',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          'Use your credentials and login to your account',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter your email',
        filled: true,
        fillColor: const Color(0xFFF3F5F7),
        prefixIcon: const Icon(Icons.email, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Enter your password',
        filled: true,
        fillColor: const Color(0xFFF3F5F7),
        prefixIcon: const Icon(Icons.lock, color: Colors.grey),
        suffixIcon: const Icon(Icons.visibility, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6C5DD3),
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 120.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Text(
        'Log In',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildOrLoginWith() {
    return Text(
      'Or Log in with',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14.sp,
      ),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildSocialBtn('assets/images/apple.png'), // Apple Icon
        _buildSocialBtn('assets/images/facebook.png'), // Facebook Icon
        _buildSocialBtn('assets/images/google.png'), // Google Icon
      ],
    );
  }

  Widget _buildSignUpText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('If you are new', style: TextStyle(fontSize: 14.sp)),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup'); // Navigate to Sign Up Page
          },
          child: Text(
            'Create New Account',
            style: TextStyle(fontSize: 14.sp, color: const Color(0xFF9B51E0)),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialBtn(String imagePath) {
    return GestureDetector(
      onTap: () {
        print('Social button pressed');
      },
      child: Container(
        height: 60.h,
        width: 60.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            height: 30.h,
            width: 30.h,
          ),
        ),
      ),
    );
  }
}