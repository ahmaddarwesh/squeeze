import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/data/models/service_model.dart';
import 'package:squeeze/app/data/providers/services_provider.dart';

class ServicesRepository {
  static Future<List<Service>> getServices() async {
    List<Service> listServices = [];
    var result = await ServicesProvider.getServices();
    if (!result.hasException) {
      var jsonList = result.data!['services'] as List<dynamic>;

      jsonList.forEach((element) {
        listServices.add(Service.fromJson(element));
      });
    } else {
      l(info: result.exception.toString());
    }
    return listServices;
  }
}
