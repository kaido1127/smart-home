import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/shared/string_common.dart';

late Size deviceSize;

class SplashPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 4000), () async {
      contextSize = MediaQuery.of(context).size;
      context.go('/login_page');
    });
  }

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
              bottom: contextSize.height * 0.1,
              width: contextSize.width,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your home in your hands',
                    style: TextStyle(
                        color: Colors.black, fontSize: 16, letterSpacing: 0.5),
                    textAlign: TextAlign.center,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.green,
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
