import 'package:flutter/material.dart';

enum RoomType {
  bedroom,
  livingRoom,
  diningRoom,
  kitchen,
  bathroom,
  officeRoom,
  guestRoom,
  storageRoom,
  garage,
  lobby,
}

String getRoomTypeName(RoomType roomType) {
  switch (roomType) {
    case RoomType.bedroom:
      return 'Phòng Ngủ';
    case RoomType.livingRoom:
      return 'Phòng Khách';
    case RoomType.diningRoom:
      return 'Phòng Ăn';
    case RoomType.kitchen:
      return 'Nhà Bếp';
    case RoomType.bathroom:
      return 'Phòng Tắm';
    case RoomType.guestRoom:
      return 'Phòng Khách Nghỉ';
    case RoomType.storageRoom:
      return 'Phòng Lưu Trữ';
    case RoomType.garage:
      return 'Gara';
    case RoomType.officeRoom:
      return 'Phòng Làm Việc';
    case RoomType.lobby:
      return 'Sảnh';
  }
}

Color getColorFromRoomType(RoomType roomType) {
  switch (roomType) {
    case RoomType.bedroom:
      return Colors.blue;
    case RoomType.livingRoom:
      return Colors.green;
    case RoomType.diningRoom:
      return Colors.orange;
    case RoomType.kitchen:
      return Colors.red;
    case RoomType.bathroom:
      return Colors.purple;
    case RoomType.officeRoom:
      return Colors.teal;
    case RoomType.guestRoom:
      return Colors.yellow;
    case RoomType.storageRoom:
      return Colors.indigo;
    case RoomType.garage:
      return Colors.brown;
    case RoomType.lobby:
      return Colors.black87;
  }
}

IconData getIconFromRoomType(RoomType roomType) {
  switch (roomType) {
    case RoomType.bedroom:
      return Icons.bed_outlined;
    case RoomType.livingRoom:
      return Icons.weekend_outlined;
    case RoomType.diningRoom:
      return Icons.local_dining_outlined;
    case RoomType.kitchen:
      return Icons.kitchen_outlined;
    case RoomType.bathroom:
      return Icons.bathtub_outlined;
    case RoomType.officeRoom:
      return Icons.work_outline;
    case RoomType.guestRoom:
      return Icons.person_outline;
    case RoomType.storageRoom:
      return Icons.archive_outlined;
    case RoomType.garage:
      return Icons.directions_car_outlined;
    case RoomType.lobby:
      return Icons.roundabout_left_outlined;
  }
}
