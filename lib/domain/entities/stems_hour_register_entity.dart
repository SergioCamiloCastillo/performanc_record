class StemsHourRegisterEntity {
  final int idActivity;
  final int idSupervisor;
  final DateTime registerDate;
  final int stems;
  final int hours;
  final String observation;
  final int idProduct;

  StemsHourRegisterEntity({
    required this.idActivity,
    required this.idSupervisor,
    required this.registerDate,
    required this.stems,
    required this.hours,
    required this.observation,
    required this.idProduct,
  });
}
