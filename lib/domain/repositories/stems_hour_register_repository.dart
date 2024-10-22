import 'package:performance_record/domain/entities/stems_hour_register_entity.dart';

abstract class StemsHourRegisterRepository {
  Future<void> addStemsHourRegister(StemsHourRegisterEntity stemsHourRegister);
  Future<void> updateStemsHourRegister(
      StemsHourRegisterEntity stemsHourRegister);
  Future<void> deleteStemsHourRegister(String id);
  Future<List<StemsHourRegisterEntity>> getStemsHourRegisters();
  Future<StemsHourRegisterEntity> getStemsHourRegisterByWeek(
      DateTime initialDate, DateTime finalDate);
}
