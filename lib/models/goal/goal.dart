import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';

part 'goal.g.dart';

@freezed
class Goal with _$Goal {
  factory Goal({
    required String id,
    required String name,
    required bool isChecked,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}
