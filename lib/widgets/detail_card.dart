import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String imageUrl;
  final String label;
  final String color;

  // ignore: use_key_in_widget_constructors
  const DetailCard(
      {required this.imageUrl, required this.label, required this.color});

  // ignore: use_key_in_widget_constructors

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 30,
          vertical: MediaQuery.of(context).size.height / 100),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 3.0,
                  offset: const Offset(0, 3),
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-3, 0),
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(3, 0),
                )
              ],
              color: Colors.white),
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.width / 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imageUrl,
                  height: 50,
                  width: 50,
                ),
                Text(
                  label,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Icon(Icons.circle,
                    size: 20,
                    color: color == "FALSE "
                        ? Colors.grey
                        : color == "CLOSE "
                            ? Colors.grey
                            : color == "OFF "
                                ? Colors.grey
                                : color == "off "
                                    ? Colors.grey
                                    : color == "OFF B052*"
                                        ? Colors.grey
                                        : Colors.green)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
