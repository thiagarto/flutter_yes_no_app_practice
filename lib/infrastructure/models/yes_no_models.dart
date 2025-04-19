//todo esto es para usar punto

//quicktype pegar la llamada http y te hace todo:

// en esta clase recibiria la respuesta de la llamada http
// y la mapeamos para acceder mas facilmente a la informacion

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;
//   realizamos constructor con cada una:
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });
// factory es que cuando alguien llama a este constructor termina creando una instancia
//fromJsonMap
  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
   text: answer == 'yes' ? 'Si' : 'No',
   fromWho: FromWho.hers,
   imageUrl: image
  );
}
