import 'package:flutter/material.dart';
import 'package:monobloc/screens/main_tank.dart';

class TankCard extends StatelessWidget {
  final String label;
  final String state;
  final String ipAddress;
  final String statue;
  final int index;

  // ignore: use_key_in_widget_constructors
  TankCard(
      {required this.label,
      required this.index,
      required this.state,
      required this.ipAddress,
      required this.statue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 50,
          vertical: MediaQuery.of(context).size.height / 100),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const MainTank()));
        },
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
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                    child: Text(
                      "Tank: $label",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                    child: Text(
                      "Statue: $statue",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                    child: Text(
                      "Adresse: $ipAddress",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                  ),
                  /* Stepper(
                    type: StepperType.horizontal,
                    steps: getSteps(),
                    currentStep: currentStep,
                    ) */
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                         .pushReplacement(MaterialPageRoute(builder: (_) => const MainTank()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 19),
                    child: Icon(
                      Icons.circle,
                      // color: state == "@00KeWaitingOK26E3*" ? Colors.grey : Colors.green,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


