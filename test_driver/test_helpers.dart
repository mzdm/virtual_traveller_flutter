Future<void> delay_1s() async {
  await Future<void>.delayed(const Duration(milliseconds: 1000));
}

Future<void> delay_650ms() async {
  await Future<void>.delayed(const Duration(milliseconds: 650));
}

Future<void> delay_250ms() async {
  await Future<void>.delayed(const Duration(milliseconds: 250));
}

Future<void> delay_custom({int milliseconds = 0}) async {
  await Future<void>.delayed(Duration(milliseconds: milliseconds));
}
