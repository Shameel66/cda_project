import 'package:cda_project/screens/landind_page/landing_page.dart';
import 'package:cda_project/screens/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';
import '../../utils/images.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Dimensions.sizedBox50 * 2,
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Image(
                        image: AssetImage(Images.logo),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.sizedBox50),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.padding20),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.sizedBox20,
                  ),
                  CustomTextField(
                      obscureText: false,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Email",
                      preffixIcon: Icon(Icons.email)),
                  SizedBox(
                    height: Dimensions.sizedBox30,
                  ),
                  CustomTextField(
                    obscureText: true,
                    controller: _passwordController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Password",
                    preffixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                  SizedBox(
                    height: Dimensions.sizedBox30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.sizedBox30,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(()=>LandingPage());
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal:Dimensions.padding30),
                        padding: EdgeInsets.all(Dimensions.padding10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                                colors: [Colors.blueAccent, Colors.black12],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Center(
                            child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
