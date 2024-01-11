enum DeviceType { bulbs, fan, tv, door }

String getDeviceTypeName({required DeviceType deviceType}) {
  switch (deviceType) {
    case DeviceType.bulbs:
      return "Bóng đèn";
    case DeviceType.fan:
      return "Quạt";
    case DeviceType.tv:
      return "TV";
    case DeviceType.door:
      return "Cửa";
  }
}
