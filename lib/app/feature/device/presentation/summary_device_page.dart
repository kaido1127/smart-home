import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/feature/device/domain/device_entity.dart';
import 'package:smart_home/app/feature/device/presentation/controller/device_controller.dart';
import 'package:smart_home/app/feature/device/presentation/widget/create_device_form.dart';
import 'package:smart_home/app/feature/device/presentation/widget/device_card/bulbs_card.dart';
import 'package:smart_home/app/feature/device/presentation/widget/device_card/fan_card.dart';
import 'package:smart_home/app/feature/room/domain/room_entity.dart';
import 'package:smart_home/app/feature/room/enum/room_type.dart';
import 'package:smart_home/app/feature/room/presentation/widget/room_card.dart';
import 'package:smart_home/app/shared/widget/empty_widget.dart';

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
                onPressed: () => _showCreateDeviceBottomSheet(roomId: roomId),
                icon: const CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )),
            IconButton(
                onPressed: () =>
                    showRemoveRoomDialog(context, widget.roomEntity, ref),
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
          child: ref.watch(deviceControllerProvider(roomId)).when(
              data: (listDevice) {
                return listDevice.isEmpty
                    ? EmptyWidget()
                    : ListView.builder(
                        itemCount: listDevice.length,
                        itemBuilder: (BuildContext context, int index) {
                          final DeviceEntity deviceEntity = listDevice[index];
                          return switch (listDevice[index]) {
                            BulbsEntity() => BulbsCard(
                                bulbsEntity: deviceEntity as BulbsEntity),
                            TvEntity() => Container(
                                color: Colors.green,
                              ),
                            DoorEntity() => Container(
                                color: Colors.green,
                              ),
                            FanEntity() =>
                              FanCard(fanEntity: deviceEntity as FanEntity),
                          };
                        },
                      );
              },
              error: (error, stackTrace) => Center(
                    child: Text(error.toString()),
                  ),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  )),
        ));
  }

  _showCreateDeviceBottomSheet({required String roomId}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: contextSize.height * 0.3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CreateDeviceForm(roomId: roomId),
              ),
            ),
          );
        });
  }
}
