import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../product.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('cart').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          List<QueryDocumentSnapshot> cartDocs = snapshot.data!.docs;
          print(cartDocs[0].data());

          if (cartDocs.isEmpty) {
            return Center(
              child: Text('Your cart is empty.'),
            );
          }

          return ListView.builder(
            itemCount: cartDocs.length,
            itemBuilder: (context, index) {
              // Get data from each document in the cart collection
              Map<String, dynamic> data = cartDocs[index].data() as Map<String, dynamic>;

              // Check if the 'imageUrl' field exists in the document

                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) async {
                    // Remove the item from the cart when dismissed
                    await FirebaseFirestore.instance.collection('cart').doc(cartDocs[index].id).delete();
                  },
                  background: Container(
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 36,
                    ),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                  ),
                  direction: DismissDirection.endToStart,
                  child: GestureDetector(
                    onTap: () async {
                      try {
                        // Get the productId of the selected item in the cart
                        String productId = cartDocs[index]['id'];

                        // Query the products collection in Firestore to find the product with the matching productId
                        DocumentSnapshot productSnapshot = await FirebaseFirestore.instance.collection('products').doc(productId).get();

                        // Check if the product exists
                        if (productSnapshot.exists) {
                          // Construct the Product object using data from Firestore
                          Product product = Product.fromFirestore(productSnapshot);

                          // Navigate to ProductDetailScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                product: product,
                              ),
                            ),
                          );
                        } else {
                          print('Product not found');
                          // Handle the case where the product document does not exist
                        }
                      } catch (e) {
                        print('Error fetching product details: $e');
                        // Handle any errors that occur during the process
                      }
                    },

                    child: ListTile(
                      leading: Image.network(data['imageUrl']),
                      title: Text(data['name']),
                      subtitle: Text('\u{20B9}${data['price']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () async {
                          // Save a reference to the document before deleting it
                          DocumentSnapshot removedProduct = cartDocs[index];

                          // Remove the item from the cart when the remove icon is pressed
                          await FirebaseFirestore.instance.collection('cart').doc(cartDocs[index].id).delete();

                          // Show a popup (SnackBar) to notify the user that the product has been removed
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${data['name']} removed from the cart.'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () async {
                                  // Undo action: Re-add the product to the cart
                                  await FirebaseFirestore.instance.collection('cart').add(
                                    removedProduct.data() as Map<String, dynamic>, // Cast to Map<String, dynamic>
                                  );

                                  // You may want to handle any additional logic related to undoing the action
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      // Add more fields as needed
                    ),


                  ),
                );

            },
          );
        },
      ),
    );
  }
}
