import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/core/provider/customer_model_provider.dart';
import 'package:lilac/features/auth/view/login_screen.dart';
import 'package:lilac/features/messages/view/contact_users_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

@override
void initState() {
  super.initState(); // always call this first

  WidgetsBinding.instance.addPostFrameCallback((_) async {
           final prefs = await SharedPreferences.getInstance();

    Future.delayed(Duration(seconds: 1),() {
      // prefs.remove("isLoggedIn");
    final isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    final userId = prefs.getString("userId");

    ref.read(userIdProvider.notifier).update((state) => userId,);

    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => ContactUsersScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
    },);
   
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image(image:  AssetImage("lib/assets/images/logo.png"),)),
      
    );
  }
}