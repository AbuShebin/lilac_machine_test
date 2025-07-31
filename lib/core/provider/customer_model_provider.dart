import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lilac/features/auth/model/customer_base_model.dart';

final customerModelProvider = StateProvider<CustomerBaseModelModel?>((ref) => null,);

final userIdProvider = StateProvider<String?>((ref) => null,);