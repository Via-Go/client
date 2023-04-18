import 'package:fpdart/fpdart.dart';

import '../../gen/proto/v1/users.pb.dart';
import '../users/call_failure.dart';

typedef CallResult = Either<CallFailure, GetUserResponse>;
