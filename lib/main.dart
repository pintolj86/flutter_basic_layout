import 'package:flutter/material.dart';
import 'screen_helper.dart';

void main() {
  runApp(App());
}


class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layouts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenBuilder(),//ScreenBuilder(),
    );
  }
}

class ScreenBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Layout'),
      ),
      body: ScreenSelector(),
    );
  }
}

class ScreenSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (ScreenHelper.isSmallLayout(context)) {
      return SmallLayout();
    } else if (ScreenHelper.isMediumLayout(context)) {
      return MediumLayout();
    } else {
      return WideLayout();
    }
  }
}


class WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = ScreenHelper.getHeight(context);
    double width = ScreenHelper.getWidth(context);

    return Column(
      key: Key('small_layout'),
      children: [
        ImagePart(height: height / 2.5, width: width),
        TitlePart(height: height / 9, width: width),
        IconsPart(height: height / 9, width: width),
        TextPart(height: height / 3.5, width: width),  
      ],
    );
  }
}

class MediumLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = ScreenHelper.getHeight(context);
    double width = ScreenHelper.getWidth(context);

    return Column(
      key: Key('small_layout'),
      children: [
        ImagePart(height: height / 3.5, width: width),
        TitlePart(height: height / 6, width: width),
        IconsPart(height: height / 7, width: width),
        TextPart(height: height / 5, width: width),  
      ],
    );
  }
}

class SmallLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    double height = ScreenHelper.getHeight(context);
    double width = ScreenHelper.getWidth(context);

    return Column(
      key: Key('small_layout'),
      children: [
        ImagePart(height: height / 3, width: width),
        TitlePart(height: height / 8.5, width: width),
        IconsPart(height: height / 9, width: width),
        TextPart(height: height / 3.5, width: width),  
      ],
    );
  }
}


class TitlePart extends StatelessWidget {
  final double width;
  final double height;

  TitlePart({this.width, this.height});

  @override
  Widget build(BuildContext context) {
    var padding = EdgeInsets.all(10.0);
    if(ScreenHelper.isLargeLayout(context)) {
       padding = EdgeInsets.fromLTRB(10, 10, 100, 10);
    }
    return Container(
     
      padding: padding,
      width: width,
      height: height,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Oeschinen Lake Campground',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ]
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );
    
  }
}


class IconsPart extends StatelessWidget {
  final double width;
  final double height;
  IconsPart({this.width, this.height});
  
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Container(
      width: width,
      height: height,
      child: Row (  
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
      children: [
        IconsItem(iconName: Icons.call, color: color, label: 'CALL'),
        IconsItem(iconName: Icons.near_me, color:color, label: 'ROUTE'),
        IconsItem(iconName: Icons.share, color:color, label: 'SHARE',),
      ]
      ),
    ); 
  }
}

class IconsItem extends StatelessWidget {
  final IconData iconName;
  final Color color;
  final String label;

  IconsItem({this.iconName, this.color, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
        children :[
          Container(
            child: Icon(
              this.iconName,
              color: color,
            ),
          ),
          
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
    );
  }
}

class TextPart extends StatelessWidget {
  final double width;
  final double height;

  TextPart({this.width, this.height});

  @override
  Widget build(BuildContext context) {

    return Row(
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10), 
                child: Text(
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.',
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ), 
                  textAlign: TextAlign.justify,
                ),
                ),
              width: width,
              height: height,
            ),
          ],
        
    );
  }
}

class ImagePart extends StatelessWidget {
  final double width;
  final double height;

  ImagePart({this.width, this.height});
  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
            SizedBox(
              child: Image.asset(
                  'images/lake.jpeg',
                  fit: BoxFit.cover,
                ),
              width: width,
              height: height,
          ),
          ],
      );
  }
}

