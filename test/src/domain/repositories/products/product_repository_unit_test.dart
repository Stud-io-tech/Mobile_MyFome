import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_fome/src/data/repositories/products/produtc_repository_impl.dart';
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
    final dataBaseTest = {
      "products": [
        {
          "id": "1",
          "name": "Cachorro Quente Padrão 270g",
          "description": "...",
          "image": "image.png",
          "active": true,
          "amount": 20,
          "price": "10.0",
          "store_id": "1",
        },
        {
          "id": "2",
          "name": "Cachorro Quente Premium 370g",
          "description": "...",
          "image": "image.png",
          "active": true,
          "amount": 18,
          "price": "14.99",
          "store_id": "1",
        },
        {
          "id": "3",
          "name": "Bolo no Pode de chocolate 350g",
          "description": "...",
          "image": "image.png",
          "active": true,
          "amount": 5,
          "price": "11.5",
          "store_id": "2",
        },
      ]
    };

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

        final hasProduct = response.data?['products']?.any(
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

        final hasProduct = response.data?['products']?.any(
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

        final hasProduct = response.data?['products']?.any(
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

        final hasProduct = response.data?['products']?.any(
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
  });
}
