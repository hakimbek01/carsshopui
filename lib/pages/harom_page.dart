import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    list[0]=true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Cars',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.notifications_outlined,color: Colors.black,),
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(CupertinoIcons.cart_fill,color: Colors.black,),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, ch) {
                return _tapBar(ch,);
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _shopCars(
                    name: 'Corvette',
                    narx: 'Daxuya puling yetmaydi',
                    engine: 'Salarka',
                    image: 'assets/images/im_car1.jpg'
                  ),
                  _shopCars(
                    name: 'Ravon Nexiya 3',
                    narx: 'Moshinni ollidagila qimmat',
                    engine: 'Jonli mator pizdesa',
                    image: 'assets/images/1.jpg'
                  ),
                  _shopCars(
                      name: 'Ravon Nexiya 3',
                      engine: 'Uxx blaa',
                      narx: 'Yana aytaman qimmat',
                      image: 'assets/images/img.png'
                  ),
                  _shopCars(
                    name: "Lamborghine",
                    narx: '122121',
                    engine: 'Benzin I94',
                    image: 'assets/images/im_car2.jpg'
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<bool> list = List.generate(4, (index) => false);


  List<String> listNames=[
    'All',
    'Red',
    'Blue',
    'Green'
  ];
  Widget _tapBar(int index) {
    int currentIndex = index;
    return GestureDetector(
      onTap: (){
        setState(() {
          list = List.generate(4, (index) => false);
          list[currentIndex] = true;
        });
      },
      child: Container(
            margin: EdgeInsets.symmetric(horizontal:20),
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              color: (list[currentIndex]) ? Colors.red:Colors.grey.shade200,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Center(
                child: Text(
                  '${listNames[currentIndex]}',
                  style: TextStyle(
                      fontWeight: list[currentIndex]?
                      FontWeight.bold:FontWeight.normal),
                ),
            )
      ),
    );
  }


  Widget _shopCars({name,narx,image,engine}) {
    return Container(
      height: 230,
      width: double.infinity,
      margin: EdgeInsets.only(top: 20,right: 20,left: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 10,
            offset: Offset(0,10)
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.6),
              Colors.black.withOpacity(.3),
              Colors.black.withOpacity(.2)
            ]
          )
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(name,style: TextStyle(color: Colors.white,fontSize: 22),),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10,left: 10,right: 10),
                      child: Text(engine,style: TextStyle(color: Colors.red,fontSize: 17,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text("$narx\$",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.red.shade200,
                child: LikeButton(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  size: 20,
                  likeBuilder: (isLiked) {
                    return (isLiked)? Icon(CupertinoIcons.heart_fill,color: Colors.red,):Icon(CupertinoIcons.heart,color: Colors.red,);
                  },
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
