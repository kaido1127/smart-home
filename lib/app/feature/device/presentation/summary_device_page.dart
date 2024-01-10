import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/app/feature/room/domain/room_entity.dart';
import 'package:smart_home/app/feature/room/enum/room_type.dart';

class SummaryDevicePage extends ConsumerStatefulWidget {
  final RoomEntity roomEntity;
  const SummaryDevicePage({super.key, required this.roomEntity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SummaryDevicePageState();
}

class _SummaryDevicePageState extends ConsumerState<SummaryDevicePage> {
  @override
  Widget build(BuildContext context) {
    final String roomId = widget.roomEntity.createAt.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getColorFromRoomType(widget.roomEntity.roomType),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.roomEntity.roomName,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )),
          IconButton(
              onPressed: () {
                // ref
                //     .read(homeControllerProvider(widget.homeEntity.hostId)
                //         .notifier)
                //     .removeHome(homeId: widget.homeEntity.createAt.toString());
                // context.pop();
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
          padding: const EdgeInsets.only(left: 20, right: 20), child: SizedBox()
          // ref.watch(roomControllerProvider(homeId)).when(
          //     data: (listRoom) {
          //       return listRoom.isEmpty
          //           ? EmptyWidget()
          //           : ListView.builder(
          //               itemCount: listRoom.length,
          //               itemBuilder: (BuildContext context, int index) {
          //                 return RoomCard(roomEntity: listRoom[index]);
          //               },
          //             );
          //     },
          //     error: (error, stackTrace) => Center(
          //           child: Text(error.toString()),
          //         ),
          //     loading: () => const Center(
          //           child: CircularProgressIndicator(),
          //         )),
          ),
    );
  }

  // _showCreateRoomBottomSheet({required String homeId}) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: SizedBox(
  //             height: contextSize.height * 0.3,
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: CreateRoomForm(homeId: homeId),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
