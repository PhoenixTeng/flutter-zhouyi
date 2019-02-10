import 'package:flutter/material.dart';
import 'package:zhouyi/zhouyi.dart';


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
      home: MyHomePage(title: '周易'),
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
  //int _counter = 0;
  int gnu=1;

  List<int> dong = [0,0,0,0,0,0];
  List<int> lgnu=List<int>();
  List<List<int>> ldong=<List<int>>[];
  List<Widget> lgua = <Widget>[];

  void _universe() {
    setState(() {
    ZhouYi zhouyi = ZhouYi.universe();
       gnu = zhouyi.gnu();
       dong = zhouyi.dong();

      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //_counter++;
      lgnu.add(gnu);
      ldong.add(dong);
      lgua.add(_gua(gnu, dong));
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    //Gua gua = ZhouYi.gua[gnu-1];
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:<Widget>[
            Text(widget.title),
            Text('点击右下角图标',style: TextStyle(fontSize: 14),)
          ]
        ),
        actions: <Widget>[IconButton(icon:const Icon(Icons.list), onPressed: _pushSaved)],
      ),
      body: ListView(
          children:<Widget>[_gua(gnu, dong)],
      ),

      floatingActionButton: RawMaterialButton(
        onPressed: _universe,
        fillColor: Colors.deepOrange,
        splashColor: Colors.orange,
        shape:CircleBorder(),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          child:Image.asset('images/taiji.png'),
        ),
      ),
    );
  }
  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: const Text('Saved'),
            ),
            body: new ListView(children:lgua),
          );
        },
      ),
    );
  }
 /*
  List<Widget> _saveList(){
    List<Widget> saveGua = [];
    //List<Widget> saveGuaReversed=[];
    for (var i=0;i<lgnu.length;i++){
     // var gua = ZhouYi.gua[i-1];
       saveGua.add(_gua(lgnu[i], ldong[i]));
    }
    return saveGua;
  }
*/
  Widget _gua(int i,List<int> dong){
   return Column(
      children: <Widget>[
        Image.asset('images/$i.png'),
        //Divider(),
        Text(
          ZhouYi.gua[i-1].tuan,
          style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
        ),
        //Divider(),

        Text(
          ZhouYi.gua[i-1].x1,
          style: TextStyle(fontSize: 17,color: dong[0]==1?Colors.red:null,fontWeight: FontWeight.bold),
        ),

        Text(
          ZhouYi.gua[i-1].x2,
          style: TextStyle(fontSize: 17,color: dong[1]==1?Colors.red:null,fontWeight: FontWeight.bold),
        ),
        Text(
          ZhouYi.gua[i-1].x3,
          style: TextStyle(fontSize: 17,color: dong[2]==1?Colors.red:null,fontWeight: FontWeight.bold),
        ),
        Text(
          ZhouYi.gua[i-1].x4,
          style: TextStyle(fontSize: 17,color: dong[3]==1?Colors.red:null,fontWeight: FontWeight.bold),
        ),
        Text(
          ZhouYi.gua[i-1].x5,
          style: TextStyle(fontSize: 17,color: dong[4]==1?Colors.red:null,fontWeight: FontWeight.bold),
        ),
        Text(
          ZhouYi.gua[i-1].x6,
          style: TextStyle(fontSize: 17,color: dong[5]==1?Colors.red:null,fontWeight: FontWeight.bold),
        ),
        Divider(),
      ],
    );
  }

}
