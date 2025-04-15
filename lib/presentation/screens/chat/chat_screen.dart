import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';
//import 'package:flutter/widgets.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          // al leading lo envuelvo con un padding 'ctrl + .'
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://s1.coincarp.com/logo/1/sid-ice-age.png?style=200&v=1689579155'),
          ),
        ),
        title: const Text('Pana Sid 🐈'),
        centerTitle: false,
      ),
      //bajo el scaffold ponemos un contenedor cuerpo
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //esto va a estar pensiente de lo que suceda en esa
    //instancia de la clase
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      // left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                //permite usar todo el espacio disponible que el padre le de
                child: ListView.builder(
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble()
                    : MyMessageBubble();
                // return (index % 2 == 0) //si el indice del contenedor es par
                //     ? const HerMessageBubble() //es par
                //     : const MyMessageBubble(); //no es par
              },
            )),
            //  Container(
            //   color: Colors.red,
            // )),

            //caja de texto
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
