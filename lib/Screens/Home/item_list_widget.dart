import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:my_app/Screens/Home/CE_description.dart';
import '../../Settings/settings.dart';
import 'item_description.dart';
import 'image_slider.dart';
import 'PC_description.dart';

class ItemListWidget extends StatefulWidget {
  final FirebaseUser user;
  final List<String> currentFav;
  ItemListWidget({@required this.user, @required this.currentFav});
  @override
  _ItemListWidgetState createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  int currPage;
  List<String> itemName = [  //Featured Restaurants & top scroller
    'Delhi Darbar',
    'Pizza Hut',
    'Burger King',
    'Delhi Dine',
  ];
  List<String> itemName2 = [  //Covid Essential 
    'Balaji Kirana',
    'Sri Balaji Store',
    'Fresh Wagon',
    'Ganga Store',
  ];
  List<String> itemName3 = [  //People's choice
    'Shahi Thali',
    'Idli Sambhar',
    'Samosa',
    'Choco Lava',
  ];

  List<String> addressName = [  //Featured Restaurants & top scroller
    'Sector 4 Anand Vihar, Delhi',
    '321, Hauz Khas, Delhi',
    'Area 44, Noida, UP',
    'Lane-6, Old Delhi',
  ];
  List<String> addressName2 = [  //Covid Essentail
    '24, Ashok Nagar, Delhi',
    'Lane-3 Lal Qila, Delhi',
    'Sector 4, Noida, UP',
    'GandhiNagar, Delhi',
  ];
  List<String> addressNam3 = [  //People's Choice
    '12, Karol Bagh, Delhi',
    '163, Hauz Khas, Delhi',
    '621, Rajiv Chock, UP',
    'Indraprasth, Delhi',
  ];
  List<String> time = [
    '8:00AM--10:00PM',
    '10:00AM--8:00PM',
    '9:00AM--9:00PM',
    '8:30AM--9:00PM',
  ];
  List<String> time2 = [  //Covid Essential
    '7:00AM--10:00AM',
    '7:00AM--10:00AM',
    '7:00AM--10:00AM',
    '7:30AM--10:00AM',
  ];
  List<double> itemPrice = [
    10.00,
    10.10,
    10.25,
    10.25,
  ];
  List<double> itemPrice3 = [  //People's Choice
    230.00,
    175.10,
    25.25,
    85.25,
  ];

  List<String> itemURLImageSlider = [
    'https://www.ahstatic.com/photos/b1j0_rsr007_00_p_1024x768.jpg',
    'https://cdn.vox-cdn.com/thumbor/HT2NgRK4S9gMD0RtaKyLywZmGhE=/0x0:2661x1774/1400x1050/filters:focal(1115x657:1539x1081):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/64082468/Pizza_Hut_Athens_OH_USAedit.0.jpeg',
    'https://images.indianexpress.com/2020/11/burger-king-india-bloomberg-1200.jpg',
    'https://images.pexels.com/photos/6126306/pexels-photo-6126306.jpeg',
  ];
  List<String> itemURLImageSlider2 = [//Covid Essesntial
  
    'https://www.marketplace.org/wp-content/uploads/2020/11/bodega.jpg',
    'https://economictimes.indiatimes.com/thumb/msid-75639471,width-1200,height-900,resizemode-4,imgsize-1187687/grocery-store-ap.jpg',
    'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/09/17/GettyImages-840320076.jpg.rend.hgtvcom.441.294.suffix/1600366155467.jpeg',
    'https://content.fortune.com/wp-content/uploads/2017/02/rtx1mwxa.jpg',
  ];
  List<String> itemURLImageSlider3 = [ //People's Choice
    'https://thumbs.dreamstime.com/b/indian-thali-dinner-indian-thali-dinner-168622201.jpg',
    'https://images.pexels.com/photos/674574/pexels-photo-674574.jpeg',
    'https://images.pexels.com/photos/2474658/pexels-photo-2474658.jpeg',
    'https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg',
  ];
  List<String> itemURLImage = [  
    'https://upload.wikimedia.org/wikipedia/commons/4/4e/Single_apple.png',
    'https://cdn.pixabay.com/photo/2016/02/23/17/42/orange-1218158_960_720.png',
    'https://images.vexels.com/media/users/3/160371/isolated/preview/6c40e6ebea6870c673bc72d8f215724d-milk-box-milk-cow-illustration-by-vexels.png',
    'https://pngimg.com/uploads/cheese/cheese_PNG25300.png',
  ];

  List<String> currentFavorites = [];
  bool initCurrent = true;

