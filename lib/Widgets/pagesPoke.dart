import 'Package:flutter/material.dart';
import 'package:pokemones/Models/Model_Gifs.dart';

Widget cartaPoke(String texto, String img, List types) {
  final tipo1 = types[0]["type"]["name"];
  var tipo2 = "normal";
  try {
    tipo2 = types[1]["type"]["name"];
  } catch (e) {
    tipo2 = tipo1;
  }

  return Container(
    constraints: const BoxConstraints.expand(),
    margin: const EdgeInsets.only(bottom: 20),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(0)),
      elevation: 10,
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(
                      img,
                    ).image,
                    fit: BoxFit.contain,
                  ),
                ),
              )),
          Expanded(
            child:
                Center(
                  child:Text(
                        texto,
                        style:
                        const TextStyle(color: Colors.black,
                            fontSize: 20,
                        ),
                      )),
                )
        ],
      ),
    ),
  );
}

List<Widget> ListGifs(List<ModelPokes> listado) {
  final List<Widget> gifs = [];
  for (var element in listado) {
    gifs.add(
        cartaPoke(element.name,
            element.img,
            element.types),
      );
  }

  return gifs;
}
