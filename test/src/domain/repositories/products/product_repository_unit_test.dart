import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_fome/src/data/repositories/products/produtc_repository_impl.dart';
import 'package:my_fome/src/domain/dtos/products/product_register_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_update_dto.dart';
import 'package:my_fome/src/domain/repositories/products/produtc_repository.dart';
import 'package:my_fome/src/data/services/client/client_service.dart';

class ClientMock extends Mock implements ClientService {}

void main() {
  late ClientMock clientMock;
  late ProdutcRepository productRepositoryMock;

  setUp(() {
    clientMock = ClientMock();
    productRepositoryMock = ProdutcRepositoryImpl(clientService: clientMock);
  });

  group("Testando as operações do ProductRepository, usando mocks", () {
    final List<Map<String, dynamic>> dataBaseTest = [
      {
        "id": "1",
        "name": "Cachorro Quente Padrão 270g",
        "description": "...",
        "image": "image.png",
        "actived": true,
        "quantity": 20,
        "price": 10.0,
        "id_store": "1",
      },
      {
        "id": "2",
        "name": "Cachorro Quente Premium 370g",
        "description": "...",
        "image": "image.png",
        "actived": true,
        "quantity": 18,
        "price": 14.99,
        "id_store": "1",
      },
      {
        "id": "3",
        "name": "Bolo no Pode de chocolate 350g",
        "description": "...",
        "image": "image.png",
        "actived": true,
        "quantity": 5,
        "price": 11.5,
        "id_store": "2",
      },
    ];

    group("Testando o listActive.", () {
      test("Deve verificar que a lista de produtos não seja vazia.", () async {
        final response = Response(
          requestOptions: RequestOptions(),
          data: dataBaseTest,
        );

        when(() => clientMock.get(any())).thenAnswer((_) async => response);

        final listProduct = await productRepositoryMock.listActive();

        expect(listProduct.isSuccess(), isTrue);
        expect(listProduct.getOrNull()?.isNotEmpty, isTrue);

        verify(() => clientMock.get(any())).called(1);
      });

      test(
          "Deve verificar que existe a produto chamada 'Cachorro Quente Padrão 270g'.",
          () async {
        final response = Response(
          requestOptions: RequestOptions(),
          data: dataBaseTest,
        );

        when(() => clientMock.get(any())).thenAnswer((_) async => response);

        final listProduct = await productRepositoryMock.listActive();

        final hasProduct = dataBaseTest.any(
          (element) => element["name"] == "Cachorro Quente Padrão 270g",
        );

        expect(listProduct.isSuccess(), isTrue);
        expect(hasProduct, isTrue);

        verify(() => clientMock.get(any())).called(1);
      });

      test("Deve verificar que não existe a produto chamada 'X-Tudo'.",
          () async {
        final response = Response(
          requestOptions: RequestOptions(),
          data: dataBaseTest,
        );

        when(() => clientMock.get(any())).thenAnswer((_) async => response);

        final listProduct = await productRepositoryMock.listActive();

        final hasProduct = dataBaseTest.any(
          (element) => element["name"] == "X-Tudo",
        );

        expect(listProduct.isSuccess(), isTrue);
        expect(hasProduct, isFalse);

        verify(() => clientMock.get(any())).called(1);
      });

      test("Deve retornar erro ao tentar listar produtos.", () async {
        final response = DioException(
          requestOptions: RequestOptions(),
        );
        when(
          () => clientMock.get(any()),
        ).thenThrow(response);

        final listProduct = await productRepositoryMock.listActive();

        expect(listProduct.isError(), isTrue);
        verify(() => clientMock.get(any())).called(1);
      });
    });

    group("Testando o listInactive.", () {
      test("Deve verificar que a lista de produtos não seja vazia.", () async {
        final response = Response(
          requestOptions: RequestOptions(),
          data: dataBaseTest,
        );

        when(() => clientMock.get(any())).thenAnswer((_) async => response);

        final listProduct = await productRepositoryMock.listInactive();

        expect(listProduct.isSuccess(), isTrue);
        expect(listProduct.getOrNull()?.isNotEmpty, isTrue);

        verify(() => clientMock.get(any())).called(1);
      });

      test(
          "Deve verificar que existe a produto chamada 'Cachorro Quente Padrão 270g'.",
          () async {
        final response = Response(
          requestOptions: RequestOptions(),
          data: dataBaseTest,
        );

        when(() => clientMock.get(any())).thenAnswer((_) async => response);

        final listProduct = await productRepositoryMock.listActive();

        final hasProduct = dataBaseTest.any(
          (element) => element["name"] == "Cachorro Quente Padrão 270g",
        );

        expect(listProduct.isSuccess(), isTrue);
        expect(hasProduct, isTrue);

        verify(() => clientMock.get(any())).called(1);
      });

      test("Deve verificar que não existe a produto chamada 'X-Tudo'.",
          () async {
        final response = Response(
          requestOptions: RequestOptions(),
          data: dataBaseTest,
        );

        when(() => clientMock.get(any())).thenAnswer((_) async => response);

        final listProduct = await productRepositoryMock.listInactive();

        final hasProduct = dataBaseTest.any(
          (element) => element["name"] == "X-Tudo",
        );

        expect(listProduct.isSuccess(), isTrue);
        expect(hasProduct, isFalse);

        verify(() => clientMock.get(any())).called(1);
      });

      test("Deve retornar erro ao tentar listar produtos.", () async {
        final response = DioException(
          requestOptions: RequestOptions(),
        );
        when(
          () => clientMock.get(any()),
        ).thenThrow(response);

        final listProduct = await productRepositoryMock.listInactive();

        expect(listProduct.isError(), isTrue);
        verify(() => clientMock.get(any())).called(1);
      });
    });

    group("Testando o register.", () {
      test("Deve registrar um novo produto.", () async {
        final image =
            MultipartFile.fromString("https://homolazaus/files/imagem.png");

        final registerTest = ProductRegisterDto(
            name: "X-Tudo",
            description: "...",
            image: image,
            price: 22,
            quantity: 13,
            storeId: "1");

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

        final result = await productRepositoryMock.register(registerTest);

        expect(result.isSuccess(), isTrue);

        verify(
          () => clientMock.post(
            any(),
            any(),
            requiresAuth: true,
            contentType: 'multipart/form-data',
          ),
        ).called(1);
      });

      test("Deve retornar erro ao tentar registrar um novo produto.", () async {
        final image =
            MultipartFile.fromString("https://homolazaus/files/imagem.png");

        final registerTest = ProductRegisterDto(
            name: "X-Tudo",
            description: "...",
            image: image,
            price: 22,
            quantity: 13,
            storeId: "1");

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

        final result = await productRepositoryMock.register(registerTest);

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
      test("Deve atualizar uma produto existente.", () async {
        final updateTest =
            ProductUpdateDto(id: "2", name: "Bolo no Pode de chocolate 350g");

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
            await productRepositoryMock.update(updateTest.id, updateTest);

        expect(result.isSuccess(), isTrue);

        verify(
          () => clientMock.patch(
            any(),
            any(),
            requiresAuth: true,
            contentType: 'multipart/form-data',
          ),
        ).called(1);
      });

      test("Deve retornar erro ao tentar atualizar uma produto.", () async {
        final image =
            MultipartFile.fromString("https://homolazaus/files/imagem.png");

        final updateTest = ProductUpdateDto(
          id: "2",
          image: image,
          name: "Bolo no Pode de chocolate 350g",
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
            await productRepositoryMock.update(updateTest.id, updateTest);

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
