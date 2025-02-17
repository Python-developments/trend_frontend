import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/validators/is_shorter_than_validator.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/core/utils/masked_formatter.dart';
import 'package:trend/core/utils/mixins.dart';
import 'package:trend/dependencies.dart';

class PhoneNumberTextField extends StatefulWidget {
  final FormMixin formController;
  final String errorKey, title, fieldKey;
  const PhoneNumberTextField({
    required this.formController,
    super.key,
    this.title = 'Phone number',
    this.errorKey = 'phoneNumber',
    this.fieldKey = 'phoneNumber',
  });

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField>
    with OnChangeDependenciesMixin<PhoneNumberTextField> {
  String countryCode = '971';
  final TextEditingController textController = TextEditingController();
  @override
  void initState() {
    initFromValue();
    widget.formController
        .getFieldTextController(widget.fieldKey)
        .addListener((initFromValue));
    textController.text = widget.formController.valueOf(widget.fieldKey) ?? '';
    super.initState();
  }

  @override
  void onChangeDependencies() {
    initFromValue();
  }

  void initFromValue() {
    final String? currentValue = widget.formController.valueOf(widget.fieldKey);
    if (currentValue?.startsWith('+971') ?? false) {
      textController.text = currentValue!.replaceFirst('+971', '');
    } else if (currentValue?.startsWith('00971') ?? false) {
      textController.text = currentValue!.replaceFirst('00971', '');
    }
  }

  void changeCountry(final String newCountry) => setState(() {
        countryCode = newCountry;
        widget.formController
            .setValue(widget.fieldKey, '+$countryCode${textController.text}');
      });

  void changePhoneNumber(final String newPhone) => setState(() {
        textController.text = newPhone;
        widget.formController
            .setValue(widget.fieldKey, '00$countryCode${textController.text}');
      });
  @override
  Widget build(final BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: IntlPhoneField(
        flagsButtonPadding: EdgeInsets.all(8.r),
        initialCountryCode: 'AE',
        invalidNumberMessage: 'Invalid mobile number',
        controller: textController,
        onCountryChanged: (final country) => changeCountry(country.dialCode),
        onChanged: (final phone) => changePhoneNumber(phone.number),
        showCountryFlag: true,
        showDropdownIcon: false,
        pickerDialogStyle: PickerDialogStyle(
            backgroundColor: AppStyle.black.shade100,
            searchFieldInputDecoration: InputDecoration(
              label: Text(
                'Search',
                style: AppStyle.textTheme.bodyMedium,
              ),
              prefixIcon: const Icon(Icons.search),
            )),
        disableLengthCheck: true,
        languageCode:
            getIt<LocalizationController>().currentLocale.languageCode,
        countries: countries
            .where((final element) => element.name == 'United Arab Emirates')
            .toList(),
        autovalidateMode: AutovalidateMode.disabled,
        validator: (final _) async => IsShorterThanValidator(minLength: 13)
            .check(fieldName: widget.title, toCheckString: textController.text)
            ?,
        cursorColor: AppStyle.black.shade600,
        inputFormatters: [MaskedInputFormatter('000000000')],
        decoration: InputDecoration(
          filled: true,
          fillColor: AppStyle.black.shade100,
          errorText: widget
              .formController.validationErrors[widget.errorKey]?,
          border: const OutlineInputBorder(
            borderRadius: AppStyle.borderRadius,
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: AppStyle.borderRadius,
            borderSide: BorderSide(color: AppStyle.blue),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: AppStyle.borderRadius,
            borderSide: BorderSide(color: AppStyle.errorColor),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: AppStyle.borderRadius,
            borderSide: BorderSide(color: AppStyle.errorColor),
          ),
          prefixIcon: const CustomSvgImage(path: Assets.phone),
          hintText: widget.title,
          hintStyle: AppStyle.textTheme.bodyLarge!
              .copyWith(color: AppStyle.black.shade600),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
