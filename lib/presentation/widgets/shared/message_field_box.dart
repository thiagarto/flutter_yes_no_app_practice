import 'package:flutter/material.dart';

// Widget con caja de texto para enviar mensajes
class MessageFieldBox extends StatefulWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  // Controlador para el texto ingresado
  final TextEditingController textController = TextEditingController();

  // Nodo de foco para controlar el teclado y el cursor
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    // Liberamos los recursos del controlador y el focus
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Estilo del borde del input (invisible con bordes redondeados)
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    // Decoración del campo de texto (hint, borde, ícono)
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"', // texto guía
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true, // fondo del input
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.text.trim();

          widget.onValue(textValue); // envía el valor
          textController.clear(); // borra el contenido de la caja
          focusNode.requestFocus(); // mantiene el teclado activo
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(), // para cerrar teclado si tocan afuera
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        final trimmed = value.trim();
        if (trimmed.isEmpty) return;

        textController.clear(); // borra la caja al presionar Enter
        widget.onValue(trimmed); // envía el mensaje
        focusNode.requestFocus(); // mantiene el foco en el input
      },
    );
  }
}
