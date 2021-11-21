import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:flappy_search_bar_ns/search_bar_style.dart';
import 'package:ucaa_datamgt/index.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Product> spdts = [];
  List<Bussiness> sbss = [];

  @override
  void initState() {
    super.initState();
    fetchPdts();
  }

  Future fetchPdts() async {
    final QuerySnapshot<Map<String, dynamic>> _productsStream =
        await FirebaseFirestore.instance
            .collection('products')
            .get()
            .whenComplete(() {});
    _productsStream.docs.forEach((doc) {
      var pdtModel = Product(
          category: '',
          created: '',
          imageUrl: '',
          description: '',
          pdtStatus: '',
          price: 1,
          pdtName: '',
          pdtQuantity: 1,
          pid: '',
          bsId: '',
          likes: [],
          viewed: [],
          comments: []);
      pdtModel.fromMap(doc.id, doc.data());
      spdts.add(pdtModel);
    });
  }

  Future<List<Product>> _getSearchProducts(String? text) async {
    List<Product> searchedProducts = [];
    searchedProducts.addAll(spdts.where((element) =>
        element.pdtName.toLowerCase().contains(text!.toLowerCase())));
    return searchedProducts;
  }

//  suggestions()  {
//     List<Product> sug = [];
//     sug.addAll(spdts
//         .where((element) => element.likes.contains(user!.uid)));
//     return sug;
//   }

  bool isPdt = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar<Product>(
              header: Card(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isPdt = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text(
                            'Search for Business | Filter',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w800),
                          ),
                          Icon(
                            Icons.sort,
                            size: 28,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              onSearch: _getSearchProducts,
              onItemFound: (Product? product, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext ctx) => ProductDetail(
                              documentId: product!.pid,
                              userId: '',
                            ),
                          )).then(
                        (value) {
                          setState(() {});
                        },
                      );
                    },
                    title: Text(
                      product.pdtName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).primaryColorDark),
                    ),
                    subtitle: Text(
                      'UGX ' +
                          product.price.toString().replaceAllMapped(
                              reg, (match) => '${match[1]},') +
                          '/=',
                      style: TextStyle(
                        fontSize: 14,
                        shadows: [
                          Shadow(
                            blurRadius: 1.0,
                            color: Theme.of(context).accentColor,
                            offset: Offset(0.0, 0.0),
                          ),
                        ],
                        fontWeight: FontWeight.w500,
                        // color: Colors.amber,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    trailing:
                        const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                );
              },
              textStyle: TextStyle(color: Theme.of(context).primaryColorDark),
              loader: const Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffb300)),
              )),
              minimumChars: 1,
              suggestions: spdts,
              // placeHolder: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Center(
              //       child: Container(
              //         padding: EdgeInsets.symmetric(
              //             horizontal: 10, vertical: 8),
              //         decoration: BoxDecoration(
              //             color: Theme.of(context).cardColor,
              //             borderRadius: BorderRadius.circular(10)),
              //         child: Text(
              //           'Search through all Products',
              //           style: TextStyle(
              //               fontSize: 16,
              //               color: Theme.of(context).primaryColorDark),
              //         ),
              //       ),
              //     ),
              //     SizedBox(height: 50),
              //     Image.asset('assets/images/searching.png'),
              //   ],
              // ),
              emptyWidget: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'No results Found!',
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Center(
                      //     child:
                      //         Image.asset('assets/images/not_found.png'))
                    ],
                  )),
              hintText: 'search product',
              cancellationWidget: Text(
                'Back',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).primaryColorDark),
              ),
              onCancelled: () {
                Navigator.pop(context);
                // print("Cancelled triggered");
              },
              icon: Icon(
                Icons.search,
                color: Theme.of(context).primaryColorDark,
              ),
              searchBarStyle: SearchBarStyle(
                backgroundColor: Theme.of(context).cardColor,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// builder: (context, snapshot) {
//         if (snapshot.hasData) {
// final List<Product> dataList = snapshot.data;
// List<Product> dataListFromSnapshot(QuerySnapshot querySnapshot) {
//   return querySnapshot.docs.map((snapshot) {
//     final Map<String, dynamic> dataMap =
//         snapshot.data()! as Map<String, dynamic>;

//     return Product(
//         description: dataMap['description'],
//         category: dataMap['category'],
//         imageUrl: dataMap['imageUrl'],
//         pdtName: dataMap['pdtName'],
//         created: dataMap['created'],
//         pdtStatus: dataMap['pdtStatus'],
//         price: dataMap['price'],
//         pid: dataMap['pid'],
//         bsId: '',
//         pdtQuantity: dataMap['pdtQuantity'],
//         likes: [], viewed: []);
//   }).toList();
// }
