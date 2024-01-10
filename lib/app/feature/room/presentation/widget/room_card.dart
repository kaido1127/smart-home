import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/feature/room/domain/room_entity.dart';
import 'package:smart_home/app/feature/room/enum/room_type.dart';
import 'package:smart_home/app/feature/room/presentation/controller/room_controller.dart';

class RoomCard extends ConsumerStatefulWidget {
  final RoomEntity roomEntity;
  const RoomCard({super.key, required this.roomEntity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoomCardState();
}

class _RoomCardState extends ConsumerState<RoomCard> {
  final white70TextStyle = const TextStyle(
      color: Colors.white70, fontSize: 17, fontWeight: FontWeight.bold);
  final whiteTextStyle = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final RoomType roomType = widget.roomEntity.roomType;

    return InkWell(
      onLongPress: () => showRemoveRoomDialog(),
      child: Card(
        color: getColorFromRoomType(roomType),
        elevation: 5,
        child: SizedBox(
          //height: contextSize.height * 0.2,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: contextSize.width * 0.2,
                    height: contextSize.width * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Icon(
                        getIconFromRoomType(roomType),
                        color: getColorFromRoomType(roomType),
                        size: 40,
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListTile(
                    title: Text(
                      widget.roomEntity.roomName,
                      style: whiteTextStyle,
                    ),
                    subtitle: Text(
                      getRoomTypeName(roomType),
                      style: white70TextStyle,
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tổng thiết bị',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.roomEntity.deviceCount.toString(),
                    style: white70TextStyle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thiết bị đang hoạt động',
                    style: whiteTextStyle,
                  ),
                  Text(
                    widget.roomEntity.runningDeviceCount.toString(),
                    style: whiteTextStyle,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  showRemoveRoomDialog() {
    showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            title: Text('Bạn có muốn xóa ${widget.roomEntity.roomName} ?'),
            actions: [
              TextButton(
                  onPressed: () => context.pop(), child: const Text('Hủy')),
              TextButton(
                  onPressed: () {
                    ref
                        .read(roomControllerProvider(widget.roomEntity.homeId)
                            .notifier)
                        .removeRoom(
                            homeId: widget.roomEntity.homeId,
                            roomId: widget.roomEntity.createAt.toString());
                    context.pop();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Xóa',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          );
        });
  }
}
