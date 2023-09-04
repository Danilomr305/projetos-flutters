import '../models/casa.dart';
import '../repositories/casa_repository.dart';

class Home {
  late CasaRepository casaRepository;

  List<Casa> get danilo => casaRepository.casa;

  Home() {
    casaRepository = CasaRepository();
  }
}