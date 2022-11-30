import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:users_dm/itemsScreens/items_screen.dart';
import 'package:users_dm/models/brands.dart';




class BrandsUiDesignWidget extends StatefulWidget
{
  Brands? model;

  BrandsUiDesignWidget({this.model,});

  @override
  State<BrandsUiDesignWidget> createState() => _BrandsUiDesignWidgetState();
}




class _BrandsUiDesignWidgetState extends State<BrandsUiDesignWidget>
{
  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> ItemsScreen(
          model: widget.model,
        )));
      },
      child: Card(
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.white54,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: SizedBox(
            height: 270,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    widget.model!.thumbnailUrl.toString(),
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 1,),

                Text(
                  widget.model!.brandTitle.toString(),
                  style: const TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 3,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
