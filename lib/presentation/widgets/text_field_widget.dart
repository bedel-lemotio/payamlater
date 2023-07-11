

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class TextFieldPhoneWidget extends StatelessWidget {
  TextFieldPhoneWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.onSaved,
    this.onInputChanged,
    this.onInputValidated,
    this.prefixIcon,
    this.number,
    this.suffixIcon,
    this.textInputType,
    required this.messageErro})
      : super(key: key);
  String? labelText;
  String? hintText;
  String? messageErro;
  PhoneNumber? number;
  Function()?onTap;
  bool? enabled;
  int? maxLines;
  Widget? prefixIcon;
  Widget? suffixIcon;

  TextEditingController? controller;

  void Function(PhoneNumber)? onSaved;
  void Function(PhoneNumber)? onInputChanged;
  void Function(bool)? onInputValidated;
  TextInputType? textInputType = TextInputType.text;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DROPDOWN,
          showFlags: true,
          useEmoji: true,
          setSelectorButtonAsPrefixIcon: true,
          trailingSpace: false
      ),
      ignoreBlank: false,
      textAlignVertical: TextAlignVertical.center,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      selectorTextStyle: const TextStyle(color: Colors.black),
      initialValue: number,
      textFieldController: controller,
      countries: const ["DZ", "NE", "CM", "FR"],
      formatInput: true,
      keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
      spaceBetweenSelectorAndTextField: 0,
      textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black
      ),
      inputDecoration: InputDecoration(
        errorText: messageErro,
        //suffixIcon:suffixIcon,
        //prefixIcon:prefixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xff8D9091),
            fontSize: 14),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff034A8F) ),
            gapPadding: 10
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color:Color(0xffEFEFEF) ),
            gapPadding: 10),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red),
            gapPadding: 10
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff034A8F)),
            gapPadding: 10
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: false,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),

      ),
      onSaved:onSaved,
      onInputChanged:onInputChanged,
      onInputValidated:onInputValidated,
    );
  }
}


class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    Key? key,
     this.labelText,
    required this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.onTap,
    this.enabled,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.showCursor,
    this.readOnly,
    this.autofocus,
    this.autocorrect,
    this.textInputType,
    this.expands,
    required this.messageErro})
      : super(key: key);
  String? labelText;
  String? hintText;
  String? messageErro;
  Function()?onTap;
  bool? enabled;
  bool? showCursor;
  bool? readOnly;
  bool? autofocus;
  bool? autocorrect;
  int? maxLines;
  Widget? prefixIcon;
  Widget? suffixIcon;

  TextEditingController? controller;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  TextInputType? textInputType = TextInputType.text;
  bool? expands;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      keyboardType: textInputType,
      onChanged: onChanged,
      controller: controller,
      onTap: onTap,
      enabled:enabled,
      maxLines:maxLines,
      validator:validator,
      expands:expands??false,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black
      ),
      decoration: InputDecoration(
        errorText: messageErro,
        suffixIcon:suffixIcon,
        prefixIcon:prefixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff034A8F) ),
            gapPadding: 10
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color:Color(0xffEFEFEF) ),
            gapPadding: 10),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red),
            gapPadding: 10
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff034A8F)),
            gapPadding: 10
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: false,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
    );
  }
}

class TextFieldSimpleWidget extends StatelessWidget {
  TextFieldSimpleWidget({
    Key? key,
    required this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.enabled,
    this.textInputType,
    required this.messageErro})
      : super(key: key);
  String? hintText;
  String? messageErro;
  bool? enabled;

  TextEditingController? controller;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  TextInputType? textInputType = TextInputType.text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.top,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black
      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffE5E7EB) ),
              gapPadding: 10
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color:  Color(0xff034A8F) ),
              gapPadding: 10),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
              gapPadding: 10
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xff034A8F)),
              gapPadding: 10
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          fillColor: Color(0xffF9FAFB)
      ),
    );
  }
}



class TextFieldPasswordWidget extends StatefulWidget {
  TextFieldPasswordWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.onTap,
    this.enabled,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    required this.messageErro})
      : super(key: key);
  String? labelText;
  String? hintText;
  String? messageErro;
  Function()?onTap;
  bool? enabled;
  int? maxLines;
  Widget? prefixIcon;
  Widget? suffixIcon;

  TextEditingController? controller;
  void Function(String)? onChanged;
  String? Function(String?)? validator;
  TextInputType? textInputType = TextInputType.text;

  @override
  State<TextFieldPasswordWidget> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPasswordWidget> {

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      controller: widget.controller,
      onTap: widget.onTap,
      enabled:widget.enabled,
      maxLines:widget.maxLines??1,
      validator:widget.validator,
      obscureText: _isHidden,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black
      ),
      decoration: InputDecoration(
        errorText: widget.messageErro,
        suffixIcon:InkWell(
        onTap: _togglePasswordView,
        child: Icon(
          color: Color(0xff034A8F),
          _isHidden ? Icons.visibility : Icons.visibility_off,
        ),
      ),
        prefixIcon:widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
            color: Color(0xff8D9091),
            fontSize: 14),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff034A8F) ),
            gapPadding: 10
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color:Color(0xffEFEFEF) ),
            gapPadding: 10),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red),
            gapPadding: 10
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff034A8F)),
            gapPadding: 10
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: false,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),

      ),
    );
  }

  void _togglePasswordView() {


    setState(() {
      _isHidden = !_isHidden;
    });

  }
}



