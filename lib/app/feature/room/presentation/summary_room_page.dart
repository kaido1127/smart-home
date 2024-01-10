import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/feature/home/domain/home_entity.dart';
import 'package:smart_home/app/feature/home/presentation/controller/home_controller.dart';
import 'package:smart_home/app/feature/room/presentation/controller/room_controller.dart';
import 'package:smart_home/app/feature/room/presentation/widget/create_room_form.dart';
import 'package:smart_home/app/feature/room/presentation/widget/room_card.dart';
import 'package:smart_home/app/shared/widget/empty_widget.dart';

class SummaryRoomPage extends ConsumerStatefulWidget {
  final HomeEntity homeEntity;
  const SummaryRoomPage({super.key, required this.homeEntity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SummaryRoomPageState();
}

class _SummaryRoomPageState extends ConsumerState<SummaryRoomPage> {
  @override
  Widget build(BuildContext context) {
    final String homeId = widget.homeEntity.createAt.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.homeEntity.homeName),
        actions: [
          IconButton(
              onPressed: () => _showCreateRoomBottomSheet(homeId: homeId),
              icon: const CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )),
          IconButton(
              onPressed: () {
                ref
                    .read(homeControllerProvider(widget.homeEntity.hostId)
                        .notifier)
                    .removeHome(homeId: widget.homeEntity.createAt.toString());
                context.pop();
              },
              icon: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ref.watch(roomControllerProvider(homeId)).when(
            data: (listRoom) {
              return listRoom.isEmpty
                  ? EmptyWidget()
                  : ListView.builder(
                      itemCount: listRoom.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RoomCard(roomEntity: listRoom[index]);
                      },
                    );
            },
            error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }

  _showCreateRoomBottomSheet({required String homeId}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: contextSize.height * 0.3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CreateRoomForm(homeId: homeId),
              ),
            ),
          );
        });
  }
}
