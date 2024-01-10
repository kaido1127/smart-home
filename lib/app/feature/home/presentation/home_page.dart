import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/feature/auth/domain/user_entity.dart';
import 'package:smart_home/app/feature/auth/presentation/controller/auth_controller.dart';
import 'package:smart_home/app/feature/home/presentation/controller/home_controller.dart';
import 'package:smart_home/app/feature/home/presentation/widget/create_home_form.dart';
import 'package:smart_home/app/feature/home/presentation/widget/home_card.dart';
import 'package:smart_home/app/shared/widget/empty_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(authControllerProvider).when(
        data: (currentUser) {
          if (currentUser == null) {
            return const Center(
              child: Text("Lỗi tài khoản"),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Smart home"),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () async {
                        await ref
                            .read(authControllerProvider.notifier)
                            .logout();
                        context.go('/login_page');
                      },
                      icon: const CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () =>
                    _showCreateHomeBottomSheet(userID: currentUser.id),
                icon: const Icon(Icons.add),
                label: const Text("Thêm nhà mới"),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Expanded(
                    child:
                        ref.watch(homeControllerProvider(currentUser.id)).when(
                            data: (listHome) {
                              if (listHome.isNotEmpty) {
                                return ListView.builder(
                                  itemBuilder: ((context, index) =>
                                      HomeCard(listHome[index])),
                                  itemCount: listHome.length,
                                );
                              } else {
                                return EmptyWidget();
                              }
                            },
                            error: (e, st) => Center(
                                  child: Text(e.toString()),
                                ),
                            loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ))),
              ),
            );
          }
        },
        error: (e, st) => Center(
              child: Text(e.toString()),
            ),
        loading: () => const Center(child: CircularProgressIndicator()));
  }

  _showCreateHomeBottomSheet({required String userID}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: contextSize.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CreateHomeForm(
                  userID: userID,
                ),
              ),
            ),
          );
        });
  }
}
