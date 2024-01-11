import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/app/feature/device/enum/device_type.dart';
import 'package:smart_home/app/feature/device/presentation/controller/device_controller.dart';

final selectDeviceContentTypeStateProvider =
    StateProvider.autoDispose<DeviceType?>((ref) => null);

class CreateDeviceForm extends ConsumerStatefulWidget {
  final String roomId;
  const CreateDeviceForm({super.key, required this.roomId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateDeviceFormState();
}

class _CreateDeviceFormState extends ConsumerState<CreateDeviceForm> {
  final TextEditingController deviceNameTextFieldController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    const TextStyle labelStyle =
        TextStyle(fontSize: 16.0, color: Colors.black54);
    return Column(
      children: [
        TextField(
          controller: deviceNameTextFieldController,
          decoration: const InputDecoration(
              labelText: 'Tên thiết bị', labelStyle: labelStyle),
        ),
        const SizedBox(
          height: 35,
        ),
        DropdownButton<DeviceType>(
          value: ref.watch(selectDeviceContentTypeStateProvider),
          onChanged: (value) {
            if (value != null) {
              ref.read(selectDeviceContentTypeStateProvider.notifier).state =
                  value;
            }
          },
          items: DeviceType.values.map((deviceType) {
            return DropdownMenuItem<DeviceType>(
              value: deviceType,
              child: Text(
                getDeviceTypeName(deviceType: deviceType),
                style: const TextStyle(fontSize: 16.0),
              ),
            );
          }).toList(),
          hint: const Text('Chọn thiết bị', style: labelStyle),
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
            final String deviceName = deviceNameTextFieldController.text;
            final DeviceType? deviceType =
                ref.read(selectDeviceContentTypeStateProvider);
            if (deviceName.isNotEmpty && deviceType != null) {
              try {
                ref
                    .read(deviceControllerProvider(widget.roomId).notifier)
                    .createDevice(
                        deviceType: deviceType, deviceName: deviceName);
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
            'Thêm thiết bị mới',
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
