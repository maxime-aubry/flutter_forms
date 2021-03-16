import 'package:flutter_forms/src/exceptions/index.dart';
import 'package:flutter_forms/src/utils/index.dart';

typedef Future<List<SelectListItem<TProperty>>> ListItemsServiceFunction<
    TProperty>();

/// [ListItemsProvider] provides data to validators, as dropdown, autocomplete...
/// 
/// Items are provided from local data, or using by a HTTP request.
/// {@category Utilities}
class ListItemsProvider {
  static Map<String, ListItemsServiceFunction> _services = {};

  /// [clear] clears the services.
  /// 
  /// How to use it :
  /// 
  /// ``` dart
  /// ListItemsProvider.clear();
  /// ```
  static void clear() {
    if (ListItemsProvider._services == null)
      ListItemsProvider._services = new Map<String, ListItemsServiceFunction>();

    ListItemsProvider._services.clear();
  }

  /// [register] registers a service.
  /// 
  /// If the service name is not provided, the method will throw an exception.
  /// 
  /// If the service is not provided, the method will throw an exception.
  /// 
  /// If the service name is already registered, the method will throw an exception.
  /// 
  /// How to use it :
  /// 
  /// ``` dart
  /// ListItemsProvider.register<TProperty>('serviceName', () async => []);
  /// ```
  static void register<TProperty>(
    String name,
    ListItemsServiceFunction<TProperty> service,
  ) {
    if (name == null || name.isEmpty)
      throw new ListItemProviderException('Service name is required.');

    if (service == null)
      throw new ListItemProviderException('Service is required.');

    if (ListItemsProvider._services == null)
      ListItemsProvider._services = new Map<String, ListItemsServiceFunction>();

    if (ListItemsProvider._services.containsKey(name))
      throw new ListItemProviderException(
          'Service name is already registered.');

    ListItemsProvider._services[name] = service;
  }

  /// [close] closes a service.
  /// 
  /// If the service name is not provided, the method will throw an exception.
  /// 
  /// If the service name is not registered, the method will throw an exception.
  /// 
  /// How to use it :
  /// 
  /// ``` dart
  /// ListItemsProvider.close('serviceName');
  /// ```
  static void close(String name) {
    if (name == null || name.isEmpty)
      throw new ListItemProviderException('Service name is required.');

    if (!ListItemsProvider._services.containsKey(name))
      throw new ListItemProviderException('Service name is not recognized.');

    if (ListItemsProvider._services == null)
      ListItemsProvider._services = new Map<String, ListItemsServiceFunction>();

    ListItemsProvider._services.remove(name);
  }

  /// [provide] provides a service.
  /// 
  /// If the service name is not provided, the method will throw an exception.
  /// 
  /// If the service name is not registered, the method will throw an exception.
  /// 
  /// How to use it :
  /// 
  /// ``` dart
  /// Future<List<SelectListItem<TProperty>>> Function() service =
  ///   ListItemsProvider.provide<TProperty>('serviceName');
  /// List<SelectListItem<TProperty>> items = await service();
  /// ```
  static ListItemsServiceFunction<TProperty> provide<TProperty>(String name) {
    if (name == null || name.isEmpty)
      throw new ListItemProviderException('Service name is required.');

    if (!ListItemsProvider._services.containsKey(name))
      throw new ListItemProviderException('Service name is not recognized.');

    ListItemsServiceFunction<TProperty> service =
        ListItemsProvider._services[name];
    return service;
  }
}
