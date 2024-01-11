import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_home/app/app.dart';
import 'package:smart_home/app/feature/device/domain/device_entity.dart';
import 'package:smart_home/app/feature/device/presentation/controller/device_controller.dart';

// final brightnessLevelStateProvider = StateProvider.autoDispose
//     .family<double, TvEntity>((ref, tv) => tv.volumeLv);
// final isActiveStateProvider = StateProvider.autoDispose
//     .family<bool, TvEntity>((ref, tv) => tv.isActive);

class TvCard extends ConsumerStatefulWidget {
  final TvEntity tvEntity;
  const TvCard({super.key, required this.tvEntity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TvCardState();
}

class _TvCardState extends ConsumerState<TvCard> {
  final white70TextStyle = const TextStyle(
      color: Colors.white70, fontSize: 17, fontWeight: FontWeight.bold);
  final whiteTextStyle = const TextStyle(
      color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final double volumeLv = widget.tvEntity.volumeLv;
    final bool isActive = widget.tvEntity.isActive;
    final int currentChannel = widget.tvEntity.currentChannel ?? 0;
    return Card(
      elevation: 5,
      color: isActive ? Colors.black87 : Colors.grey,
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
                        Icons.tv,
                        size: 40,
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          'Kênh: ',
                          style: whiteTextStyle,
                        ),
                        SizedBox(
                          width: 55,
                          child: TextFormField(
                            readOnly: !isActive,
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            initialValue: currentChannel.toString(),
                            onFieldSubmitted: (value) {
                              if (value.isNotEmpty && int.parse(value) > 0) {
                                ref
                                    .read(deviceControllerProvider(
                                            widget.tvEntity.roomId)
                                        .notifier)
                                    .updateDevice(
                                        deviceEntity: widget.tvEntity.copyWith(
                                            currentChannel: int.parse(value)));
                              }
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'))
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Colors.lightBlue.shade100),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                    subtitle: Text(
                      widget.tvEntity.deviceName,
                      style: white70TextStyle,
                    ),
                  )),
                  Switch(
                      value: isActive,
                      onChanged: (value) {
                        ref
                            .read(
                                deviceControllerProvider(widget.tvEntity.roomId)
                                    .notifier)
                            .updateDevice(
                                deviceEntity:
                                    widget.tvEntity.copyWith(isActive: value));
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
                    'Âm lượng:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Slider(
                      value: volumeLv,
                      label: '${(volumeLv * 100).toInt()}%',
                      divisions: 100,
                      onChanged: (v) {
                        ref
                            .read(
                                deviceControllerProvider(widget.tvEntity.roomId)
                                    .notifier)
                            .updateDevice(
                                deviceEntity: widget.tvEntity
                                    .copyWith(isActive: (v > 0), volumeLv: v));
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
