import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uts_flutter/app/models/user.dart';
import 'package:uts_flutter/app/services/custom_colors.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    double heightContainer = 50;
    double horizontalContainer = 16;
    double verticalContainer = 2;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: backgroundColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            SvgPicture.asset(
              'assets/svg/home.svg',
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: CustomColors.portGore900),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalContainer,
                vertical: verticalContainer,
              ),
              height: heightContainer,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Icons.person_2_outlined,
                    size: 30,
                    color: CustomColors.portGore900,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${widget.user.name}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: CustomColors.portGore900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: CustomColors.portGore900),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalContainer,
                vertical: verticalContainer,
              ),
              height: heightContainer,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 30,
                    color: CustomColors.portGore900,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${widget.user.username}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: CustomColors.portGore900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: CustomColors.portGore900),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalContainer,
                vertical: verticalContainer,
              ),
              height: heightContainer,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Icons.email_outlined,
                    size: 30,
                    color: CustomColors.portGore900,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${widget.user.email}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: CustomColors.portGore900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: CustomColors.portGore900),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalContainer,
                vertical: verticalContainer,
              ),
              height: heightContainer,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    Icons.lock_outline,
                    size: 30,
                    color: CustomColors.portGore900,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${widget.user.password}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: CustomColors.portGore900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Peringatan'),
                            content: const Text('Ingin Log Out ?'),
                            actions: [
                              Center(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Batal',
                                        style: TextStyle(
                                            color: CustomColors.portGore900,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 18,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(context, '/');
                                      },
                                      child: const Text('Iya',
                                          style: TextStyle(
                                              color: CustomColors.portGore900,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ]))
                            ],
                          );
                        });
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
