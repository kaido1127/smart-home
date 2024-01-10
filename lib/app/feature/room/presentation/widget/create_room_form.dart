import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/app/feature/room/enum/room_type.dart';
import 'package:smart_home/app/feature/room/presentation/controller/room_controller.dart';

final selectRoomContentTypeStateProvider =
    StateProvider.autoDispose<RoomType?>((ref) => null);

class CreateRoomForm extends ConsumerStatefulWidget {
  final String homeId;
  const CreateRoomForm({super.key, required this.homeId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateRoomFormState();
}

class _CreateRoomFormState extends ConsumerState<CreateRoomForm> {
  final TextEditingController roomNameTextFieldController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle =
        TextStyle(fontSize: 16.0, color: Colors.black54);
    return Column(
      children: [
        TextField(
          controller: roomNameTextFieldController,
          decoration: const InputDecoration(
              labelText: 'Tên phòng', labelStyle: labelStyle),
        ),
        const SizedBox(
          height: 35,
        ),
        DropdownButton<RoomType>(
          value: ref.watch(selectRoomContentTypeStateProvider),
          onChanged: (value) {
            if (value != null) {
              ref.read(selectRoomContentTypeStateProvider.notifier).state =
                  value;
            }
          },
          items: RoomType.values.map((contentType) {
            return DropdownMenuItem<RoomType>(
              value: contentType,
              child: Text(
                getRoomTypeName(contentType),
                style: const TextStyle(fontSize: 16.0),
              ),
            );
          }).toList(),
          hint: const Text('Chọn loại phòng', style: labelStyle),
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 2,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 1,
            color: Colors.black54,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent,
          ),
          onPressed: () {
            final String roomName = roomNameTextFieldController.text;
            final RoomType? roomType =
                ref.read(selectRoomContentTypeStateProvider);
            if (roomName.isNotEmpty && roomType != null) {
              try {
                ref
                    .read(roomControllerProvider(widget.homeId).notifier)
                    .createRoom(roomName: roomName, roomType: roomType);
              } on Exception catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
              context.pop();
            }
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          label: const Text(
            'Thêm phòng mới',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
