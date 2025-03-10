import 'package:flutter/material.dart';
import 'package:ieee_e_commerce_app/api_manager/api_manager.dart';
import 'package:ieee_e_commerce_app/data/data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 50,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 60, left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: TextField(
              obscureText: false,
              // onChanged: ,
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  labelText: "Search products",
                  icon: Icon(Icons.search))),
        ),
        Expanded(
            child: FutureBuilder(
          future: ApiManager().getSearchProducts(query),
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
