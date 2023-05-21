import 'package:hive/hive.dart';

part 'access_token.g.dart';

@HiveType(typeId: 0)
class AccessToken {
  AccessToken({required this.token});

  @HiveField(0)
  final String token;
}
