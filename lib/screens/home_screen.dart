import 'package:flutter/material.dart';
import 'package:ieee_e_commerce_app/api_manager/api_manager.dart';
import 'package:ieee_e_commerce_app/data/data.dart';

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
            child: FutureBuilder(
          future: ApiManager().getAllProducts(),
          builder: (context, snapshot) {
            final data = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.grey,
              ));
            } else if (snapshot.hasError) {
              print("Error: ${snapshot.error}");
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                  child: Text(
                "No products",
                style: TextStyle(fontSize: 20),
              ));
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.7,
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: data!.length,
              itemBuilder: (context, index) => ProductData(
                  image_url: data[index].images[0],
                  product_name: data[index].title,
                  price: "${data[index].price}"),
            );
          },
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
