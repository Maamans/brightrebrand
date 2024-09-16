import 'package:brightmain/model/food_item.dart' as foodModel;
import 'package:brightmain/screens/productsdetails.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  // List of product data
  final List<foodModel.Product> products = [
    foodModel.Product(name: 'Carrot', image: 'images/product.jpeg', description: 'Fresh and organic carrots.'),
    foodModel.Product(name: 'Tomato', image: 'images/product.jpeg', description: 'Ripe and juicy tomatoes.'),
    foodModel.Product(name: 'Cabbage', image: 'images/product.jpeg', description: 'Healthy green cabbage.'),
    foodModel.Product(name: 'Broccoli', image: 'images/product.jpeg', description: 'Rich in nutrients, fresh broccoli.'),
    foodModel.Product(name: 'Spinach', image: 'images/product.jpeg', description: 'Leafy green spinach.'),
    foodModel.Product(name: 'Lettuce', image: 'images/product.jpeg', description: 'Crisp and fresh lettuce.'),
    foodModel.Product(name: 'Peppers', image: 'images/product.jpeg', description: 'Colorful sweet peppers.'),
    foodModel.Product(name: 'Onion', image: 'images/product.jpeg', description: 'Freshly harvested onions.'),
    foodModel.Product(name: 'Garlic', image: 'images/product.jpeg', description: 'Organic garlic cloves.'),
    foodModel.Product(name: 'Cucumber', image: 'images/product.jpeg', description: 'Cool and refreshing cucumbers.'),
    foodModel.Product(name: 'Potato', image: 'images/product.jpeg', description: 'Golden, fresh potatoes.'),
    foodModel.Product(name: 'Zucchini', image: 'images/product.jpeg', description: 'Healthy zucchini for your meals.'),
  ];

  // Controller for search input
  TextEditingController searchController = TextEditingController();

  // This will store the filtered product list
  List<foodModel.Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    // Initially, all products are displayed
    filteredProducts = products;
  }

  // Function to filter products based on the search query
  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        // If the search query is empty, show all products
        filteredProducts = products;
      } else {
        // Filter the products based on the search query
        filteredProducts = products.where((product) {
          return product.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Ecosystem'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Add your button action here
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Search bar at the top
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search in here',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                filterProducts(value); // Filter the products as the user types
              },
            ),
          ),

          // Horizontal sliding images (categories or product images)
          SizedBox(
            height: 120, // Adjust height as needed
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildImageCard('images/product1.jpeg'), // Replace with actual images from assets
                _buildImageCard('images/product2.jpeg'),
                _buildImageCard('images/product3.jpeg'),
                _buildImageCard('images/product4.jpeg'),
                _buildImageCard('images/product5.jpeg'),
              ],
            ),
          ),

          // "Available Products" title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Available Products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See more',
                  style: TextStyle(fontSize: 14, color: Colors.green),
                ),
              ],
            ),
          ),

          // Grid of products
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Set to 3 to have three cards per row
                childAspectRatio: 0.8,
              ),
              itemCount: filteredProducts.length, // Use filtered products
              itemBuilder: (BuildContext context, int index) {
                final product = filteredProducts[index];
                return _buildProductItem(product, context);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to create horizontal image cards
  Widget _buildImageCard(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7), // Slightly white background with opacity
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Optional shadow for better effect
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // Function to create grid product items
  Widget _buildProductItem(foodModel.Product product, BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Product image at the top
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              product.image,
              width: double.infinity,
              height: 82, // Adjust as per your design
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Product name, bold text
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4), // Space between name and description

                // Short description
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 8), // Space between description and button

                // Buy button
                SizedBox(
                  width: 100, // Adjust the width of the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to ProductDetails page and pass the product
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(product: product),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Green background
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Buy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White bold text
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
