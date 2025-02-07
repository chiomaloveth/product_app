import 'package:product_app/helpers/helper.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product; // Add product parameter
  final AuthProvider authProvider; // Add authProvider parameter

  const ProductPage({
    required this.product,
    required this.authProvider,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Product Information",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
          tabs: const [
            Tab(text: "Overview"),
            Tab(text: "Reviews"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(),
          const Center(child: Text("Reviews Coming Soon")),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Section
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(widget.product.imageUrl), // Use product image
              Icon(Icons.play_circle_fill, color: Colors.white, size: 60),
            ],
          ),

          // Product Details Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name, // Use product name
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  "\₦${widget.product.price}", // Use product price
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(238, 87, 28, 1),
                  ),
                ),
                const SizedBox(height: 10),

                // Pricing & Variations
                _buildPriceTable(),

                const SizedBox(height: 20),

                // Company Info
                _buildCompanyInfo(),

                const SizedBox(height: 20),

                // Delivery Info
                _buildDeliveryInfo(),

                const SizedBox(height: 20),

                // Action Buttons
                _buildActionButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceTable() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildPriceRow("₦35,000", "5-20 Pieces"),
          _buildPriceRow("₦28,000", "20-80 Products"),
          _buildPriceRow("₦20,000", "80 & Above"),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String price, String quantity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(price,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(quantity, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Company",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ListTile(
          leading: Icon(Icons.store, color: Colors.orange),
          title: const Text("Ghana Apparels & Couture"),
          subtitle: const Text("Maryland Crescent, Ikeja, Lagos."),
        ),
      ],
    );
  }

  Widget _buildDeliveryInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Delivery",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ListTile(
          leading: Icon(Icons.delivery_dining, color: Colors.green),
          title: const Text("Estimated by manufacturers"),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(238, 87, 28, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text("SEND INQUIRY",
                style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(238, 87, 28, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text(
              "BUY NOW",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
