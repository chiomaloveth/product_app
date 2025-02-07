import 'package:product_app/helpers/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _deviceHeight = 0;
  double _deviceWidth = 0;
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        "page":
            HomeContent(deviceHeight: _deviceHeight, deviceWidth: _deviceWidth),
      },
      {
        "page": DiscoverPage(),
      },
      {
        "page": OrdersPage(),
      },
      {
        "page": AccountPage(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _pages[_selectedPageIndex]["page"]
          as Widget, // Render the selected page
      bottomNavigationBar: _bottomNavBar(_selectedPageIndex, _selectPage),
    );
  }
}

class HomeContent extends StatelessWidget {
  final double deviceHeight;
  final double deviceWidth;

  const HomeContent({
    required this.deviceHeight,
    required this.deviceWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.5),
      child: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _topTitle(),
                const SizedBox(height: 30),
                _searchTextField(),
                const SizedBox(height: 50),
                _topPicks(deviceHeight, deviceWidth),
                const SizedBox(height: 50),
                _youMake(),
                const SizedBox(height: 20),
                _buildProductList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _topTitle() {
  return Row(
    children: [
      _loginDetails(),
      const SizedBox(width: 80),
      _iconButtons(),
    ],
  );
}

Widget _loginDetails() {
  return Consumer<AuthProvider>(
    builder: (context, auth, child) {
      return Text(
        "Hello, \n${auth.email ?? "Guest"}",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontFamily: "fredoka",
        ),
      );
    },
  );
}

Widget _iconButtons() {
  return Row(
    children: [
      Icon(
        Icons.chat,
        color: Color.fromRGBO(238, 87, 28, 1),
        weight: 20,
      ),
      const SizedBox(width: 20),
      Icon(
        Icons.shopping_cart_outlined,
        color: Color.fromRGBO(238, 87, 28, 1),
        weight: 20,
      ),
      const SizedBox(width: 20),
      Icon(
        Icons.notifications_none,
        color: Color.fromRGBO(238, 87, 28, 1),
        weight: 20,
      ),
    ],
  );
}

Widget _searchTextField() {
  return TextField(
    decoration: InputDecoration(
      labelText: 'Search Products/Vendors',
      border: const OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 2.0,
        ),
      ),
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner_sharp),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt_sharp),
            onPressed: () {},
          ),
        ],
      ),
      prefixIcon: const Icon(Icons.search_sharp),
    ),
    style: const TextStyle(color: Colors.grey),
  );
}

Widget _topPicks(double deviceHeight, double deviceWidth) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: deviceHeight + 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(238, 87, 28, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.emoji_events_outlined, size: 24, color: Colors.white),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Top Picks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Best Seller | Popular Supplier",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        right: 0,
        top: -80,
        child: Image.asset(
          'assets/images/preview.png',
          width: 216,
          height: 220,
        ),
      ),
    ],
  );
}

Widget _youMake() {
  return Text(
    "You May Like",
    style: TextStyle(
      fontSize: 25,
      fontFamily: "fredoka",
      color: Colors.black,
    ),
  );
}

Widget _buildProductList(BuildContext context) {
  final productProvider = Provider.of<ProductProvider>(context);
  final authProvider =
      Provider.of<AuthProvider>(context); // Access AuthProvider

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemCount: productProvider.products.length,
    itemBuilder: (context, index) {
      final product = productProvider.products[index];
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Make the image clickable
          GestureDetector(
            onTap: () {
              context.go(
                '/productDetail',
                extra: {
                  'product': product,
                  'authProvider': authProvider,
                },
              );
            },
            child: Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 5),
                Text(
                  product.description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 5),
                Text(
                  "\₦${product.price}",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget _bottomNavBar(int selectedPageIndex, Function(int) selectPage) {
  return BottomNavigationBar(
    currentIndex: selectedPageIndex,
    onTap: selectPage,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
    selectedItemColor: Color.fromRGBO(238, 87, 28, 1),
    type: BottomNavigationBarType.fixed,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.discount_sharp),
        label: 'Discover',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Order',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Account',
      ),
    ],
  );
}
