import 'package:trend/third_parties_modules/abstract/i_module.dart';

typedef PickedContact = (String contactName, String phoneNumber);

abstract class IContactPickingModule extends IModule {
  Future<PickedContact?> pickContact();
}
