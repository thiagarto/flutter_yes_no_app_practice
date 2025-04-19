import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    //TODO: implementar metodo
    if (text.isEmpty) return;

    //instancio mi mensaje
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage); //lo añadimos a la lista

    if (text.endsWith('?')) {
      herReply(); //si termina con: ? entonces guarda la respuesta http
    }

    notifyListeners(); //le aviso de un cambio del provider que le avise a los escuchadores
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    //se va a lanzar cuando detecte que el mensaje es una pregunta
    final herMessage = await getYesNoAnswer.getAnswer();

    messageList.add(herMessage); //añadimos el mensaje de ella a la lista
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    // Esperar a que Flutter termine de construir los widgets antes de hacer scroll
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
