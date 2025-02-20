import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_fome/src/domain/repositories/stores/store_repository.dart';
import 'package:my_fome/src/data/repositories/stores/store_repository_impl.dart';
import 'package:my_fome/src/data/services/client/client_service.dart';

class ClientMock extends Mock implements ClientService {}

void main() {
  late ClientMock clientMock;
  late StoreRepository storeRepositoryMock;

  setUp(() {
    clientMock = ClientMock();
    storeRepositoryMock = StoreRepositoryImpl(clientService: clientMock);
  });

  group("Testando as operações do StoreRepository, usando mocks", () {
    final dataBaseTest = {
      "stores": [
        {
          "id": "1",
          "name": "Dogão Express",
          "description": "Preparamos os melhores Hot Dogs da região",
          "image": "image.png",
          "whatsapp": "+5584992017118",
          "owner_id": "1",
        },
        {
          "id": "2",
          "name": "Botique do Bolo",
          "description": "Preparamos os melhores doces e gelados da região",
          "image": "image.png",
          "whatsapp": "+5583992017118",
          "owner_id": "2",
        },
        {
          "id": "3",
          "name": "Bares",
          "description": "Preparamos as melhores bebidas artesanais da região",
          "image": "image.png",
          "whatsapp": "+5582992017118",
          "owner_id": "1",
        },
      ]
    };

    group("Testando o list.", () {
      test("Deve verificar que a lista de lojas não seja vazia.", () async {
        final response = Response(
          requestOptions: RequestOptions(),
          data: dataBaseTest,
        );

        when(() => clientMock.get(any())).thenAnswer((_) async => response);

        final listStore = await storeRepositoryMock.list();

        expect(listStore.isSuccess(), isTrue);
        expect(listStore.getOrNull()?.isNotEmpty, isTrue);

        verify(() => clientMock.get(any())).called(1);
      });

      test("Deve verificar que existe a loja chamada 'Botique do Bolo'.",
          () async {
        final response = Response(
          requestOptions: RequestOptions(),
          data: dataBaseTest,
        );

        when(() => clientMock.get(any())).thenAnswer((_) async => response);

        final listStore = await storeRepositoryMock.list();

        final hasStore = response.data?['stores']?.any(
          (element) => element["name"] == "Botique do Bolo",
        );

        expect(listStore.isSuccess(), isTrue);
        expect(hasStore, isTrue);

        verify(() => clientMock.get(any())).called(1);
      });

      test("Deve verificar que não existe a loja chamada 'Ratinho do Rego'.",
          () async {
        final response = Response(
          requestOptions: RequestOptions(),
          data: dataBaseTest,
        );

        when(() => clientMock.get(any())).thenAnswer((_) async => response);

        final listStore = await storeRepositoryMock.list();

        final hasStore = response.data?['stores']?.any(
          (element) => element["name"] == "Ratinho do Rego",
        );

        expect(listStore.isSuccess(), isTrue);
        expect(hasStore, isFalse);

        verify(() => clientMock.get(any())).called(1);
      });

      test("Deve retornar erro ao tentar listar lojas.", () async {
        final response = DioException(
          requestOptions: RequestOptions(),
        );
        when(
          () => clientMock.get(any()),
        ).thenThrow(response);

        final listStore = await storeRepositoryMock.list();

        expect(listStore.isError(), isTrue);
        verify(() => clientMock.get(any())).called(1);
      });
    });
  });
}
