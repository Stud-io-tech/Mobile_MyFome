import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_fome/src/data/repositories/stores/store_repository_impl.dart';
import 'package:my_fome/src/data/services/client/client_service_impl.dart';
import 'package:my_fome/src/data/services/local/local_storage_service.dart';
import 'package:my_fome/src/domain/repositories/stores/store_repository.dart';

class MockLocalStorageService extends Mock implements LocalStorageService {
  final _store = <String, String>{};
  @override
  Future<void> put(String key, value) async {
    _store[key] = value;
  }

  @override
  Future<String?> get(String key) async {
    return _store[key];
  }
}

void main() {
  late LocalStorageService localStorageService;
  late StoreRepository storeRepository;
  setUp(() {
    localStorageService = MockLocalStorageService();
    storeRepository = StoreRepositoryImpl(
        clientService: ClientServiceImpl(localStorageService));
  });

  group("Testando as operações do StoreRepository, usando a Api real.", () {
    test("Testando o list.", () async {
      final listStore = await storeRepository.list();
      expect(listStore.isSuccess(), isTrue);
    });

    test("Deve verificar que existe a loja chamada 'Shop'.", () async {
      late bool hasStore = false;

      final listStore = await storeRepository.list();

      listStore.onSuccess((success) => hasStore = success.any(
            (element) => element.name == "Shop",
          ));

      expect(hasStore, isTrue);
    });
  });
}
