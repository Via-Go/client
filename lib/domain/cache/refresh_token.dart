import 'package:hive/hive.dart';

part 'refresh_token.g.dart';

@HiveType(typeId: 1)
class RefreshToken {
  RefreshToken({required this.token});

  @HiveField(0)
  final String token;
}
