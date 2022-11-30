import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:monobloc/screens/setting.dart';

class SettingCard extends StatefulWidget {
  final String label;
  SettingCard({ required this.label});

  @override
  State<SettingCard> createState() => _SettingCardState();
}

class _SettingCardState extends State<SettingCard> {
  Setting setting = const Setting();
  
  late LiteRollingSwitch _switch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _switch = LiteRollingSwitch();
  }

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
                // Image.asset(
                //   widget.imageUrl,
                //   height: 50,
                //   width: 50,
                // ),
                Text(
                  widget.label,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Transform.scale(
                  scale : 0.8,
                  alignment: Alignment.centerRight,
                  child: LiteRollingSwitch(
                  value: true,
                  textOn: "Auto",
                  textOff: "Close",
                  colorOn: Colors.blue,
                  colorOff: Colors.amber,
                  iconOn: null,
                  iconOff: null,
                  animationDuration: Duration(milliseconds: 600),
                  textSize: 18,
                  onChanged: (bool position) {
                    
                    print(position);
                  },
                  ),
                )
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
