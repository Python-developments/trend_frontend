import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_native_contact_picker/model/contact.dart';
import 'package:injectable/injectable.dart';

import 'package:trend/third_parties_modules/abstract/i_contact_picking_module.dart';

@Singleton(as: IContactPickingModule)
class ContactPickingModule extends IContactPickingModule {
  final FlutterNativeContactPicker contactPicker = FlutterNativeContactPicker();

  @override
  Future<PickedContact?> pickContact() async {
    final Contact? contact = await contactPicker.selectContact();
    if (contact == null) {
      return null;
    }

    String? contactFirstNumber = contact.phoneNumbers?.first;
    if (contactFirstNumber?.startsWith('05') ?? false) {
      contactFirstNumber = contactFirstNumber?.replaceFirst('05', '+9715');
    }
    contactFirstNumber = contactFirstNumber?.replaceAll(' ', '');
    return (contact.fullName ?? '', contactFirstNumber ?? '');
  }
}
