import 'package:flutter/material.dart';
import 'package:news_app/shared/componentes/componentes.dart';

class TwitterFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feed'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed:(){} ),
        ],
      ),
      drawer: buildDrawer(context),

      body: ListView.builder(itemBuilder: (context,index){

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Card(
            child: Column(
              children: <Widget>[
                _cardHeader(),
                _cardBody(),
                _drawLine(),
                _cardFooter(),
              ],
            ),
          ),
        );
      },
        itemCount: 20,
        padding: EdgeInsets.all(8),
      ),
    );
  }

  Widget _cardHeader (){
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/egypt.png'),
            radius: 24,
          ),
        ),
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

                Text('@zoz_ziead',style: TextStyle(color: Colors.grey),),
              ],
            ),

            SizedBox(height: 8,),
            Text("Fri,12 May 2017.14.30",style: TextStyle(color: Colors.grey),)
          ],
        ),

      ],
    );
  }

  Widget _cardBody (){
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
      child: Text("Optimism is the one quality more associated with "
          "success and happiness than any other.” — Brian Tracy",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 1.3,
          color: Colors.grey.shade900,
        ),
      ),
    );
  }

  Widget _cardFooter (){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[

              IconButton(icon: Icon(Icons.repeat,size: 30,),
                onPressed: (){},
                color: Colors.orange,
              ),

              Text(
                '25',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
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

  Widget _drawLine(){
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top: 12),
    );
  }

}
