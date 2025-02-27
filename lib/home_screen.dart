import 'package:flutter/material.dart';
import 'package:ieee_e_commerce_app/data.dart';

List<category> categories = [
  category(data: "Electronics"),
  category(data: "Fashion"),
  category(data: "Kitchen"),
  category(data: "Games & toys"),
  category(data: "Food"),
  category(data: "Drinks"),
  category(data: "Gifts"),
  category(data: "Others")
];
List<ProductData> products = [
  ProductData(
      image_url:
          "https://leantoys.com/eng_pm_Ball-Blue-Black-Rubber-Large-23-cm-Light-15934_1.jpg",
      product_name: "ball",
      price: "10\$"),
  ProductData(
      image_url:
          "https://i5.walmartimages.com/seo/Damyuan-Running-Shoes-Men-Fashion-Sneakers-Slip-on-Casual-Walking-Shoes-Sport-Athletic-Shoes-Lightweight-Breathable-Comfortable_4114141f-7d26-4dd7-933d-babc24080395.516ad145e1a1d8d82a801ac48231950d.jpeg",
      product_name: "Shoes",
      price: "30\$"),
  ProductData(
      image_url:
          "https://isto.pt/cdn/shop/files/Heavyweight_Black_ef459afb-ff7a-4f9a-b278-9e9621335444.webp?v=1739465839",
      product_name: "T-shirt",
      price: "250\$"),
  ProductData(
      image_url:
          "https://leantoys.com/eng_pm_Ball-Blue-Black-Rubber-Large-23-cm-Light-15934_1.jpg",
      product_name: "ball",
      price: "10\$"),
  ProductData(
      image_url:
          "https://i5.walmartimages.com/seo/Damyuan-Running-Shoes-Men-Fashion-Sneakers-Slip-on-Casual-Walking-Shoes-Sport-Athletic-Shoes-Lightweight-Breathable-Comfortable_4114141f-7d26-4dd7-933d-babc24080395.516ad145e1a1d8d82a801ac48231950d.jpeg",
      product_name: "Shoes",
      price: "30\$"),
  ProductData(
      image_url:
          "https://isto.pt/cdn/shop/files/Heavyweight_Black_ef459afb-ff7a-4f9a-b278-9e9621335444.webp?v=1739465839",
      product_name: "T-shirt",
      price: "250\$"),
  ProductData(
      image_url:
          "https://leantoys.com/eng_pm_Ball-Blue-Black-Rubber-Large-23-cm-Light-15934_1.jpg",
      product_name: "ball",
      price: "10\$"),
  ProductData(
      image_url:
          "https://i5.walmartimages.com/seo/Damyuan-Running-Shoes-Men-Fashion-Sneakers-Slip-on-Casual-Walking-Shoes-Sport-Athletic-Shoes-Lightweight-Breathable-Comfortable_4114141f-7d26-4dd7-933d-babc24080395.516ad145e1a1d8d82a801ac48231950d.jpeg",
      product_name: "Shoes",
      price: "30\$"),
  ProductData(
      image_url:
          "https://isto.pt/cdn/shop/files/Heavyweight_Black_ef459afb-ff7a-4f9a-b278-9e9621335444.webp?v=1739465839",
      product_name: "T-shirt",
      price: "250\$"),
  ProductData(
      image_url:
          "https://leantoys.com/eng_pm_Ball-Blue-Black-Rubber-Large-23-cm-Light-15934_1.jpg",
      product_name: "ball",
      price: "10\$"),
  ProductData(
      image_url:
          "https://i5.walmartimages.com/seo/Damyuan-Running-Shoes-Men-Fashion-Sneakers-Slip-on-Casual-Walking-Shoes-Sport-Athletic-Shoes-Lightweight-Breathable-Comfortable_4114141f-7d26-4dd7-933d-babc24080395.516ad145e1a1d8d82a801ac48231950d.jpeg",
      product_name: "Shoes",
      price: "30\$"),
  ProductData(
      image_url:
          "https://isto.pt/cdn/shop/files/Heavyweight_Black_ef459afb-ff7a-4f9a-b278-9e9621335444.webp?v=1739465839",
      product_name: "T-shirt",
      price: "250\$"),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Text(
            "Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 40,
          child: Expanded(
              child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => categories[index],
          )),
        ),
        Expanded(
            child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .8,
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) => products[index],
        )),
      ],
    );
  }
}

class category extends StatelessWidget {
  const category({required this.data, super.key});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(data),
    );
  }
}
