import 'package:comidas/models/models.dart';
import 'package:comidas/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalSliderCast extends StatefulWidget {
  final String title; 
  final int movieId; 

  const HorizontalSliderCast({
    super.key, 
    this.title = "", 
    required this.movieId,  
  });

  @override
  State<HorizontalSliderCast> createState() => _HorizontalSliderCastState();
}

class _HorizontalSliderCastState extends State<HorizontalSliderCast> {
  final ScrollController controller = ScrollController();


  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if(controller.position.pixels >= controller.position.maxScrollExtent + 100){
        print('${controller.position.pixels} ${controller.position.maxScrollExtent}');
      }
      setState(() {
      
      });
    });
  }

  @override
  void dispose() {



    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black12,
      margin: EdgeInsets.only(top: size.height * 0.05),
      width: double.infinity,
      height: size.height * 0.40,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(widget.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),

          Expanded(
            child: ListView.builder(  
              physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
              controller: controller,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: ( _ , index) => CastPoster(index: index, movieId: widget.movieId)
            ),
          ),
        ],
      ),
    );
  }
}