import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/feature/device/domain/device_entity.dart';
import 'package:smart_home/app/feature/device/presentation/controller/device_controller.dart';

// final brightnessLevelStateProvider = StateProvider.autoDispose
//     .family<double, BulbsEntity>((ref, bulbs) => bulbs.brightnessLv);
// final isActiveStateProvider = StateProvider.autoDispose
//     .family<bool, BulbsEntity>((ref, bulbs) => bulbs.isActive);

class BulbsCard extends ConsumerStatefulWidget {
  final BulbsEntity bulbsEntity;
  const BulbsCard({super.key, required this.bulbsEntity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BulbsCardState();
}

class _BulbsCardState extends ConsumerState<BulbsCard> {
  final white70TextStyle = const TextStyle(
      color: Colors.white70, fontSize: 17, fontWeight: FontWeight.bold);
  final whiteTextStyle = const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final double brightnessLv = widget.bulbsEntity.brightnessLv;
    final bool isActive = widget.bulbsEntity.isActive;
    final Color themeColor = Colors.yellow.withOpacity(brightnessLv);
    return Card(
      elevation: 5,
      color: isActive ? themeColor : Colors.grey,
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
                    child: Center(
                      child: (brightnessLv > 0.35)
                          ? const Icon(
                              Icons.light_mode,
                              color: Colors.yellow,
                              size: 40,
                            )
                          : const Icon(
                              Icons.nightlight,
                              color: Colors.grey,
                              size: 40,
                            ),
                    ),
                  ),
                  Expanded(
                      child: ListTile(
                    title: Text(
                      widget.bulbsEntity.deviceName,
                      style: whiteTextStyle,
                    ),
                    subtitle: Text(
                      'Bóng đèn',
                      style: white70TextStyle,
                    ),
                  )),
                  Switch(
                      value: isActive,
                      onChanged: (value) {
                        ref
                            .read(deviceControllerProvider(
                                    widget.bulbsEntity.roomId)
                                .notifier)
                            .updateDevice(
                                deviceEntity: widget.bulbsEntity.copyWith(
                                    isActive: value,
                                    brightnessLv: (value) ? 0.5 : 0));
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
                    'Độ sáng:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Slider(
                      value: brightnessLv,
                      label: '${(brightnessLv * 100).toInt()}%',
                      divisions: 100,
                      onChanged: (v) {
                        ref
                            .read(deviceControllerProvider(
                                    widget.bulbsEntity.roomId)
                                .notifier)
                            .updateDevice(
                                deviceEntity: widget.bulbsEntity.copyWith(
                                    isActive: (v > 0), brightnessLv: v));
                      },
                      max: 1,
                      min: 0,
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
