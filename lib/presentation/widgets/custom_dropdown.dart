import 'package:flutter/material.dart';



class CustomDropDown extends StatelessWidget {
  final String? selectedItem;
  final String? hint;
  final String? errorText;
  final Color? color;
  final Widget? icon;
  final List<String> items;
  final Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;

  CustomDropDown({
  this.selectedItem,
  this.color,
  this.hint,
  this.icon,
  this.errorText,
  required this.items,
  required this.onChanged,required this.validator});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        hint:Text(
            hint!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style:const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
            )
        ),
        isExpanded:true,
        borderRadius: BorderRadius.circular(8),
        autovalidateMode:AutovalidateMode.onUserInteraction,
        focusColor:Colors.black,
        iconEnabledColor:Colors.black,
        style: const TextStyle(
            fontStyle: FontStyle.normal,
            color: Colors.grey,
            fontSize: 14
        ),
        decoration: InputDecoration(
          errorText: errorText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color:  Color(0xff034A8F) ),
              gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xffEFEFEF)),
              gapPadding: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xff034A8F)),
              gapPadding: 10),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: false,
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        dropdownColor: Colors.white,
        value: selectedItem,
        onChanged:onChanged,
        validator:validator,
        icon: Container(
          height: 30,
          decoration: BoxDecoration(
              color: Color(0xff034A8F).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)
          ),
            child: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xff034A8F))
        ),
        items: items.map((data){
        return DropdownMenuItem(
          child: Text(
             data,
            style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14
            ),),
          value: data,
        );
        }).toList(),
    );
  }
}

class CustomDropDownUnderLine extends StatelessWidget {
  final String? selectedItem;
  final String? hint;
  final String? errorText;
  final Color? color;
  final Widget? icon;
  final List<String> items;
  final Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;

  CustomDropDownUnderLine({
    this.selectedItem,
    this.color,
    this.hint,
    this.icon,
    this.errorText,
    required this.items,
    required this.onChanged,
    required this.validator});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField(
          hint:Text(
              hint!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              style:const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
              )
          ),
          isExpanded:true,
          borderRadius: BorderRadius.circular(8),
          autovalidateMode:AutovalidateMode.onUserInteraction,
          focusColor:Colors.black,
          iconEnabledColor:Colors.grey,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff034A8F)
          ),
          decoration: InputDecoration(
            errorText: errorText,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color:Color(0xff034A8F) ,width: 1),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey ),
            ),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff034A8F)),
            ),
            filled: false,
            contentPadding: EdgeInsets.zero,
          ),
          dropdownColor: Colors.white,
          value: selectedItem,
          onChanged:onChanged,
          validator:validator,

          items: items.map((data){
          return DropdownMenuItem(
            child: Text(
              data,
              style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 14
              ),),
            value: data,
          );
          }).toList(),
      ),
    );
  }
}


