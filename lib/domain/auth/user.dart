import 'package:hive/hive.dart';
import 'package:users_repository/users_repository.dart';

part 'user.g.dart';

@HiveType(typeId: 3)
class User {
  User({
    required this.id,
    required this.username,
    required this.email,
  });

  factory User.fromDTO(UserDTO userDTO) {
    return User(
      id: userDTO.id,
      username: userDTO.username,
      email: userDTO.email,
    );
  }

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;
}
