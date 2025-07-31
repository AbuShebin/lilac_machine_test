import 'package:flutter/material.dart';
import 'package:lilac/core/utils/theme/theme.dart';
import 'package:lilac/core/widgets/CustomFloatingButton.dart';
import 'package:lilac/features/auth/presentation/phone_number_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('lib/assets/images/lilac_bg.png', fit: BoxFit.cover)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("lib/assets/images/logo.png",height: h*0.06,),
                Text("Connect. Meet. Love.\n With Fliq Dating",style: TextStyle(
                  color: Colors.white,
                  fontSize: h*0.03,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,),
                SizedBox(height: h*0.3,),
              Column(
                children: [
                
                  Padding(
                    padding:  EdgeInsets.only(left:  w*0.05,right: w*0.05,top: w*0.03),
                    child: CustomFloatingButton(text: "Goolgle sign in", onPressed: () {},buttonColor: Palette.backgroundColor,textColor: Colors.black,image: "lib/assets/images/google.png",),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left:  w*0.05,right: w*0.05,top: w*0.03),
                    child: CustomFloatingButton(text: "Sign in with facebook", onPressed: () {},buttonColor: Palette.facebookButtonColor,textColor: Colors.white,image: "lib/assets/images/facebook.png",),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left:  w*0.05,right: w*0.05,top: w*0.03),
                    child: CustomFloatingButton(text: "Sign in with Phone number", onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhoneNumberScreen(),));
                    },buttonColor: Palette.signInwithPhoneNumberColor,textColor: Colors.white,image: "lib/assets/images/phone.png",),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left:  w*0.05,right: w*0.05,top: w*0.03),
                    child:Text.rich(
                TextSpan(
                  text: 'By signing up, you agree to our ',
                  children: [
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: Colors.white),
                    ),
                    TextSpan(text: '. See how we\nuse your data in our '),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: Colors.white),
                    ),
                  ],
                  
                ),
                textAlign: TextAlign.center,
              style: TextStyle(color: Palette.backgroundColor),
              )
              
              )],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
