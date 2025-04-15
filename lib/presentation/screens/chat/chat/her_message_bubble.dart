import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //ponerlo contra la derecha
      children: [
        Container(
          decoration: BoxDecoration(
              //estilos del contenedor
              color: colors.secondary,
              borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10), //emvolvemos el texto en un padding
            child: Text(
              'Hola Mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5), //espacio entre mensajes

        _ImageBubble(),
        const SizedBox(height: 10),
        //Todo: imagen
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print(size); podemos verlo en debug console
//El mediaQuery nos da informacion del dispositivo que lo esta ejecutando
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yesno.wtf/assets/yes/11-a23cbde4ae018bbda812d2d8b2b8fc6c.gif',
          width: size.width * 0.5, //para cambiar el tamaño de la imagen
          height: 150, //dejamos este fijo para que no se desproporcione
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: size.width * 0.5,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Sid está enviando una imagen.'),
            );
          },
        ));
  }
}
