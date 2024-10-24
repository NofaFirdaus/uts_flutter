import 'package:flutter/material.dart';
import 'package:uts_flutter/app/services/custom_colors.dart';

class AlertLogout extends StatelessWidget {
  const AlertLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Peringatan'),
      content: const Text('Ingin Log Out ?'),
      actions: [
        Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Batal',
              style: TextStyle(
                  color: CustomColors.portGore900, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
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
  }
}
