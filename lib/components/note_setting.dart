import 'package:flutter/material.dart';

class NoteSetting extends StatelessWidget {
  final void Function()? onEditeTap;
  final void Function()? onDeleteTap;
  const NoteSetting({
    super.key,
    required this.onEditeTap,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // eidte options
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditeTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            child: Center(
                child: Text(
              "Edite",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),

        // delete options
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onDeleteTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.background,
            //color: Theme.of(context).colorScheme.background,
            child: Center(
                child: Text(
              "Delte",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
