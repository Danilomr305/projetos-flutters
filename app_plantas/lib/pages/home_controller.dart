// ignore: unused_import
import '../models/flor.dart';
// ignore: unused_import
import '../models/titulo.dart';

// ignore: unused_import
import '../repositories/flores_repository.dart';

class Home {
  late FloresRepository floresRepository;

  List<Flor> get danilo => floresRepository.flores;

  Home() {
    floresRepository = FloresRepository();
  }
}