import 'package:performance_record/domain/entities/activity_entity.dart';

abstract class ActivitiesDatasource {
  Future<List<ActivityEntity>> getActivities();
  Future<ActivityEntity> getActivity(String id);
  Future<bool> addActivity(ActivityEntity activity);
  Future<bool> updateActivity(ActivityEntity activity);
  Future<bool> deleteActivity(String id);
}
