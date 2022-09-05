import 'package:flutter/material.dart';
import 'package:pin_code/widget/dots_widget.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({Key? key}) : super(key: key);

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  static const int numberOfDost = 4;
  int inputPinCount = 0;
  String inputPin = '';

  void setAndUnSet(int n, {bool? unSet}) {
    if (unSet! && unSet) {
      inputPinCount = inputPin.length;
      inputPinCount--;
      inputPin = inputPin.substring(0, inputPinCount);
    } else {
      inputPin += n.toString();
      inputPinCount = inputPin.length;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.3, 0.6],
          colors: [
            Color.fromARGB(255, 204, 244, 243),
            Color.fromARGB(209, 248, 208, 255),
            Color.fromARGB(209, 234, 129, 255),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.messenger_outline,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color.fromARGB(44, 0, 0, 0),
                        child: Icon(
                          Icons.person_rounded,
                          color: Colors.white.withOpacity(0.4),
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Text(
                          'PIN-code',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        DotsWidget(dots: numberOfDost, count: inputPinCount ),
                        const SizedBox(height: 60),
                        Expanded(
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 12,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 18,
                              mainAxisExtent: 70,
                            ),
                            itemBuilder: (context, index) {
                              int n = index + 1;
                              bool backspace = false;
                              if (n == 11) n = 0;
                              if (n == 12) backspace = true;
                              if (n == 10) {
                                return const SizedBox.shrink();
                              } else {
                                return TextButton(
                                  style: TextButton.styleFrom(
                                    shape: const CircleBorder(),
                                  ),
                                  child: n != 12
                                      ? Text(
                                          n.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 26),
                                        )
                                      : const Icon(
                                          Icons.backspace_outlined,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                  onPressed: () {
                                    if ((inputPin.isNotEmpty && backspace) ||
                                        (inputPin.length < numberOfDost &&
                                            !backspace)) {
                                      setAndUnSet(n, unSet: backspace);
                                    }
                                  },
                                );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              FooterText(text: 'Forgot PIN-code?'),
                              FooterText(text: 'I\'m not a bank customer'),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class FooterText extends StatelessWidget {
  final String text;
  const FooterText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ));
  }
}
