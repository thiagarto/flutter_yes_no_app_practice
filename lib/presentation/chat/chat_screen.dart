import 'package:flutter/material.dart';
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
    return SafeArea(
      // left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Text('Indice: $index');
              },
            )),
            //  Container(//permite usar todo el espacio disponible que el padre le de
            //   color: Colors.red,
            // )),

            const Text('Hola Mundo')
          ],
        ),
      ),
    );
  }
}
