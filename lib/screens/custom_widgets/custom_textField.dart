import 'package:flutter/material.dart';

class CustomWidget {
  static Widget CustomTextField({
    required TextEditingController controller,
    required String titleName,
  }) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [
        BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            offset: const Offset(
              0.5,
              0.5,
            ),
            spreadRadius: 1,
            blurRadius: 3)
      ]),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            filled: true,
            label: Text(titleName),
            labelStyle: const TextStyle(color: Colors.black),
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey, width: 1)),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}

class MyInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData? prefixIcon;
  const MyInputField(
      {Key? key,
      required this.controller,
      required this.label,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: [
        BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            offset: const Offset(
              0.5,
              0.5,
            ),
            spreadRadius: 1,
            blurRadius: 3)
      ]),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            filled: true,
            label: Text(label),
            labelStyle: const TextStyle(color: Colors.black),
            fillColor: Colors.white,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey, width: 1)),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
