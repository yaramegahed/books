import 'package:flutter/material.dart';

class FigmaScreen extends StatefulWidget {
  const FigmaScreen({super.key});

  @override
  State<FigmaScreen> createState() => _FigmaScreenState();
}

class _FigmaScreenState extends State<FigmaScreen> {
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.grey;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(children: [
              const Row(
                children: [
                  Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Report  Article",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Why would you like to report this Article?",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: WidgetStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Hate Speech",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: WidgetStateProperty.resolveWith(getColor),
                    value: isChecked1,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked1 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Fake Promotions",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: WidgetStateProperty.resolveWith(getColor),
                    value: isChecked2,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Vulgur Content",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: WidgetStateProperty.resolveWith(getColor),
                    value: isChecked3,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked3 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Spreading Hate",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: WidgetStateProperty.resolveWith(getColor),
                    value: isChecked4,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked4 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Religious Issue",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ])));
  }
}
