import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cryptography'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var finalpoints=[];
  var addArray=[];

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final x1 =TextEditingController();
    final y1=TextEditingController();
    final x2 =TextEditingController();
    final y2=TextEditingController();
    final a= TextEditingController();
    final b =TextEditingController();
    final mod=TextEditingController();
    var pointarray=[];


    void dispose() {
      // Clean up the controller when the Widget is disposed
      x1.dispose();
      y1.dispose();
      x2.dispose();
      y2.dispose();
      a.dispose();
      b.dispose();
      mod.dispose();
      super.dispose();
    }



    int a_value;
    int b_value;
    double x1_value;
    double y1_value;
    double x2_value;
    double y2_value;
    int modulo;

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          height: 700,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: a,
                      onSubmitted: (newValue1) {print(newValue1);},
                      decoration: new InputDecoration(
                        labelText: 'Enter a',
                        focusColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 10,
                  ),

                  Expanded(
                       flex: 5,
                       child: TextField(
                         controller: b,
                         onSubmitted: (newValue2) {print(newValue2);},
                         obscureText: false,
                         decoration: new InputDecoration(
                             labelText: ' Enter b'
                         ),
                       ),
                  )


                ],
              ),
              SizedBox(height: 15.0),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: TextField(
                      controller: mod,
                      onSubmitted: (newValue2) {print(newValue2);},
                      obscureText: false,
                      decoration: new InputDecoration(
                          labelText: 'Enter modulo'
                      ),
                    ),
                  ),
                  Container(
                    width: 10,
                  ),

                  Expanded(
                    flex: 5,
                    child: Center(
                      child: FlatButton(
                        color: Colors.lightBlueAccent[200].withAlpha(30),
                        child: Text("Compute",),
                        onPressed:() {
                        a_value = int.parse(a.text);
                        modulo = int .parse(mod.text);
                        b_value=int.parse(b.text);
//                        x1_value=double.parse(x1.text);
//                        y1_value=double.parse(y1.text);
//                        x2_value=double.parse(x2.text);
//                        y2_value=double.parse(y2.text);
                        point p= point(x1_value,y1_value);
                        point q= point (x2_value,y2_value);
                        finalpoints.clear();
                        rebuildAllChildren(context);
                        print("Hello ${find_all_points(modulo, a_value, b_value,pointarray,finalpoints)[2].x}");

                          setState(() {
                            for (int i=0;i<modulo*2;i++)
                            {
                              if ((find_all_points(modulo, a_value, b_value, pointarray, finalpoints)[i].y- find_all_points(modulo, a_value, b_value, pointarray, finalpoints)[i].y.toInt())==0)
                              {finalpoints.add(find_all_points(modulo, a_value, b_value, pointarray, finalpoints)[i]);
                              }
                              else finalpoints=finalpoints;
                            }
                          });
                        print(finalpoints);
                      }
                        ,),
                    )
                  )

                ],
              ),
              Container(
                height: 20
                ,
              ),
              Container(
                height: 38,
                padding: EdgeInsets.only(
                  left: 5,
                  right: 5
                ),
                child: Scrollbar(

                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: finalpoints.length,
                      padding: EdgeInsets.only(bottom: 8),
                      itemBuilder: (BuildContext context, int index) {
                        return new GestureDetector( //You need to make my child interactive
                            onTap: () {
                              addArray.add(finalpoints[index]);
                              setState(() {
                                finalpoints.removeAt(index);
                              });
                              print(addArray.length);
                              if (addArray.length == 2){
                                print("(${addArray[0].x},${addArray[0].y}),(${addArray[1].x},${addArray[1].y})");
                                print(printpoint(add2point(addArray[0] ,addArray[1], a_value, b_value, modulo)));
                                addArray.clear();
                              }

                            },


                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),

                                child:Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 4
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black87),
                                      color: Colors.lightBlueAccent[200].withAlpha(30),
                                    ),
                                    height: 30,
                                    width: 60,
                                    padding: EdgeInsets.all(0),
                                    child: Center(
                                      child: Text(
                                          "(${finalpoints[index].x} , ${finalpoints[index].y})"
                                      ),
                                    )
                                )
                            )
                        );
                      }),
                )
              )
            ],
          ),

        )
      ),
    );
  }
}

class point
{
  double x;
  double y;
  point(double x1, double x2)
  {
    x = x1;
    y = x2;
  }
}
double modul(double number, int mod)
{
  if (number<0) { while (number<0) number=number+mod;}
  else {
    while (number >= mod) number = number - mod;
  }
  return number;
}

int find_inverse(double y,int modulo)
{
  y = modul(y,modulo);
  for (int x = 1; x < modulo; x++)
    if (modul((y*x) , modulo) == 1)
    {
      return x;
    }
}

point add2point(point p,point q, int a, int b,int modulo)
{
  point result= point(1,1);
  double num;
  double denom;
  double x3, y3;
  double slope;
  int k;
  if (p.x != q.x || p.y != q.y)
  {
    denom = (q.x - p.x);
    num = (q.y - p.y);
  }
  else
  {
    denom = (2 * p.y);
    num = (3 * p.x*p.x + a);
  }
  while (denom < 0) denom = denom + modulo;


  slope =modul((num)*find_inverse(denom, modulo) , modulo);
  x3 = (slope * slope - p.x - q.x);
  x3 = modul(x3 ,modulo);
  while (x3 < 0) x3 = x3 + modulo;
  y3 = (slope * (p.x - x3) - p.y);
  y3 = modul(y3 , modulo);
  while (y3 < 0) y3 = y3 + modulo;
  result.x= x3; result.y = y3;
  return result;
}

List find_all_points(int modulo,int a, int b, var arrayofpoints, var finalpoints)
{
  //finalpoints = [];
  double y1;
  double y2;
  double y;
  double yb;
  arrayofpoints=[];
  for (double x = 0; x < modulo; x++)
  {

    yb = (x*x*x + a * x + b);
    y = modul(yb , modulo);
    y1 = sqrt(y);
    y2 = -y1;
    while (y2 < 0) y2 = y2 + modulo;
    point p1 = new point(x,y1);
    point p2= new point(x,y2);
    arrayofpoints.add(p1);
    arrayofpoints.add(p2);
    //print(arrayofpoints);



  }
  return arrayofpoints;
}

String printpoint(point a)
{
  return "("+a.x.toString()+","+a.y.toString()+")";
}

String printarray(var array, int modulo, var finalpoints)
{
  finalpoints=[];
  String points=" ";
  int i;
  for (i=0;i<modulo*2;i++)
  {
    if ((array[i].y-array[i].y.toInt())==0)
    {finalpoints.add(array[i]);
    points=points+printpoint(array[i]);}
    else points=points;
  }

  return points;

}

void rebuildAllChildren(BuildContext context) {
  void rebuild(Element el) {
    el.markNeedsBuild();
    el.visitChildren(rebuild);
  }
  (context as Element).visitChildren(rebuild);
}