import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/feature/device/domain/device_entity.dart';
import 'package:smart_home/app/feature/device/presentation/controller/device_controller.dart';

// final brightnessLevelStateProvider = StateProvider.autoDispose
//     .family<double, DoorEntity>((ref, door) => door.pauseLv);
// final isActiveStateProvider = StateProvider.autoDispose
//     .family<bool, DoorEntity>((ref, door) => door.isActive);

class DoorCard extends ConsumerStatefulWidget {
  final DoorEntity doorEntity;
  const DoorCard({super.key, required this.doorEntity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoorCardState();
}

class _DoorCardState extends ConsumerState<DoorCard> {
  final white70TextStyle = const TextStyle(
      color: Colors.white70, fontSize: 17, fontWeight: FontWeight.bold);
  final whiteTextStyle = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final bool isActive = widget.doorEntity.isActive;
    final bool isOpen = widget.doorEntity.isOpen;
    final bool? isPause = widget.doorEntity.isPause;
    return Card(
      elevation: 5,
      color: isActive ? Colors.brown : Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
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
                    child: const Center(
                      child: Icon(
                        Icons.door_back_door_outlined,
                        color: Colors.brown,
                        size: 40,
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListTile(
                    title: Text(
                      widget.doorEntity.deviceName,
                      style: whiteTextStyle,
                    ),
                    subtitle: Text(
                      'Cửa',
                      style: white70TextStyle,
                    ),
                  )),
                  Switch(
                      value: isActive,
                      onChanged: (value) {
                        ref
                            .read(deviceControllerProvider(
                                    widget.doorEntity.roomId)
                                .notifier)
                            .updateDevice(
                                deviceEntity: widget.doorEntity
                                    .copyWith(isActive: value, isPause: null));
                      })
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Điều khiển:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () async {
                        if (isPause == null) {
                          ref
                              .read(deviceControllerProvider(
                                      widget.doorEntity.roomId)
                                  .notifier)
                              .updateDevice(
                                  deviceEntity: widget.doorEntity
                                      .copyWith(isPause: false));

                          await Future.delayed(const Duration(seconds: 10));
                          ref
                              .read(deviceControllerProvider(
                                      widget.doorEntity.roomId)
                                  .notifier)
                              .updateDevice(
                                  deviceEntity: widget.doorEntity.copyWith(
                                      isOpen: !isOpen, isPause: null));
                        } else {
                          ref
                              .read(deviceControllerProvider(
                                      widget.doorEntity.roomId)
                                  .notifier)
                              .updateDevice(
                                  deviceEntity: widget.doorEntity
                                      .copyWith(isPause: null));
                          return;
                        }
                      },
                      icon: CircleAvatar(
                          child: Icon((isPause == null)
                              ? ((isOpen)
                                  ? Icons.play_disabled
                                  : Icons.play_arrow)
                              : Icons.pause)))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
