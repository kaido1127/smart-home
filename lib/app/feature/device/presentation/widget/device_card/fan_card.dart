import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/feature/device/domain/device_entity.dart';
import 'package:smart_home/app/feature/device/presentation/controller/device_controller.dart';

final fanSpeedLevelStateProvider = StateProvider.autoDispose
    .family<double, FanEntity>((ref, fan) => fan.speedLv);
final isActiveStateProvider = StateProvider.autoDispose
    .family<bool, FanEntity>((ref, fan) => fan.isActive);

class FanCard extends ConsumerStatefulWidget {
  final FanEntity fanEntity;
  const FanCard({super.key, required this.fanEntity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FanCardState();
}

class _FanCardState extends ConsumerState<FanCard> {
  final white70TextStyle = const TextStyle(
      color: Colors.white70, fontSize: 17, fontWeight: FontWeight.bold);
  final whiteTextStyle = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final double brightnessLv =
        ref.watch(fanSpeedLevelStateProvider(widget.fanEntity));
    final Color themeColor = Colors.blue.withOpacity(brightnessLv);
    return Card(
      elevation: 5,
      color: ref.watch(isActiveStateProvider(widget.fanEntity))
          ? themeColor
          : Colors.grey,
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
                      Icons.wind_power_rounded,
                      color: Colors.blue,
                      size: 40,
                    )),
                  ),
                  Expanded(
                      child: ListTile(
                    title: Text(
                      widget.fanEntity.deviceName,
                      style: whiteTextStyle,
                    ),
                    subtitle: Text(
                      'Quạt',
                      style: white70TextStyle,
                    ),
                  )),
                  Switch(
                      value: ref.watch(isActiveStateProvider(widget.fanEntity)),
                      onChanged: (value) {
                        ref
                            .read(isActiveStateProvider(widget.fanEntity)
                                .notifier)
                            .state = value;
                        ref
                            .read(fanSpeedLevelStateProvider(widget.fanEntity)
                                .notifier)
                            .state = (value) ? 0.7 : 0;
                        ref
                            .read(deviceControllerProvider(
                                    widget.fanEntity.roomId)
                                .notifier)
                            .updateDevice(
                                deviceEntity: widget.fanEntity.copyWith(
                                    isActive: value,
                                    speedLv: (value) ? 0.7 : 0));
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
                    'Tốc độ:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  ToggleButtons(
                    isSelected: [
                      ref.watch(fanSpeedLevelStateProvider(widget.fanEntity)) ==
                          0,
                      ref.watch(fanSpeedLevelStateProvider(widget.fanEntity)) ==
                          0.3,
                      ref.watch(fanSpeedLevelStateProvider(widget.fanEntity)) ==
                          0.7,
                      ref.watch(fanSpeedLevelStateProvider(widget.fanEntity)) ==
                          1,
                    ],
                    onPressed: (index) {
                      late double newValue;

                      switch (index) {
                        case 0:
                          newValue = 0;
                        case 1:
                          newValue = 0.3;
                        case 2:
                          newValue = 0.7;
                        case 3:
                          newValue = 1;
                      }

                      ref
                          .read(fanSpeedLevelStateProvider(widget.fanEntity)
                              .notifier)
                          .state = newValue;

                      ref
                          .read(
                              deviceControllerProvider(widget.fanEntity.roomId)
                                  .notifier)
                          .updateDevice(
                              deviceEntity: widget.fanEntity.copyWith(
                                  isActive: (index != 0), speedLv: newValue));
                    },
                    children: const [
                      Text(
                        "Tắt",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "1",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "3",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
