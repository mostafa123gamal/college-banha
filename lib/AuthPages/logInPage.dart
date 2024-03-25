import 'package:college_banha_app/AuthPages/SignUpPage.dart';
import 'package:college_banha_app/Cubit/AppCubit.dart';
import 'package:college_banha_app/Cubit/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Screens/HomeScreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool vis = false;

  GlobalKey<FormState> key = GlobalKey();
  bool validateForm() {
    final form = key.currentState;
    return form!.validate() ? true : false;
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is LogInSuccess) {

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) =>const  HomeScreen(),
              ),
                  (route) => false);
        } else if (state is LogInFailure) {
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(state.errorMessage),backgroundColor: Colors.red,));
        } else if (state is LogInLoading) {

        }
      },
  builder: (context, state) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key:key ,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset('assets/image/preview.jpg', width: 150, height: 150), // Replace 'assets/logo.png' with your logo image path
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        mouseCursor: MouseCursor.defer,
                        cursorColor: Colors.black,
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (email) => email!.isEmpty
                            ? "برجاء ادخال البريد الالكتروني"
                            : null,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            labelStyle: const TextStyle(color: Colors.black),

                            labelText: 'البريد الالكتروني',
                            suffixIcon: Icon(Icons.email)),
                      ),

                      const SizedBox(height: 20),
                      TextFormField(

                        mouseCursor: MouseCursor.defer,
                        cursorColor: Colors.black,

                        obscureText: vis,
                        controller: password,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        validator: (password) => password!.isEmpty
                            ? "برجاء ادخال كلمةالسر"
                            : null,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            labelStyle: const TextStyle(color: Colors.black),
                            labelText: 'كلمة السر',
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                vis = !vis;
                              });
                            },icon: vis
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),)),
                      ),


                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {

                          if (validateForm()) {
                            BlocProvider.of<AppCubit>(context)
                                .loginUser(email.text.toString(),
                                password.text.toString());

                          }
                        },
                        style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blue// Set button color to blue
                        ),
                        child: const Text('تسجيل الدخول'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('لا تمتلك حساب؟',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                           const SignUpScreen()));
                              },
                              child:  Text('إنشاء حساب',
                                  style: TextStyle(
                                      color: Colors.blueAccent.shade200,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  },
);
  }

}