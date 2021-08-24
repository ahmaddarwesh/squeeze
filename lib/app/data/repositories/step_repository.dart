import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/data/models/step_model.dart';
import 'package:squeeze/app/data/providers/steps_provider.dart';

class StepRepository {
  static Future<List<Step>> getSteps() async {
    List<Step> listServices = [];
    var result = await StepsProvider.getSteps();
    if (!result.hasException) {
      var jsonList = result.data!['steps'] as List<dynamic>;

      jsonList.forEach((element) {
        listServices.add(Step.fromJson(element));
      });
    } else {
      l(info: result.exception.toString());
    }
    return listServices;
  }
}
