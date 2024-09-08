import 'package:have_a_plan/app/classes/note.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;

  @HiveField(1)
  String password;

  @HiveField(2)
  String email;

  @HiveField(3)
  List<Written> plans;

  @HiveField(4)
  bool isLocal;

  // Неименованный конструктор, который инициализирует все поля (создал для билда)
  User({
    required this.name,
    required this.password,
    required this.email,
    required this.plans,
    required this.isLocal,
  });

  // Именованный конструктор для локальных пользователей
  User.local({required String username})
      : name = username,
        password = '',
        email = '',
        plans = [],
        isLocal = true;

  // Именованный конструктор для удаленных пользователей
  User.remote({
    required String username,
    required this.password,
    required this.email,
  })  : name = username,
        plans = [],
        isLocal = false;

  void addPlan(Written plan) {
    plan.index = plans.length;
    plans.add(plan);
  }

  void addAllPlans(List<Written> plans) {
    this.plans.addAll(plans);
  }

  void removeAllPlans() {
    plans.clear();
  }
}
