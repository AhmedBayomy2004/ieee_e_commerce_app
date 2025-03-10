import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductData extends StatelessWidget {
  const ProductData(
      {required this.image_url,
      required this.product_name,
      required this.price,
      super.key});

  final String image_url;
  final String product_name;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      // margin: EdgeInsets.only(left: 100, right: 100, top: 5, bottom: 5),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CachedNetworkImage(
            imageUrl: image_url,
            errorWidget: (context, url, error) => Icon(Icons.error),
            placeholder: (context, url) => SizedBox(
              child: Center(
                child: Transform.scale(
                  scale: 0.5,
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            height: 170,
            width: 170,
            fit: BoxFit.fill,
          ),
          // SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child:
                Align(alignment: Alignment.topLeft, child: Text(product_name)),
          ),
          //   SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "\$$price",
                  style: TextStyle(color: Colors.green),
                )),
          )
        ],
      ),
    );
  }
}
