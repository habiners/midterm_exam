import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopx/constants/constants.dart';
import 'package:shopx/views/product_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.view_list_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.grid_view),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Obx(
            () {
              return productController.productList.length == 0
                  ? CircularProgressIndicator() // show loader
                  : Expanded(
                      child: StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: productController.productList.length,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          return ProductTile(product: productController.productList[index]);
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
