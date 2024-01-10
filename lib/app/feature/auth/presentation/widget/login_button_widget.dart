import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/feature/auth/presentation/controller/auth_controller.dart';
import 'package:smart_home/app/feature/shared/string_common.dart';

class LoginButtonWidget extends ConsumerStatefulWidget {
  const LoginButtonWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends ConsumerState<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(authControllerProvider).when(
        data: (user) {
          if (user != null) {
            return ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: const StadiumBorder(),
                  elevation: 1),
              onPressed: () => context.go('/home_page'),
              icon: Image.asset(
                StringAsset.googleLogo,
                height: contextSize.height * 0.06,
              ),
              label: RichText(
                text: TextSpan(style: const TextStyle(fontSize: 18), children: [
                  const TextSpan(text: 'Tiếp tục với '),
                  TextSpan(
                      text: user.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ]),
              ),
            );
          } else {
            return ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: const StadiumBorder(),
                  elevation: 1),
              onPressed: () =>
                  ref.read(authControllerProvider.notifier).login(),
              icon: Image.asset(
                StringAsset.googleLogo,
                height: contextSize.height * 0.06,
              ),
              label: RichText(
                text: const TextSpan(style: TextStyle(fontSize: 18), children: [
                  TextSpan(text: 'Đăng nhập với '),
                  TextSpan(
                      text: 'Google',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ]),
              ),
            );
          }
        },
        error: (e, st) => Center(
              child: Text(e.toString()),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
