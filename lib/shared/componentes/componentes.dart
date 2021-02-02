import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/layout/home_screen.dart';
import 'package:news_app/screens/facebook_feed/facebook_feed_screen.dart';
import 'package:news_app/screens/instgram_feed/instagram_feed_screen.dart';
import 'package:news_app/screens/settings/settings_screen.dart';
import 'package:news_app/screens/twitter_feed/twitter_feed_screen.dart';
import 'package:news_app/screens/welcome/welcome_screen.dart';
import 'package:news_app/shared/colors/colors.dart';
import 'package:news_app/shared/network/local/local.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

Widget logo() => Image(
  image: AssetImage('assets/images/news_logo.png'),
  fit: BoxFit.cover,
  height: 150,
  width: 150,
);

Widget defaultButton({
  Color background = Colors.indigo,
  double radius = 25.0,
  double width = double.infinity,
  @required Function function,
  @required String text,
  bool toUpper = true,
}) => Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: FlatButton(
        onPressed: function,
        child: Text(
          toUpper ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => widget),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);

Widget defaultTextBox({
  String title,
  String hint = ' ',
  bool isPassword = false,
  @required TextEditingController controller,
  @required TextInputType type,
}) => Container(
      padding: EdgeInsetsDirectional.only(
        start: 15,
        end: 10,
        top: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) detailsText(title),
          TextFormField(
            obscureText: isPassword,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
            controller: controller,
            keyboardType: type,
          ),
        ],
      ),
    );

Widget headText(String text) => Text(
  text,
  style: TextStyle(
    fontSize: 25,
  ),
);

Widget captionText(String text) => Text(
  text,
  style: TextStyle(
    fontSize: 16,
  ),
);

Widget detailsText(String text) => Text(
  text,
  style: TextStyle(
    fontSize: 14,
  ),
);

void showToast({@required text, @required error}) => Fluttertoast.showToast(
    msg: text.toString(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: error ? Colors.red : Colors.green,
    textColor: Colors.white,
    fontSize: 16.0);


void buildProgress({context, text, bool error = false}) => showDialog(
  context: context,
  builder: (context) => AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            if (!error) CircularProgressIndicator(),
            if (!error)
              SizedBox(
                width: 20,
              ),
            Expanded(child: Text(text)),
          ],
        ),
        if (error) SizedBox(height: 20),
        if (error)
          defaultButton(
            function: () {
              Navigator.pop(context);
            },
            text: "Cancel",
          ),
      ],
    ),
  ),
);

Widget headNewRow (auth , title , image){
  return  Padding(
    padding: EdgeInsets.all(9),
    child: Row(
      children: <Widget>[
        SizedBox(
          child: Image.network(image.toString()),
          width: 124,
          height: 124,
        ),
        SizedBox(width: 16,),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                '$title',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: Text('$auth')),
                  // Row(
                  //   children: <Widget>[
                  //     Icon(Icons.timer),
                  //     Text('15 min'),
                  //   ],
                  // ),
                ],

              ),

            ],
          ),
        ),
      ],
    ),
  );
}

Widget drawLine(){
  return Container(
    height: 1,
    width: double.infinity,
    color: Colors.grey.shade400,
  );
}   //to make line between topStories cards in headNews

