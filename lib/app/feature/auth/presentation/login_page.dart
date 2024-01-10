import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/feature/auth/presentation/widget/login_button_widget.dart';
import 'package:smart_home/app/feature/shared/string_common.dart';

import 'controller/auth_controller.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Stack(
        children: [
          //Center(child:Image.asset('images/logo.jpg') ,),
          Positioned(
            top: contextSize.height * 0.20,
            right: contextSize.width * 0.35,
            child: SizedBox(
              width: contextSize.width * 0.3,
              child: const Center(
                child: Text(
                  'Smart Home',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
              top: contextSize.height * 0.30,
              right: contextSize.width * 0.15,
              width: contextSize.width * 0.7,
              child: Lottie.asset(StringAsset.splashImage)),
          Positioned(
            height: contextSize.height * 0.07,
            bottom: contextSize.height * 0.12,
            left: contextSize.width * 0.05,
            width: contextSize.width * 0.9,
            child: const LoginButtonWidget(),
          ),
          // Positioned(
          //     child: ref.watch(authControllerProvider).when(
          //         data: (user) => (user != null)
          //             ? ElevatedButton.icon(
          //                 onPressed: () => ref
          //                     .read(authControllerProvider.notifier)
          //                     .logout(),
          //                 icon: const Icon(Icons.logout),
          //                 label: const Text('Logout'),
          //               )
          //             : const SizedBox(height: 1,width: 1),
          //         error: (e, st) => const SizedBox(),
          //         loading: () => const SizedBox()))
        ],
      ),
    ));
  }
}
