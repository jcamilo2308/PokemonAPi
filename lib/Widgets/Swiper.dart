import 'package:flutter/material.dart';
import 'package:pokemones/Widgets/pagesPoke.dart';
import '../Models/Model_Gifs.dart';
import '../Provider/Pokemon_Provider.dart';
import 'package:card_swiper/card_swiper.dart';


class SwipperPoke extends StatefulWidget {
  const SwipperPoke({Key? key}) : super(key: key);

  @override
  State<SwipperPoke> createState() => _SwipperPokeState();
}

class _SwipperPokeState extends State<SwipperPoke> {
  late Future<List<ModelPokes>> _listadoGifs;
  int offset = 0;

  @override
  void initState() {
    _listadoGifs = PokeProvider().getPokes(offset);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelPokes>>(
      future: _listadoGifs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Swiper(itemCount: snapshot.data!.length,
            itemWidth: 0.5,
            itemBuilder: (context, index) => cartaPoke(snapshot.data![index].name,
                snapshot.data![index].img,
                snapshot.data![index].types),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(
        );
      },
    );
  }
}
