import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, //ponerlo contra la derecha
      children: [
        Container(
          decoration: BoxDecoration(
              //estilos del contenedor
              color: colors.primary,
              borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding:  EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10), //emvolvemos el texto en un padding
            child: Text(
              'Consequat nulla incididunt ',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10) //espacio entre mensajes
      ],
    );
  }
}
