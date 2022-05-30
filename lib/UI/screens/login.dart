import 'package:clonenetflix/UI/screens/home_screen.dart';
import 'package:clonenetflix/UI/widgets/bg.dart';
import 'package:clonenetflix/UI/widgets/button.dart';
import 'package:clonenetflix/UI/widgets/or.dart';
import 'package:clonenetflix/UI/widgets/textfield.dart';
import 'package:clonenetflix/configs/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Bg(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Image.asset(
                "assets/images/Logo2.png",
                width: 250,
              ),
              SizedBox(height: 25),
              Text(
                "Login",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 25),
              NTextField(
                label: "Email",
                hint: "Email address",
              ),
              SizedBox(height: 17),
              NTextField(
                label: "Password",
                hint: "Password",
                isPassword: true,
              ),
              SizedBox(height: 17),
              Row(
                children: [
                  Expanded(
                    child: Row(children: [
                      CupertinoSwitch(
                        thumbColor: Colors.white,
                        trackColor: Config.colors.greyColor,
                        value: rememberMe,
                        onChanged: (value) {
                          rememberMe = value;
                          setState(() {});
                        },
                        activeColor: Config.colors.primaryColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Remember me",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(.46),
                          fontSize: 13,
                        ),
                      )
                    ]),
                  ),
                  Text(
                    "forgot password?",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withOpacity(.46),
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              SizedBox(height: 17),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NButton(
                    title: "Login",
                    onPressed: () {
                      Config.navigate(context, HomeScreen());
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              Or(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/a.png"),
                  Image.asset("assets/images/f.png"),
                  Image.asset("assets/images/g.png"),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
