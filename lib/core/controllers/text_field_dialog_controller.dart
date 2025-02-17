import 'package:injectable/injectable.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';

typedef StringCallback = void Function(String);

@injectable
class TextFieldDialogController extends BaseController with FormMixin {
  final StringCallback args;

  TextFieldDialogController(@factoryParam this.args, super.logger,super.appRouter,super.snakeBarShower);

  @override
  Future<void> afterSuccessSubmitting() async {
    args(valueOf('textField')!);
    await appRouter.maybePop();
  }

  @override
  Future<void> submitFunction() async {}
}
