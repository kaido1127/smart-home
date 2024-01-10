import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/app/feature/home/presentation/controller/home_controller.dart';

import '../../../auth/presentation/controller/auth_controller.dart';

class CreateHomeForm extends ConsumerStatefulWidget {
  final String userID;
  const CreateHomeForm({super.key, required this.userID});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateHomeFormState();
}

class _CreateHomeFormState extends ConsumerState<CreateHomeForm> {
  final TextEditingController homeNameTextFieldController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle =
        TextStyle(fontSize: 16.0, color: Colors.black54);
    return Column(
      children: [
        // TextField để nhập tên room
        TextField(
          controller: homeNameTextFieldController,
          decoration: const InputDecoration(
              labelText: 'Tên nhà', labelStyle: labelStyle),
        ),
        const SizedBox(
          height: 35,
        ),

        ref.watch(authControllerProvider).when(
            data: (currentUser) {
              if (currentUser == null) {
                return const Center(
                  child: Text('Lỗi tài khoản'),
                );
              } else {
                return ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                  onPressed: () {
                    final String homeName = homeNameTextFieldController.text;
                    if (homeName.isNotEmpty) {
                      try {
                        ref
                            .read(
                                homeControllerProvider(widget.userID).notifier)
                            .createHome(homeName: homeName);
                      } on Exception catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                      context.pop();
                    }
                  },
                  icon: const Icon(
                    Icons.voice_chat,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Thêm nhà mới',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            },
            error: (e, st) => Center(
                  child: Text(e.toString()),
                ),
            loading: () => const CircularProgressIndicator())
      ],
    );
  }
}
