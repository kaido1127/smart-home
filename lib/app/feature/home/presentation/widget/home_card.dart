import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/app/feature/home/domain/home_entity.dart';
import 'package:smart_home/app/feature/home/presentation/controller/home_controller.dart';

class HomeCard extends ConsumerWidget {
  final HomeEntity homeEntity;
  const HomeCard(this.homeEntity, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onLongPress: () => showRemoveHomeDialog(context, ref),
      onTap: () => context.push('/summary_room_page', extra: homeEntity),
      child: Card(
        color: Colors.lightBlue[50],
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          title: Text(
            homeEntity.homeName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Thiết bị đang bật: ${homeEntity.runningDeviceCount}'),
          trailing: Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                homeEntity.roomCount.toString(),
                style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Text('Phòng')
            ],
          ),
        ),
      ),
    );
  }

  showRemoveHomeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            title: Text('Bạn có muốn xóa ${homeEntity.homeName} ?'),
            actions: [
              TextButton(
                  onPressed: () => context.pop(), child: const Text('Hủy')),
              TextButton(
                  onPressed: () {
                    ref
                        .read(
                            homeControllerProvider(homeEntity.hostId).notifier)
                        .removeHome(homeId: homeEntity.createAt.toString());
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
