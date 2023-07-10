import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       primaryColor: Colors.blue
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var wtController=TextEditingController();
var ftController=TextEditingController();
var inController=TextEditingController();
var result='';
var bgColor=Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:
       AppBar(

          title: Text('BMI'),
        ),

      body: Container(decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xfffad0c4),
            Color(0xffd1f8ff)
            
          
          ],
          center: Alignment.topLeft


        )
      ),
        child: Center(
child:Container(
width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BMI',style: TextStyle(color: Colors.blue,fontSize: 34,fontWeight: FontWeight.w700),),SizedBox(height: 21,),
                  TextField(controller: wtController,decoration: InputDecoration(label: Text('Enter your wt (in kg)'),
                      prefixIcon: Icon(Icons.line_weight)
                  ),keyboardType: TextInputType.number,
                  ),
                  TextField(controller: ftController,decoration: InputDecoration(label: Text('Enter your height (in feet)'),
                      prefixIcon: Icon(Icons.height)
                  ),keyboardType: TextInputType.number,
                  ),  TextField(controller: inController,decoration: InputDecoration(label: Text('Enter your height (in inches)'),
                      prefixIcon: Icon(Icons.height)
                  ),keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(onPressed: (){
                    var wt=wtController.text.toString();
                    var ft=ftController.text.toString();
                    var inch=inController.text.toString();
                    if(wt!='' && ft!=''&& inch!=''){
var iwt=int.parse(wt);
var ift=int.parse(ft);
var iInch=int.parse(inch);
var tInch=(ift*12)+iInch;
var tCm=tInch*2.54;
var tM=tCm/100;
var bmi=iwt/(tM*tM);
var msg='';
if(bmi>25){
  msg="You are Overweight";
  bgColor=Colors.orange.shade200;

}
else if(bmi<10){
  msg="You are Underweight";
      bgColor=Colors.red.shade200;
}else{
  msg="You are healthy";
  bgColor=Colors.greenAccent.shade200;
}
setState(() {
  result="$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
});


                    }else{
setState(() {
  result="Please fill all the required blanks";
});

                    }
                  }, child: Text('Calculate')),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(result,style: TextStyle(fontSize: 24),),
                  )
                ],
              )
          ,),
        ),
      ),
    );
  }
}
