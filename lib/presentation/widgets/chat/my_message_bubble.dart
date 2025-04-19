import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;//para manejar el estado de los mensajes
  const MyMessageBubble({super.key, required this.message});

  

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
          child:  Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10), //emvolvemos el texto en un padding
            child: Text(
             message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10) //espacio entre mensajes
      ],
    );
  }
}
