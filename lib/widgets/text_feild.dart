import 'package:flutter/material.dart';
import 'package:weter_app/model/constands.dart';

class TextFormFeilldWidets extends StatelessWidget {
  const TextFormFeilldWidets({
    super.key,
    required this.cityContoller,
  });

  final TextEditingController cityContoller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: TextFormField(
          style: const TextStyle(color: kwhiteColor),
          textCapitalization: TextCapitalization.sentences,
          controller: cityContoller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 2, color: kblackcolor), //<-- SEE HERE
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: 'search location to check weather',
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding: const EdgeInsets.all(17),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kblackcolor),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: kblackcolor),
                  borderRadius: BorderRadius.all(Radius.circular(15))))),
    );
  }
}
