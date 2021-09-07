import 'package:carousel_slider/carousel_slider.dart';
import'package:employ_newone/employ_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,


      drawer: Drawer(
        elevation: 6,
        child: Container(
          color: Colors.teal[300],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(
                          image: AssetImage(
                            'asset/image/profile.png',
                          ),
                          width: 65,
                          height: 65,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'John Dai',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Human Resourse',
                              style: TextStyle(
                                  color: Colors.white38, fontSize: 10),
                            )
                          ],
                        )
                      ],
                    )),
             Divider(height: 5, thickness: 2, color: Colors.white10),
                InkWell(
                  onTap: () => _scaffoldKey.currentState?.openEndDrawer(),
                  child: ListTile(
                    leading: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                      size: 26,
                    ),
                    title: Text(
                      'HOME',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Divider(height: 5, thickness: 2, color: Colors.white10),

                 InkWell( onTap: ()=> Navigator.pushNamed(
                   context,
                   '/employlist',
                 ),
                   child: ListTile(
                    leading: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 26,
                    ),
                    title: Text(
                      'Employee List',
                      style: TextStyle(color: Colors.white),
                    ),
                ),
                 ),
                Divider(height: 5, thickness: 2, color: Colors.white10),
                ListTile(
                  leading: Icon(
                    Icons.person_pin_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
                  title: Text(
                    'Employee Approved',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Divider(height: 5, thickness: 2, color: Colors.white10),
                ListTile(
                  leading: Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                    size: 26,
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Divider(height: 5, thickness: 2, color: Colors.white10),
                SizedBox(
                  height: 350,
                ),
                Row(
                  children: [
                    Text(
                      'Version 10.0.1',
                      style: TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Last Update On',
                      style: TextStyle(color: Colors.white60, fontSize: 11),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '09 May 2021 at 2:00 PM',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      appBar: AppBar(
        leading: IconButton(
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
            icon: Icon(
              Icons.menu_sharp,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        toolbarHeight: 65,
        titleSpacing: 10,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),

      body: Container(
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: Image(
                image: AssetImage(
                  "asset/image/splash_logo.png",
                ),
                height: 75,
                width: double.infinity,
              ),
            ),

                  CarouselSlider(
                        items: [2].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                            //    height: MediaQuery.of(context).size.height,
                                  margin: const EdgeInsets.only(bottom: 10.0),
                                  child: ClipRRect(

                                  //  borderRadius: BorderRadius.circular(8.0),
                                    child:   Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25.0),
                                      ),
                                      elevation: 5,
                                      child: Container(
                                        height: 480,
                                        width: 300,
                                        /*decoration:
                                          BoxDecoration(borderRadius: BorderRadius.circular(30)),*/
                                        child: Column(

                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image(
                                              image: AssetImage(
                                                "asset/image/static_img.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'SUPER LAMP',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    "Lorem ipsum is simply dummy text of the " +
                                                        "printing and typesting industry's Standard" +
                                                        " dummy text even since the 1500s.",
                                                    style:
                                                    TextStyle(color: Colors.black26, fontSize: 15),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 480.0,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          // aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                       //   pauseAutoPlayOnTouch: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 1,
                        ),
                      ),




           /* Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 5,
              child: Container(
                height: 480,
                width: 300,
                */

            /*decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),*/

            /*
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(
                        "asset/image/static_img.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'SUPER LAMP',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Lorem ipsum is simply dummy text of the " +
                                "printing and typesting industry's Standard" +
                                " dummy text even since the 1500s.",
                            style:
                                TextStyle(color: Colors.black26, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),*/



           ]
        )
      ), );
  }
}

























/* Widget _employDetail(int index) => */