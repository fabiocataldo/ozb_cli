import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ozb_cli/utils/constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _resetPassword() async {
      String email = _emailController.text.trim();

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Reset de Senha'),
              content: const Text(
                  'Um e-mail de redefinição de senha foi enviado para o seu endereço de e-mail.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Fechar'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        print('Erro ao enviar e-mail de redefinição de senha: $e');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erro'),
              content: const Text(
                  'Ocorreu um erro ao enviar o e-mail de redefinição de senha. Por favor, tente novamente.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Fechar'),
                ),
              ],
            );
          },
        );
      }
    }

    return const Text(
      'Forgot Password?',
      style: TextStyle(
        fontSize: 18,
        color: AppColors.modalColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
