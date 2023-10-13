import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:task2() ,
      debugShowCheckedModeBanner: false,
    );
  }
}
class task2 extends StatefulWidget {
   task2({Key? key}) : super(key: key);

  @override
  State<task2> createState() => _task2State();
}

class _task2State extends State<task2> {
  List img= ["Images/dhoni.jpg","Images/d.png","Images/h.jpg"
  ,"Images/o.png"];
  var text = ["thala","CSK","Captain","MSD"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold(
        appBar: AppBar(centerTitle: true,title: const Text("TASK"),
        bottom: const TabBar(tabs: [Text("LIST"),Text("GIRD")],),),
        body: TabBarView(children:[Center(child:
        ListView.builder(itemCount: img.length ,itemBuilder:(BuildContext context,index)
          {
            return Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [Row(children: [
              CircleAvatar(backgroundImage: AssetImage(img[index]),radius: 50,),const SizedBox(height: 150,width: 50,),
              TextButton(onPressed: (){
                showDialog(context: context, builder: (BuildContext contex){
                  return AlertDialog(title: Text("Dialogue box"),
                  actions: [TextButton(onPressed: (){
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>infopage(dhoniImage:img[index]
                            ,dhoniText:text[index])));
                  }, child: Text("ok"),
                  ),TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("close"))],);
                });
              },child: Text(text[index]),),

           ] ),],);
            },),),


          Center(child: GridView.builder(gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),itemCount:img.length,
              itemBuilder: (BuildContext context,index)
          {
            return Column(mainAxisAlignment: MainAxisAlignment.center,
              children:[
                CircleAvatar(backgroundImage: AssetImage(img[index]),radius: 30,),const SizedBox(height: 50,width: 50,),
                TextButton(onPressed: (){
                  showDialog(context: context, builder: (BuildContext contex){
                    return AlertDialog(title: Text("Dialogue box"),
                      actions: [TextButton(onPressed: (){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context)=>infopage(dhoniImage:img[index]
                            ,dhoniText:text[index])));
                      }, child: Text("ok"),
                      ),TextButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text("close"))],);
                  });
                }, child: Text(text[index]))
              ] );
          }))],),
      ),
    );
  }
}
class infopage extends StatefulWidget {
  const infopage({Key? key,required this.dhoniImage,required this.dhoniText}) : super(key: key);

  final String dhoniImage;
  final String dhoniText;

  @override
  State<infopage> createState() => _infopageState();
}

class _infopageState extends State<infopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("INFO"),),
      body: SingleChildScrollView(
        child: Center(child: Column(children: [
          Image.asset(widget.dhoniImage.toString()),
          SizedBox(height: 50,),
          Text(widget.dhoniText,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700
          ,fontStyle: FontStyle.italic),),


        ],),),
      ),
    );
  }
}
