import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ozb_cli/components/custom_button.dart';
import 'package:ozb_cli/components/textfield_custom.dart';
import 'package:ozb_cli/login/login_screen.dart';
import 'package:ozb_cli/utils/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  const Text(
                    textAlign: TextAlign.center,
                    'Ozb Shop',
                    style: TextStyle(
                      fontSize: 36,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const Row(
              children: [
                Text(
                  'New Account',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            TextfieldCustom(
                controller: _nameController,
                label: 'Full Name',
                obscure: false),
            const SizedBox(height: 16.0),
            TextfieldCustom(
                controller: _emailController, label: 'Email', obscure: false),
            const SizedBox(height: 16.0),
            TextfieldCustom(
                controller: _passwordController,
                label: 'Password',
                obscure: true),
            const SizedBox(height: 16.0),
            const Spacer(),
            CustomButton(text: 'Register', function: _signUp),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: const TextStyle(color: AppColors.grey, fontSize: 18),
                children: [
                  TextSpan(
                    text: 'Login',
                    style: const TextStyle(
                      color: AppColors.modalColor,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    setState(() {
      _errorMessage = null;
    });

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': _nameController.text.trim(),
      });

      print('User Successfully Registered: ${userCredential.user?.email}');
      _showSuccessDialog();
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
      print('register Error: ${e.message}');
      _showErrorDialog(_errorMessage!);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Register Error'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('User successfully registered.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
