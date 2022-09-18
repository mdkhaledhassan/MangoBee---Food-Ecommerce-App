import 'package:flutter/material.dart';
import 'package:MangoBee/models/auth_model.dart';
import 'package:MangoBee/screen/signin_screen.dart';
import 'package:MangoBee/widgets/text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    namecontroller.dispose();
    phonecontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff3f5f7),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        blur: 1,
        progressIndicator: CircularProgressIndicator(),
        child: Center(
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
                          return "Please Enter Your Name";
                        }

                        return null;
                      },
                      keyboardType: TextInputType.name,
                      controller: namecontroller,
                      labelText: "Enter Your Name",
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 10,
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
                      height: 10,
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Your Phone Number.";
                        }
                        if (value.length < 11) {
                          return "Phone Number is not correct.";
                        }
                        if (value.length > 11) {
                          return "Phone Number is not correct.";
                        }

                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: phonecontroller,
                      labelText: "Enter Your Phone Number",
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formkey.currentState!.validate()) {
                          var e = emailcontroller.text;
                          var p = passwordcontroller.text;
                          var n = namecontroller.text;
                          var pn = phonecontroller.text;
                          var obj = Auth().signUp(e, p, n, pn, context);
                          setState(() {
                            isLoading = true;
                          });
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
                            "Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an Account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInScreen(),
                                  ));
                            },
                            child: const Text("Sign In.")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