  @override
  Widget build(BuildContext context) {
    if (initCurrent) {
      setState(() {
        currPage = 0;
        currentFavorites = widget.currentFav;
        initCurrent = false;
      });
    }
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AppBar(
            elevation: 0,
            actions: <Widget>[
              Container(
                color: MainColors.whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search Restaurants...',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
          /* Container(
            height: 50,
            color: MainColors.whiteColor,
            padding: EdgeInsets.all(4.0),
            //margin: EdgeInsets.all(2.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                    width: 120,
                    //color: Colors.grey[400],
                    child: const Center(
                        child: Text(
                      'Veg',
                      style:
                          TextStyle(fontSize: 15, color: MainColors.blackColor),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 1),
                        color: Colors.orange[400])),
                Container(
                    width: 120,
                    //color: MainColors.whiteColor,
                    child: const Center(
                        child: Text(
                      'Non-Veg',
                      style:
                          TextStyle(fontSize: 15, color: MainColors.blackColor),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey[400], width: 1),
                        color: Colors.orange[400])),
                Container(
                    width: 120,
                    //color: Colors.grey[400],
                    child: const Center(
                        child: Text(
                      'Chinese',
                      style:
                          TextStyle(fontSize: 15, color: MainColors.blackColor),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 1),
                        color: Colors.orange[400])),
                Container(
                    width: 120,
                    //color: MainColors.whiteColor,
                    child: const Center(
                        child: Text(
                      'Continental',
                      style:
                          TextStyle(fontSize: 15, color: MainColors.blackColor),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey[500], width: 1),
                        color: Colors.orange[400])),
                Container(
                    width: 120,
                    //color: Colors.grey[400],
                    child: const Center(
                        child: Text(
                      'Mexican',
                      style:
                          TextStyle(fontSize: 15, color: MainColors.blackColor),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 1),
                        color: Colors.orange[400])),
                Container(
                  
                    width: 120,
                    //color: MainColors.whiteColor,
                    child: const Center(
                        child: Text(
                      'Italian',
                      style:
                          TextStyle(fontSize: 15, color: MainColors.blackColor),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey[500], width: 1),
                        color: Colors.orange[400])),
                Container(
                    width: 120,
                    //color: Colors.grey[400],
                    child: const Center(
                        child: Text(
                      'Combo-Meals',
                      style:
                          TextStyle(fontSize: 15, color: MainColors.blackColor),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 1),
                        color: Colors.orange[400])),
              ],
            ),
          ), */
          Stack(
            children: <Widget>[
              Container(
                height: 210,
                child: PageView.builder(
                  onPageChanged: (int currentPage) {
                    currPage = currentPage;
                    Provider.of<ImageSlider>(context, listen: false)
                        .actualPage(currPage);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ItemDescription.routeName,
                          arguments: [
                            itemName[index],
                            itemPrice[index],
                            itemURLImageSlider[index],
                            
                            widget.user,
                            //addressName[index],
                            currentFavorites
                          ],
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            child: Image.network(
                              itemURLImageSlider[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.black.withOpacity(0.1),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FittedBox(
                                  child: Text(
                                    itemName[index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                                FittedBox(
                                  child: Text(
                                    addressName[index],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                                FittedBox(
                                  child: Text(
                                    time[index],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: itemURLImageSlider.length,
                ),
              ),
              Consumer<ImageSlider>(builder: (context, imageSlider, widget) {
                return imageSlider.getDotsWidget(currPage);
              })
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 14, top: 14),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Covid Essential Stores',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [ 
                            Row(
                              children: List.generate(
                                4,
                                (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        Description.dir,
                                        arguments: [
                                          itemName2[index],
                                          itemPrice[index],
                                          itemURLImageSlider2[index],
                                          widget.user,
                                          currentFavorites
                                        ],
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 90,
                                            width: 150,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight:
                                                      Radius.circular(15)),
                                              child: Image.network(
                                                itemURLImageSlider2[index],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(8),
                                            height: 80,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                color: MainColors.whiteColor,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                )),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                FittedBox(
                                                  child: Text(
                                                    itemName2[index],
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                                FittedBox(
                                                  child: Text(
                                                    addressName2[index],
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                                FittedBox(
                                                  child: Text(
                                                    time2[index],
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 14, top: 14),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Featured Restaurants',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 200,
                        child: CustomScrollView(
                          scrollDirection: Axis.horizontal,
                          slivers: <Widget>[
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  Row(
                                    children: List.generate(
                                      4,
                                      (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                              ItemDescription.routeName,
                                              arguments: [
                                                itemName[index],
                                                itemPrice[index],
                                                itemURLImageSlider[index],
                                                
                                                widget.user,
                                                //addressName[index],
                                                currentFavorites,
                                                
                                              ],
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  height: 90,
                                                  width: 150,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(15),
                                                            topRight:
                                                                Radius.circular(
                                                                    15)),
                                                    child: Image.network(
                                                      itemURLImageSlider[
                                                          index],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(8),
                                                  height: 80,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          MainColors.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(15),
                                                      )),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      FittedBox(
                                                        child: Text(
                                                          itemName[index],
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          addressName[index],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          time[index],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 6, bottom: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "People's Choice",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: 212,
                        child: CustomScrollView(
                          scrollDirection: Axis.horizontal,
                          slivers: <Widget>[
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  Row(
                                    children: List.generate(
                                      4,
                                      (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                              PeopleDescription.rouName,
                                              arguments: [
                                                itemName3[index],
                                                itemPrice3[index],
                                                itemURLImageSlider3[index],
                                                widget.user,
                                                currentFavorites
                                              ],
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(6),
                                            child: Stack(
                                              children: <Widget>[
                                                Container(
                                                  height: 200,
                                                  width: 150,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Image.network(
                                                      itemURLImageSlider3[
                                                          index],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      FittedBox(
                                                        child: Text(
                                                          itemName3[index],
                                                          style: TextStyle(
                                                              backgroundColor:
                                                                  Colors.black
                                                                      .withOpacity(
                                                                          0.3),
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: MainColors
                                                                  .whiteColor),
                                                        ),
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          addressNam3[index],
                                                          style: TextStyle(
                                                              backgroundColor:
                                                                  Colors.black
                                                                      .withOpacity(
                                                                          0.3),
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                      FittedBox(
                                                        child: Text(
                                                          time[index],
                                                          style: TextStyle(
                                                              backgroundColor:
                                                                  Colors.black
                                                                      .withOpacity(
                                                                          0.3),
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text('Deliver to 1000 road'),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Column(
                      //     children: List.generate(
                      //         itemName.length,
                      //         (index) => LayoutBuilder(
                      //               builder: (context, constrains) {
                      //                 return Row(
                      //                   children: <Widget>[
                      //                     Container(
                      //                       width: constrains.maxWidth / 6 * 5,
                      //                       child: GestureDetector(
                      //                         behavior: HitTestBehavior.translucent,
                      //                         onTap: () {
                      //                           Navigator.of(context).pushNamed(
                      //                               ItemDescription.routeName,
                      //                               arguments: [
                      //                                 itemName[index],
                      //                                 itemPrice[index],
                      //                                 itemURLImage[index]
                      //                               ]);
                      //                         },
                      //                         child: Padding(
                      //                           padding: const EdgeInsets.all(8.0),
                      //                           child: Row(
                      //                             crossAxisAlignment:
                      //                                 CrossAxisAlignment.start,
                      //                             children: <Widget>[
                      //                               Container(
                      //                                 decoration: BoxDecoration(
                      //                                     borderRadius:
                      //                                         BorderRadius.circular(
                      //                                             15),
                      //                                     color:
                      //                                         MainColors.whiteColor),
                      //                                 child: CircleAvatar(
                      //                                   radius: 35,
                      //                                   child: Image.network(
                      //                                       itemURLImage[index]),
                      //                                   backgroundColor:
                      //                                       Colors.transparent,
                      //                                 ),
                      //                               ),
                      //                               SizedBox(
                      //                                 width: 30,
                      //                               ),
                      //                               //Expanded(child: SizedBox()),
                      //                               Column(
                      //                                 crossAxisAlignment:
                      //                                     CrossAxisAlignment.start,
                      //                                 children: <Widget>[
                      //                                   Text(
                      //                                     itemName[index],
                      //                                     style: TextStyle(
                      //                                         fontSize: 20,
                      //                                         fontWeight:
                      //                                             FontWeight.bold),
                      //                                   ),
                      //                                   Padding(
                      //                                     padding:
                      //                                         const EdgeInsets.all(
                      //                                             3.0),
                      //                                     child: Row(
                      //                                       children: <Widget>[
                      //                                         Icon(
                      //                                           Icons.star,
                      //                                           color: Colors.orange,
                      //                                         ),
                      //                                         Text(
                      //                                           '4.5',
                      //                                           style: TextStyle(
                      //                                               fontWeight:
                      //                                                   FontWeight
                      //                                                       .bold),
                      //                                         ),
                      //                                         Text(
                      //                                           '  Grocery food',
                      //                                           style: TextStyle(
                      //                                               color:
                      //                                                   Colors.grey),
                      //                                         )
                      //                                       ],
                      //                                     ),
                      //                                   ),
                      //                                   Container(
                      //                                     padding: EdgeInsets.all(5),
                      //                                     decoration: BoxDecoration(
                      //                                         borderRadius:
                      //                                             BorderRadius
                      //                                                 .circular(8),
                      //                                         color: Colors.grey
                      //                                             .withOpacity(0.3)),
                      //                                     child: Row(
                      //                                       children: <Widget>[
                      //                                         Icon(
                      //                                           Icons.monetization_on,
                      //                                           color: Colors.grey,
                      //                                         ),
                      //                                         Text(itemPrice[index]
                      //                                                 .toStringAsFixed(
                      //                                                     2) +
                      //                                             ' \$'),
                      //                                       ],
                      //                                     ),
                      //                                   )
                      //                                 ],
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Container(
                      //                       width: constrains.maxWidth / 6,
                      //                       child: IconButton(
                      //                         icon: Icon(
                      //                           currentFavorites
                      //                                   .contains(itemName[index])
                      //                               ? Icons.favorite
                      //                               : Icons.favorite_border,
                      //                           color: Colors.red,
                      //                         ),
                      //                         onPressed: () {
                      //                           favorites(itemName[index]);
                      //                         },
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 );
                      //               },
                      //             ))),
                    ],
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
