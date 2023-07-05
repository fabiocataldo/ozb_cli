import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ozb_cli/components/cart_notification.dart';
import 'package:ozb_cli/login/login_stream_check.dart';
import 'package:ozb_cli/view_models/product_view_model.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => CartNotifier()),
      ],
      child: MaterialApp(
        title: 'Ozb Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginCheck(),
      ),
    );
  }
}
