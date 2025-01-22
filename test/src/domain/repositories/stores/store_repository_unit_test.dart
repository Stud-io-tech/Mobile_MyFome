import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_fome/src/domain/dtos/stores/store_register_dto.dart';
import 'package:my_fome/src/domain/dtos/stores/store_update_dto.dart';
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
    final List<Map<String, dynamic>> dataBaseTest = [
      {
        "id": "1",
        "name": "Dogão Express",
        "description": "Preparamos os melhores Hot Dogs da região",
        "image": "image.png",
        "actived": true,
        "whatsapp": "84992017118",
        "user_id": "1",
      },
      {
        "id": "2",
        "name": "Botique do Bolo",
        "description": "Preparamos os melhores doces e gelados da região",
        "image": "image.png",
        "actived": true,
        "whatsapp": "83992017118",
        "user_id": "2",
      },
      {
        "id": "3",
        "name": "Bares",
        "description": "Preparamos as melhores bebidas artesanais da região",
        "image": "image.png",
        "actived": false,
        "whatsapp": "82992017118",
        "user_id": "1",
      },
    ];

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

        final hasStore = dataBaseTest.any(
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

        final hasStore = dataBaseTest.any(
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

    group("Testando o register.", () {
      test("Deve registrar uma nova loja.", () async {
        final image =
            MultipartFile.fromString("https://homolazaus/files/imagem.png");

        final registerTest = StoreRegisterDto(
          name: "Botique do Bolo",
          description: "Preparamos os melhores doces e gelados da região",
          image: image,
          whatsapp: "81992017118",
        );

        final response = Response(
          requestOptions: RequestOptions(),
          data: registerTest.toMap(),
        );

        when(() => clientMock.post(
              any(),
              any(),
              requiresAuth: true,
              contentType: 'multipart/form-data',
            )).thenAnswer((_) async => response);

        final result = await storeRepositoryMock.register(registerTest);

        final hasWhastapp = dataBaseTest.any(
          (element) => element['whatsapp'] == registerTest.whatsapp,
        );

        expect(result.isSuccess(), isTrue);
        expect(hasWhastapp, isFalse);

        verify(
          () => clientMock.post(
            any(),
            any(),
            requiresAuth: true,
            contentType: 'multipart/form-data',
          ),
        ).called(1);
      });

      test(
          "Deve flhar ao tentar registrar uma nova loja com whatsapp existente.",
          () async {
        final image =
            MultipartFile.fromString("https://homolazaus/files/imagem.png");

        final registerTest = StoreRegisterDto(
          name: "Botique do Bolo",
          description: "Preparamos os melhores doces e gelados da região",
          image: image,
          whatsapp: "82992017118",
        );

        final response = Response(
          requestOptions: RequestOptions(),
          data: registerTest.toMap(),
        );

        when(() => clientMock.post(
              any(),
              any(),
              requiresAuth: true,
              contentType: 'multipart/form-data',
            )).thenAnswer((_) async => response);

        await storeRepositoryMock.register(registerTest);

        final hasWhastapp = dataBaseTest.any(
          (element) => element['whatsapp'] == registerTest.whatsapp,
        );

        expect(hasWhastapp, isTrue);

        verify(
          () => clientMock.post(
            any(),
            any(),
            requiresAuth: true,
            contentType: 'multipart/form-data',
          ),
        ).called(1);
      });

      test("Deve retornar erro ao tentar registrar uma nova loja.", () async {
        final image =
            MultipartFile.fromString("https://homolazaus/files/imagem.png");

        final registerTest = StoreRegisterDto(
          name: "Botique do Bolo",
          description: "Preparamos os melhores doces e gelados da região",
          image: image,
          whatsapp: "81992017118",
        );

        final response = DioException(
          requestOptions: RequestOptions(),
        );
        when(
          () => clientMock.post(
            any(),
            any(),
            requiresAuth: true,
            contentType: 'multipart/form-data',
          ),
        ).thenThrow(response);

        final result = await storeRepositoryMock.register(registerTest);

        expect(result.isError(), isTrue);
        verify(
          () => clientMock.post(
            any(),
            any(),
            requiresAuth: true,
            contentType: 'multipart/form-data',
          ),
        ).called(1);
      });
    });

    group("Testando o update.", () {
      test("Deve atualizar uma loja existente.", () async {
        final image =
            MultipartFile.fromString("https://homolazaus/files/imagem02.png");

        final updateTest = StoreUpdateDto(
          id: "3",
          image: image,
          whatsapp: "80992017118",
        );

        final response = Response(
          requestOptions: RequestOptions(),
          data: updateTest.toMap(),
        );

        when(() => clientMock.patch(
              any(),
              any(),
              requiresAuth: true,
              contentType: 'multipart/form-data',
            )).thenAnswer((_) async => response);

        final result =
            await storeRepositoryMock.update(updateTest.id, updateTest);

        final hasWhastapp = dataBaseTest.any(
          (element) => element['whatsapp'] == updateTest.whatsapp,
        );

        expect(result.isSuccess(), isTrue);
        expect(hasWhastapp, isFalse);

        verify(
          () => clientMock.patch(
            any(),
            any(),
            requiresAuth: true,
            contentType: 'multipart/form-data',
          ),
        ).called(1);
      });

      test("Deve falhar ao tentar atualizar uma loja com whastapp existente.",
          () async {
        final image =
            MultipartFile.fromString("https://homolazaus/files/imagem.png");

        final updateTest = StoreUpdateDto(
          id: "3",
          image: image,
          whatsapp: "82992017118",
        );
        final response = Response(
          requestOptions: RequestOptions(),
          data: updateTest.toMap(),
        );

        when(() => clientMock.patch(
              any(),
              any(),
              requiresAuth: true,
              contentType: 'multipart/form-data',
            )).thenAnswer((_) async => response);

        await storeRepositoryMock.update(updateTest.id, updateTest);

        final hasWhastapp = dataBaseTest.any(
          (element) => element['whatsapp'] == updateTest.whatsapp,
        );

        expect(hasWhastapp, isTrue);
        verify(
          () => clientMock.patch(
            any(),
            any(),
            requiresAuth: true,
            contentType: 'multipart/form-data',
          ),
        ).called(1);
      });
      test("Deve retornar erro ao tentar atualizar uma loja.", () async {
        final image =
            MultipartFile.fromString("https://homolazaus/files/imagem.png");

        final updateTest = StoreUpdateDto(
          id: "3",
          image: image,
          whatsapp: "82992017118",
        );

        final response = DioException(
          requestOptions: RequestOptions(),
        );

        when(() => clientMock.patch(
              any(),
              any(),
              requiresAuth: true,
              contentType: 'multipart/form-data',
            )).thenThrow(response);

        final result =
            await storeRepositoryMock.update(updateTest.id, updateTest);

        expect(result.isError(), isTrue);
        verify(
          () => clientMock.patch(
            any(),
            any(),
            requiresAuth: true,
            contentType: 'multipart/form-data',
          ),
        ).called(1);
      });
    });
  });
}
