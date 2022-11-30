import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PortTextField extends StatelessWidget {
  final bool last;
  final String index;
  const PortTextField({required this.last, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: MediaQuery.of(context).size.width / 6.4,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1 && !last) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: (index) {},
        decoration: InputDecoration(
            hintText: "0",
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 3, color: Color(0xff79DAE8)),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 3, color: Color(0xff79DAE8)),
                borderRadius: BorderRadius.circular(15))),
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(3),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
