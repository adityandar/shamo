import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/widgets/loading_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController usernameController = TextEditingController(text: '');

  TextEditingController emailController = TextEditingController(text: '');

  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              'Register failed!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Register and Happy Shoping',
              style: subtitleTextStyle,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon_name.png",
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                      controller: nameController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintStyle: subtitleTextStyle,
                        hintText: "Your Full Name",
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon_username.png",
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                      controller: usernameController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintStyle: subtitleTextStyle,
                        hintText: "Your Username",
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon_email.png",
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                      controller: emailController,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintStyle: subtitleTextStyle,
                        hintText: "Your Email Address",
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icon_password.png",
                      width: 17,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                        child: TextFormField(
                      controller: passwordController,
                      style: primaryTextStyle,
                      obscureText: true,
                      decoration: InputDecoration.collapsed(
                        hintStyle: subtitleTextStyle,
                        hintText: "Your Password",
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          child: Text(
            'Sign Up',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          onPressed: handleSignUp,
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              style: subtitleTextStyle.copyWith(fontSize: 12),
            ),
            GestureDetector(
              child: Text(
                'Sign In',
                style: purpleTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(),
                    nameInput(),
                    usernameInput(),
                    emailInput(),
                    passwordInput(),
                    (isLoading) ? LoadingButton() : signUpButton(), //signUpButton(),
                    SizedBox(height: 5),
                    Spacer(),
                    footer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
