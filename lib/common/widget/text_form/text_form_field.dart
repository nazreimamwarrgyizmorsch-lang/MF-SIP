import 'package:flutter/material.dart';
import 'package:my_sip/utils/constant/colors.dart';

class UTextFormField extends StatelessWidget {
  const UTextFormField({
    super.key,
    required this.labelText,
    this.hintText,

    required this.prefixIcon,
    this.sufixIcon,
    this.keyboardType,
  });

  final String labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final IconData prefixIcon;
  final IconData? sufixIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.065,
      child: TextFormField(
        // enabled: F,
        keyboardType: keyboardType,

        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Ucolors.darkgrey),
          floatingLabelStyle: TextStyle(color: Ucolors.textFormEnabled),
          hintText: hintText,
          hintStyle: TextStyle(color: Ucolors.darkgrey),
          prefixIcon: Icon(prefixIcon, color: Colors.grey),
          suffixIcon: Icon(sufixIcon),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            // horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),

            borderSide: const BorderSide(
              color: Ucolors.textFormEnabled,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
