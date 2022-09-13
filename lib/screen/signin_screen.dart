import 'package:flutter/material.dart';
import 'package:MangoMee/models/auth_model.dart';
import 'package:MangoMee/screen/signup_screen.dart';
import 'package:MangoMee/widgets/text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff3f5f7),
      body: Center(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Icon.png",
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width / 0.15,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Your Email";
                        }
                        if (!value.contains("@")) {
                          return "Invalid Email";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      labelText: "Enter Your Email",
                      obscureText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Password";
                      }
                      if (value.length < 3) {
                        return "Password is too short";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordcontroller,
                    labelText: "Enter Your Password",
                    obscureText: true,
                    isSuffix: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        var e = emailcontroller.text;
                        var p = passwordcontroller.text;

                        var obj = Auth().signIn(e, p, context);
                      } else {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return Text('Error');
                          },
                        );
                      }
                    },
                    child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(40)),
                        child: const Center(
                            child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Doesn't have an Account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ));
                          },
                          child: const Text("Sign up.")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
