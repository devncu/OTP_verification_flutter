import 'package:OTP_verification/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/home_screen.dart';
import './screens/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTP_Auth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        
      
    ),
    home:StartScreen()
    );

  }
}

class InitializerWidget extends StatefulWidget {
  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {

FirebaseAuth _auth;

User _user;

bool isLoading =true;

@override
  void initState() {
  
    super.initState();
    _auth=FirebaseAuth.instance;
    _user= _auth.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(
      body:Center(child: CircularProgressIndicator(),
      ),
    ) :  _user == null ? LoginScreen() : HomeScreen();
  }
}
