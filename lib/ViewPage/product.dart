import 'package:business/Component/card.dart';
import 'package:business/Controller/listProduct.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  final int count;
  Product(this.count);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int selectedIndex = 0; // Initially select the first item

  @override
  Widget build(BuildContext context) {
    if (widget.count == 0) {
      return Center(
        child: Text('Không có sản phẩm nào'),
      );
    } else {
      return Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            children: [
              // Left Layout
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red, width: 3)),
                    child: Center(
                        child: ListView.builder(
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: InkWell(
                                    onTap: () {
                                      // onPressed
                                      setState(() {
                                        // update the selected index
                                        selectedIndex = index;
                                      });
                                    },
                                    child: ListTile(
                                      leading: Icon(Icons.label),
                                      title: Text(categories[index]),
                                    ),
                                  ));
                            })),
                  )),
              //Right Layout
              Expanded(
                  flex: 3,
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    padding: EdgeInsets.all(10),
                    children: List.generate(
                        categoryItems[categories[selectedIndex]]?.length ?? 0,
                        (index) {
                      return ImageCard(
                          title: categoryItems[categories[selectedIndex]]
                                  ?[index] ??
                              '');
                    }),
                  ))
            ],
          ));
    }
  }
}
