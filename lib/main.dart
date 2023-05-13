import 'package:flutter/material.dart';
import 'package:aiswaryam/Data.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aiswaryam Organics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Aiswaryam Organics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _photos=[
    Data(image:"assets/one.jpg",text:"Lady's Finger"),
    Data(image:"assets/two.webp",text:"Tomato"),
    Data(image:"assets/three.jpg",text:"Cauli Flower"),
    Data(image:"assets/four.jpg",text:"Capsicum"),
    Data(image:"assets/five.jpg",text:"Beetroot"),
    Data(image:"assets/six.jpg",text:"Bottle Gourd"),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.white,

        title: Text("AISWARYAM ORGANICS",style: TextStyle(color: Colors.green,fontSize: 16),),
        actions: <Widget>[
    //IconButton
    IconButton(

      color: Colors.green,
    icon: const Icon(Icons.shopping_cart),
    tooltip: 'Orders',
    onPressed: () {},
     ),
          IconButton(
            color: Colors.green,
            icon: const Icon(Icons.person_pin),
            tooltip: 'Profile',
            onPressed: () {},
          ),
    //       IconButton(
    //         padding:   EdgeInsets.symmetric(horizontal:1),
    //         color: Colors.green,
    //         icon: const Icon(Icons.search),
    //         tooltip: 'Search',
    //         onPressed: () {},
    //        ),
          // IconButton(
          //      padding:   EdgeInsets.symmetric(horizontal: 2),
          //   color: Colors.green,
          //   icon: const Icon(Icons.whatsapp),
          //   tooltip: 'WhatsApp',
          //   onPressed: () {},
          //  ),
          // Text(
          //   "About Us",
          //   //textScaleFactor: 1.5,
          //   style: new TextStyle(
          //     fontSize: 12.0,
          //     color: Colors.green,
          //   ),
          // ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            SizedBox(height: 100,width: 100,),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Shop'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('My Orders'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('WhatsApp'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('About Us'),
            ),
          ],
        ),
      ),
      body:  Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          SizedBox(height: 20.0),

          DefaultTabController(
              length: 8, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  child: TabBar(
                    isScrollable: true,
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Organic Vegetables'),
                      Tab(text: 'Organic Greens'),
                      Tab(text: 'Organic Fruits'),
                      Tab(text: 'Millets'),
                      Tab(text: 'Nuts'),
                      Tab(text: 'Spices'),
                      Tab(text: 'Instant Mix'),

                    ],
                  ),
                ),
                Container(
                    height: 400, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: <Widget>[
                        new SizedBox(height: 20.0),
                        new Container(
                          child: new ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return new Column(
                                children: <Widget>[
                                  new Container(
                                    height: 50.0,
                                    color: Colors.green,
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Icon(Icons.format_list_numbered,
                                            color: Colors.white),
                                        new Padding(
                                            padding: const EdgeInsets.only(right: 5.0)),
                                        new Text('List Item',
                                            style: new TextStyle(
                                                fontSize: 20.0, color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                  new Container(
                                    height: 150.0,
                                    child: new ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return new Card(
                                          elevation: 5.0,
                                          child: new Container(
                                            height: MediaQuery.of(context).size.width / 3,
                                            width: MediaQuery.of(context).size.width / 3,
                                            alignment: Alignment.center,
                                            child: new Text('Item $index'),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  new SizedBox(height: 20.0),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                     GridView.builder(
                       itemCount:_photos.length,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10), itemBuilder: (context,index){
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           
                           child: Column(
                             children: [
                               Container(
                                 height:100,width: 100,
                                 margin: EdgeInsets.all(8),
                                 decoration: BoxDecoration(
                                   border: Border.all(
                                       color: Colors.green,
                                       width: 5.0,
                                       style: BorderStyle.solid
                                   ),
                                   borderRadius: BorderRadius.circular(20),
                                   image:  DecorationImage(image: AssetImage(_photos[index].image),fit:BoxFit.cover)
                                 ),
                               ),
                               SizedBox(height:10),
                                Text(_photos[index].text),
                             ],

                           ));
                     }),
                      Container(
                        child: Center(
                          child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('Display Tab 4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),

                    ])
                )
              ])
          ),
        ]),
      )

    );

  }
}