Widget buildRecentCard(Color color,image , title ,ctx , time){
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: MediaQuery.of(ctx).size.height*0.25,
          child: Image.network(image.toString()),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 16 , top: 16 ),
          child: Container(
            padding: EdgeInsets.only(left: 24 ,right: 24,bottom: 2,top: 2),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadiusDirectional.circular(5)
            ),

            child: Text(
              "BBC NEWS",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16,right: 16,bottom: 8,top: 16),
          child: Text(
            '$title',
            style: TextStyle(
                fontSize: 18 ,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16 ,right: 16,top: 4,bottom: 8),
          // child: Row(
          //   children: <Widget>[
          //     Icon(
          //       Icons.timer,
          //       color: Colors.grey,
          //       size: 16,
          //     ),
          //
          //     SizedBox(width: 4),
          //
          //     // Text(
          //     //   '$time',
          //     //   style: TextStyle(
          //     //       color: Colors.grey,
          //     //       fontSize: 16
          //     //
          //     //   ),
          //     // ),
          //
          //   ],
          // ),
        ),
      ],
    ),
  );
}  //to make recent tile and cards
class NavMenuItem  {
  String title ;
  Function rote;
  NavMenuItem(this.title,this.rote);

}
Widget buildDrawer (ctx){

  List<NavMenuItem> navigationMenu =[
    NavMenuItem('Home Page', (){return HomeScreen();} ),
    NavMenuItem('Twitter Feed', (){return TwitterFeedScreen();} ),
    NavMenuItem('Instagram Feed', (){return InstagramFeedScreen();} ),
    NavMenuItem('Facebook Feed', (){return FacebookFeedScreen();} ),
   // NavMenuItem('Settings', (){return SettingsScreen();} ),
    NavMenuItem('LogOut', (){
      removeToken();
      return WelcomeScreen();
    } ),
  ];
  return Drawer(
    child: Padding(
      padding:  EdgeInsets.only(top:75,left: 10,right: 8 ),
      child: ListView.builder(
        itemCount: navigationMenu.length ,
        itemBuilder: (context,index){
          return Padding(
            padding: EdgeInsets.all(6),
            child: ListTile(
              title: Text(
                navigationMenu[index].title,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 22
                ),
              ),

              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return  navigationMenu[index].rote();}),

                );
              },

            ),
          );
        },
      ),
    ),
  );
}


Widget buildCountryItem({@required title, @required Widget shape,@required function})
=> Expanded(
  child: GestureDetector(
    onTap: function,
    child: Container(
      height: 140.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 10,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30.0,
            child: shape,
            backgroundColor: Colors.white,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            title.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),
  ),
);


Widget buildCardTitleSettings({@required title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        width: 30,
      ),
      Container(
        child: Text(title),
      ),
    ],
  );
}

Widget buildOneRowCardSettings(
    {@required text, @required Function function, @required String heroTag}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
      FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              OMIcons.keyboardArrowRight,
              color: Colors.black,
            ),
          ],
        ),
      ),
    ],
  );
}


Widget buildOneCardSettings({
  title,
  @required Function firstFunction,
  @required Function secondFunction,
  @required Function thirdFunction,
  @required fisrtText,
  @required secondText,
  @required thirdText,
  @required firstHeroTag,
  @required secondHeroTag,
  @required thirdHeroTag,
}) {
  return Column(
    children: [
      buildCardTitleSettings(title: title),
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  buildOneRowCardSettings(
                    function: firstFunction,
                    text: fisrtText,
                    heroTag: firstHeroTag,
                  ),
                  buildOneRowCardSettings(
                    function: secondFunction,
                    text: secondText,
                    heroTag: secondHeroTag,
                  ),
                  buildOneRowCardSettings(
                    function: thirdFunction,
                    text: thirdText,
                    heroTag: thirdHeroTag,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}


Widget buildNewsItems(news) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0,),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0,),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 5.0,),
      child: ExpansionTileCard(
        baseColor: Colors.white,
        expandedColor: Colors.white,
        elevation: 0.0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:defaultColor,
                image: DecorationImage(image: NetworkImage(
                  '${news['urlToImage']}' == null ? 'https://thumbs.dreamstime.com/z/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg' : '${news['urlToImage']}',
                )),
              ),
              width: 60,
              height: 60,
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${news['source']['name']}' == null ? '${news['author']}' :'${news['source']['name']}' ,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      // RatingBar.builder(
                      //   initialRating: 4.5,
                      //   minRating: 1,
                      //   direction: Axis.horizontal,
                      //   allowHalfRating: true,
                      //   itemCount: 5,
                      //   itemSize: 10.0,
                      //   ignoreGestures: true,
                      //   itemPadding: EdgeInsets.zero,
                      //   itemBuilder: (context, _) => Icon(
                      //     Icons.star,
                      //     color: Colors.amber,
                      //   ),
                      //   onRatingUpdate: (rating)
                      //   {
                      //     print(rating);
                      //   },
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '${news['title']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onExpansionChanged: (value)
        {

        },
        children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
        '${news['description']}',
        ),
      ),
          Padding(
            padding:  EdgeInsets.all(16.0),
            child:  Image.network(
              '${news['urlToImage']}' == null ?
              'https://thumbs.dreamstime.com/b/no-image-available-icon-photo-camera-flat-vector-illustration-132483097.jpg'
                  : '${news['urlToImage']}',
              // width:MediaQuery.of(context).size.width ,
            ),
          )
        ],
      ),
    ),
  );
}