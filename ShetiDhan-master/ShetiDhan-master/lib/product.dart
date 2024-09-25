import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test1/chatapp2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Product {
  final bool availability;
  final String imageUrl;
  final String name;
  final double price;
  final String type;
  final String userId;
  final String description;
  double averageRating;
  final String id;

  Product({
    required this.availability,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.type,
    required this.userId,
    required this.description,
    this.averageRating = 0.0,
    required this.id,
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      availability: data['availability'] ?? false,
      imageUrl: data['imageUrl'] ?? '',
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      type: data['type'] ?? '',
      userId: data['userId'] ?? '',
      description: data['description'] ?? '',
    );
  }
}
class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      initialRoute: '/',
      routes: {
        '/': (context) => ProductList(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}
class ProductList extends StatelessWidget {
  final CollectionReference productsCollection =
  FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: productsCollection.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        List<Product> products = snapshot.data!.docs
            .map((DocumentSnapshot document) =>
            Product.fromFirestore(document))
            .toList();

        if (products.length >= 2) {
          return ListView.builder(
            itemCount: (products.length / 2).ceil(),
            itemBuilder: (context, index) {
              int startIndex = index * 2;
              int endIndex = (index + 1) * 2;
              if (endIndex > products.length) {
                endIndex = products.length;
              }

              List<Product> rowProducts =
              products.sublist(startIndex, endIndex);

              // If this is the last row and it contains only one product, align it to the left
              if (rowProducts.length == 1 && endIndex == products.length) {
                return ProductCardRow(products: rowProducts, addToCart: addToCart, alignLeft: true,);
              } else {
                return ProductCardRow(products: rowProducts, addToCart: addToCart);
              }
            },
          );
        } else {
          return const Text('Not enough products to display');
        }


      },
    );
  }

  void addToCart(BuildContext context, Product product) async {
    try {
      // Check if the product is already in the cart
      QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .where('id', isEqualTo: product.id)
          .get();

      if (cartSnapshot.docs.isNotEmpty) {
        // If the product is already in the cart, show a tooltip
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.name} is already in your cart.'),
          ),
        );
      } else {
        // If the product is not in the cart, add it to Firestore
        await FirebaseFirestore.instance.collection('cart').add({
          'id': product.id,
          'name': product.name,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'ProductId': product.userId,
          'Description': product.description,
          // Add other fields as needed
        });
        print('Added ${product.name} to cart');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.name} added to your cart.'),
          ),
        );
      }
    } catch (e) {
      print('Error adding product to cart: $e');
    }
  }
}

class ProductCardRow extends StatelessWidget {
  final List<Product> products;
  final void Function(BuildContext, Product) addToCart;
  final bool alignLeft;

  const ProductCardRow({Key? key, required this.products, required this.addToCart,this.alignLeft = true, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignLeft ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: products
          .map(
            (product) => Expanded(
          child: ProductCard(product: product, addToCart: addToCart),
        ),
      ).followedBy([
        // Add an empty Expanded if there is only one product
        if (products.length == 1) Expanded(child: Container()),
    ])
          .toList(),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final void Function(BuildContext, Product) addToCart;

  const ProductCard({Key? key, required this.product, required this.addToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductDetailScreen when the product is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: MediaQuery.of(context).size.width * 0.0028,
            color: const Color(0xFF02B153),
          ),
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * 0.0444,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1396,
              decoration: BoxDecoration(
                image: product.imageUrl.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(product.imageUrl),
                        fit: BoxFit.fill,
                      )
                    : null, // No image if 'imageUrl' is empty
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Call addToCart method when the button is pressed
                addToCart(context, product);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: const Color(0xFF353535),
                  fontSize: MediaQuery.of(context).size.width * 0.0379,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(product.name),
                Text('\u{20B9}${product.price}/kg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
   late String productUserName = '';
  double userRating = 0.0;
  TextEditingController reviewController = TextEditingController();
  bool hasUserSubmittedRating = false;
  List<double> submittedRatings = [];
  void addToCart(BuildContext context, Product product) async {
    try {
      // Check if the product is already in the cart
      QuerySnapshot cartSnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .where('id', isEqualTo: product.id)
          .get();

      if (cartSnapshot.docs.isNotEmpty) {
        // If the product is already in the cart, show a tooltip
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.name} is already in your cart.'),
          ),
        );
      } else {
        // If the product is not in the cart, add it to Firestore
        await FirebaseFirestore.instance.collection('cart').add({
          'id': product.id,
          'name': product.name,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'ProductId': product.userId,
          'Description': product.description,
          // Add other fields as needed
        });
        print('Added ${product.name} to cart');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.name} added to your cart.'),
          ),
        );
      }
    } catch (e) {
      print('Error adding product to cart: $e');
    }
  }
   Future<void> fetchUserName(String userId) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        setState(() {
          productUserName = userSnapshot['name'];
        });
      }
    } catch (e) {
      print('Error fetching user name: $e');
    }
  }
   @override
  void initState() {
    super.initState();
    // Call fetchUserName method in initState to fetch user name
    fetchUserName(widget.product.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product.imageUrl),
                  fit: BoxFit.fill,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.name,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.0389,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\u{20B9}${widget.product.price.toStringAsFixed(2)}/kg',
              style: TextStyle(
                color: const Color(0xFF0D0D0D),
                fontSize: MediaQuery.of(context).size.width * 0.0389,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Average Rating: ${widget.product.averageRating.toStringAsFixed(1)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Available: ${widget.product.availability ? 'Yes' : 'No'}',
                ),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Description: ${widget.product.description}',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add to Cart functionality
                    addToCart(context, widget.product);
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: const Color(0xFF353535),
                      fontSize: MediaQuery.of(context).size.width * 0.0379,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: (){},
                  child: ElevatedButton(
                    onPressed: () {
                      // Chat functionality
                       Navigator.pushNamed(context,"/chat",arguments: productUserName);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    child: Text(
                      'Chat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.0379,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _buildAddReviewSection(),
          ],
        ),
      ),
    );
  }

  void _showRatingDialog() {
    setState(() {
      hasUserSubmittedRating = true;
      submittedRatings.add(userRating);
      double newAverageRating =
          (submittedRatings.reduce((a, b) => a + b) + userRating) /
              (submittedRatings.length + 1);

      // Update the average rating in the product object
      widget.product.averageRating = newAverageRating;

      // Update the average rating in Firestore
      updateAverageRatingInFirestore(newAverageRating);
    });
  }

  void updateAverageRatingInFirestore(double newAverageRating) {
    // Assuming you have a 'products' collection in Firestore
    final productDocRef =
    FirebaseFirestore.instance.collection('products').doc(widget.product.id);

    // Update the averageRating field in Firestore
    productDocRef.update({'averageRating': newAverageRating});
  }

  void _showAlreadySubmittedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rating Already Submitted'),
        content: const Text('You have already submitted a rating for this product.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildAddReviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        RatingBar.builder(
          initialRating: userRating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            // Handle rating updates
            setState(() {
              userRating = rating;
            });
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            if (!hasUserSubmittedRating) {
              _showRatingDialog();
            } else {
              // Inform the user that they have already submitted a rating
              _showAlreadySubmittedDialog();
            }
          },
          child: const Text('Submit Rating'),
        ),
      ],
    );
  }
}

