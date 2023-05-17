import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_rent_app/res/common/app_textfield.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'admin_page/admin_screen.dart';
import 'home_n_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? userCradential;
  loginUser() async {
    if (emailController.text == 'chiragsarvaiya3855@gmail.com' && passwordController.text == 'user.21') {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const AdminScreen(),
        ),
      );
    } else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) {
          userCradential = value.user;
          debugPrint('user Data -----> ${value.user}');
          userCradential = value.user;
          value.user!.sendEmailVerification();

          if (value.user!.emailVerified) {
            userCradential = value.user;
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(' User has been Login')));
            return false;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(' First U Verified Your email ')));
            value.user!.sendEmailVerification();
            return false;
          }
        });
      } on FirebaseAuthException catch (error) {
        debugPrint('code ---> ${error.code}');
        if (error.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Login ok'),
            dismissDirection: DismissDirection.horizontal,
          ));
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const HomeScreen(),
              ));
          return false;
        } else if (error.code == 'invalid-email') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('invalid email')));
          return false;
        } else if (error.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password should be at least 6 characters')));
          return false;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.code)));
          debugPrint('message ---> ${error.message}');
        }
      }
    }
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xFFC0BCBC),
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Sign in',
                    style: TextStyle(
                      fontFamily: "MAK",
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Please enter your login credentials below',
                    style: TextStyle(
                      fontFamily: "Mulish",
                      fontSize: 14,
                      color: Color(0xFF565656),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  AppTextField(
                    controller: emailController,
                    labelText: 'Email',
                    validator: (email) {
                      if (RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email!)) {
                        return "";
                      } else {
                        return "Please Enter Valid Email";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    controller: passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    labelText: 'Password',
                    validator: (email) {
                      if (RegExp(r'^[a-zA-Z0-9]+\.[0-9]').hasMatch(email!)) {
                        return "";
                      } else {
                        return "Please Enter Valid Password";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 190),
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Color(0xFF525252),
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      formKey.currentState!.validate();
                      loginUser();
                    },
                    child: Container(
                      height: 58,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B2A9D),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Mulish',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          color: Color(0xFFEEEEEE),
                          thickness: 2,
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        'or continue with',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Mulish',
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xFFEEEEEE),
                          thickness: 2,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xFFEEEEEE),
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/image/facebook.png',
                            height: 30,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          signInWithGoogle();
                        },
                        child: Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: const Color(0xFFEEEEEE),
                              )),
                          child: Center(
                            child: Image.asset(
                              'assets/image/google.png',
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xFFEEEEEE),
                            )),
                        child: Center(
                          child: Image.asset(
                            'assets/image/apple.png',
                            height: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: RichText(
                      text: const TextSpan(
                        text: 'Not registered? ',
                        style: TextStyle(
                          fontFamily: 'Mulish',
                          color: Color(0xFF4D4D4D),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Create an account',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              color: Color(0xFF353392),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
