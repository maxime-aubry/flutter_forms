import 'package:flutter_forms/flutter_forms.dart';
import 'package:flutter_test/flutter_test.dart';

import '../expect_exception.dart';

void main() {
  group('ListItemsProvider.', () {
    group('clear', () {
      test('clear a null list of service.', () {
        ListItemsProvider.clear();
      });

      test('clear a populated list of service.', () {
        ListItemsProvider.register<int>('a', () async => null);
        ListItemsProvider.clear();
      });
    });

    group('register.', () {
      test('Registers a service with <int> items, from local datasource.',
          () async {
        List<SelectListItem<int>> items = [];
        ListItemsProvider.register<int>('b', () async => items);
      });

      test(
          'Throws an exception of ListItemProviderException type when name is null.',
          () async {
        expect_exception<ListItemProviderException>(() {
          ListItemsProvider.register<int>(null, () async => null);
        }, 'Service name is required.');
      });

      test(
          'Throws an exception of ListItemProviderException type when name is empty.',
          () async {
        expect_exception<ListItemProviderException>(() {
          ListItemsProvider.register<int>('', () async => null);
        }, 'Service name is required.');
      });

      test(
          'Throws an exception of ListItemProviderException type when service is null.',
          () async {
        expect_exception<ListItemProviderException>(() {
          ListItemsProvider.register<int>('c', null);
        }, 'Service is required.');
      });

      test(
          'Throws an exception of ListItemProviderException type when name is already registered.',
          () async {
        ListItemsProvider.register<int>('d', () async => null);

        expect_exception<ListItemProviderException>(() {
          ListItemsProvider.register<int>('d', () async => null);
        }, 'Service name is already registered.');
      });
    });

    group('close.', () {
      test('Closes a service.', () {
        ListItemsProvider.register<int>('e', () async => null);
        ListItemsProvider.close('e');
      });

      test(
          'Throws an exception of ListItemProviderException type when name is null.',
          () async {
        expect_exception<ListItemProviderException>(() {
          ListItemsProvider.close(null);
        }, 'Service name is required.');
      });

      test(
          'Throws an exception of ListItemProviderException type when name is empty.',
          () async {
        expect_exception<ListItemProviderException>(() {
          ListItemsProvider.close('');
        }, 'Service name is required.');
      });

      test(
          'Throws an exception of ListItemProviderException type when name is not recognized.',
          () async {
        expect_exception<ListItemProviderException>(() {
          ListItemsProvider.close('f');
        }, 'Service name is not recognized.');
      });
    });

    group('provide.', () {
      test('Provides a service and consume it.', () async {
        List<SelectListItem<int>> items = [
          new SelectListItem<int>(0, 'male'),
          new SelectListItem<int>(1, 'female'),
        ];
        ListItemsProvider.register<int>('g', () async => items);
        Future<List<SelectListItem<int>>> Function() service =
            ListItemsProvider.provide<int>('g');
        List<SelectListItem<int>> receivedItems = await service();
        expect(items, receivedItems);
      });

      test(
          'Throws an exception of ListItemProviderException type when name is null.',
          () async {
        expect_exception<ListItemProviderException>(() {
          ListItemsProvider.provide<int>(null);
        }, 'Service name is required.');
      });

      test(
          'Throws an exception of ListItemProviderException type when name is empty.',
          () async {
        expect_exception<ListItemProviderException>(() {
          ListItemsProvider.provide<int>('');
        }, 'Service name is required.');
      });

      test(
          'Throws an exception of ListItemProviderException type when name is not recognized.',
          () async {
        expect_exception<ListItemProviderException>(() {
          ListItemsProvider.close('h');
        }, 'Service name is not recognized.');
      });
    });
  });
}
