import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});
//barra de mensajes
  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;

//para el input de texto
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      // borderSide: BorderSide(color: colors.primary),
      //borderRadius: BorderRadius.circular(20)),
      //aca metimos estos atributos en la variable de arriba
      //outlineInputBorder
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print('button:$textValue'); //se ve al apretar el boton
          textController.clear(); //para que se borre la caja de texto
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();//para sacarle el foco al teclado
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Subnit value $value');
        textController.clear(); //para que se borre la caja de texto
        focusNode.requestFocus(); // para mantener el teclado en la pantalla
      },
    );
  }
}
