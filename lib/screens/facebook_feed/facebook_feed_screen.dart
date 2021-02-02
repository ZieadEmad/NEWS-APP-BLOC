import 'package:flutter/material.dart';
import 'package:news_app/shared/componentes/componentes.dart';

class FacebookFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Facebook Feed'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed:(){} ),
        ],
      ),
      drawer: buildDrawer(context),
      body: ListView.builder(
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: Column(
                children: <Widget>[
                  _cardHeader(),
                  _cardBody(),
                  _cardBodyPhoto(context),
                  _cardFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );

  }
  Widget _cardHeader (){
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/australia.png'),
            radius: 24,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[

                    Text(
                      'ZieadEmad ',
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),

                    // Text('@zoz_ziead',style: TextStyle(color: Colors.grey),),
                  ],
                ),

                SizedBox(height: 8,),
                Text("Fri,12 May 2017.14.30",style: TextStyle(color: Colors.grey),)
              ],
            ),
            SizedBox(width: 80,),
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon:Icon(Icons.favorite),
                      onPressed:(){},
                      iconSize: 30,
                      color: Colors.grey,
                    ),
                    Text("25"),

                  ],
                ),
              ],
            ),

          ],
        ),


      ],
    );
  }
  Widget _cardBody (){
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16,),
            child: Text("We also talk about future of work as the robots",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height:1,
                color: Colors.grey.shade900,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton(onPressed: (){}, child: Text("#advance",style: TextStyle(color: Colors.orange),),),
              FlatButton(onPressed: (){}, child: Text("#retro",style: TextStyle(color: Colors.orange),),),
              FlatButton(onPressed: (){}, child: Text("#instagram",style: TextStyle(color: Colors.orange),),),
            ],
          ),
        ],
      ),
    );


  }
  Widget _cardBodyPhoto(ctx){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(ctx).size.height*0.50,
      decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage('assets/images/australia.png'),
            fit: BoxFit.cover,
          )
      ) ,
    );
  }
  Widget _cardFooter (){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Container(
              child: FlatButton(
                onPressed:(){} ,
                child: Text(
                  '10 COMMENTS',
                  style: TextStyle(
                    color: Colors.orange
                    ,)
                  ,)
                ,)
          ),

          Row(
            children: <Widget>[
              FlatButton(onPressed:(){} ,
                child: Text(
                  'SHARE',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),

              FlatButton(onPressed:(){} ,
                child: Text(
                  'OPEN',
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
