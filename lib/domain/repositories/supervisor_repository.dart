import 'package:performance_record/domain/entities/supervisor_entity.dart';

abstract class SupervisorRepository {
  Future<SupervisorEntity> getSupervisor(String id);
  Future<void> addSupervisor(SupervisorEntity supervisor);
  Future<void> updateSupervisor(SupervisorEntity supervisor);
}
