import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculadora extends StatefulWidget {
  //const Calculadora({Key key}) : super(key: key);

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

  String expretion = '';
  String ecuation = '0';
  String result = '0';


class _CalculadoraState extends State<Calculadora> {
  
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: Color(0xffabce93),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.end,              
        children: <Widget>[
          Expanded(
            child: Container(              
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      ecuation, style: TextStyle(color: Color(0xff2b7600), fontSize: 30.0)
                    )
                  ],
                ),
                Row(            
                  mainAxisAlignment: MainAxisAlignment.end,          
                  children: <Widget>[                                  
                    Text(
                      result, style: TextStyle(color: Color(0xff2b7600), fontSize: 60.0)
                    ),
                  ],
                )
              ],
            )
          ),
          ),
          
          Expanded(
            flex: 2,      
            
            child: Container(                                  
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffddebd3),              
              shape: BoxShape.rectangle,
              borderRadius: 
                BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)
                )
              ),
           // margin: EdgeInsets.all(.0),
            //padding: EdgeInsets.all(20),          
          
            child: Container(
              
              child: Center(              
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[                
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      btnEcuaciones('C', Color(0xffa5a5a5)),
                      btnEcuaciones('+/-', Color(0xffa5a5a5)),
                      btnEcuaciones('%', Color(0xffa5a5a5)),
                      btnEcuaciones('/', Color(0xff333333)),
                    ]),
                  
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      btn('7' , Color(0xffa5a5a5)),
                      btn('8', Color(0xffa5a5a5)),
                      btn('9', Color(0xffa5a5a5)),
                      btnEcuaciones('x', Colors.blue),
                    ]
                    ),
                  
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      btn('4', Color(0xff333333)),
                      btn('5', Color(0xff333333)),
                      btn('6', Color(0xff333333)),
                      btnEcuaciones('-', Color(0xff333333)),
                    ]
                    ),
                  
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      btn('1', Color(0xff333333)),
                      btn('2', Color(0xff333333)),
                      btn('3', Color(0xff333333)),
                      btnEcuaciones('+', Color(0xff333333)),
                    ]
                    ),
                  
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      btnCero('0', Colors.transparent),
                      btn(',', Colors.transparent),              
                      btnIgual('=', Color(0xff2b7600)),
                    ]
                    )
                ],
              ),
              ),
            )
          )
          )
        ],
      ),
      ) 
    );
  }

 Widget btnIgual(btnText, Color color){  
  return Container(    
    padding: EdgeInsets.all(5.0),        
    child: GestureDetector(
      onLongPress: (){
        calcular(btnText);      
      },

      onTap: (){        
      },
        child: SizedBox(
          child: RaisedButton(         
          onPressed: (){      
          calcular1(btnText);            
        },      
          child: Text(btnText, style: TextStyle( fontSize: 25.0, color: Color(0xfff9fbfb)),),
          color: Color(0xff2b7600),
          padding: EdgeInsets.all(10),
        ),
        height: 50.0,
        width: 70.0,
      )
    )
  );
}

  Widget btnEcuaciones(btnText, Color color){  
  return Container(    
    padding: EdgeInsets.all(5.0),        
    child: GestureDetector(
      onLongPress: (){
        calcular(btnText);      
      },
      
      onTap: (){        
      },
        child: SizedBox(
          child: RaisedButton(         
          onPressed: (){      
          calcular1(btnText);            
        },
      
          child: Text(btnText, style: TextStyle( fontSize: 25.0, color: Color(0xfff9fbfb)),),
          color: Color(0xffabce93),
          padding: EdgeInsets.all(10),
          elevation: 0,
        ),
        height: 50.0,
        width: 70.0,
      )
    )
  );
}

  Widget btn(btnText, Color color){
  return Container(    
    padding: EdgeInsets.all(5.0),        
    child: GestureDetector(
      onLongPress: (){
        calcular(btnText);      
      },
      onTap: (){        
      },
      child: SizedBox(
      child: RaisedButton(         
      onPressed: (){      
      calcular1(btnText);   
    },
        
          child: Text(btnText, style: TextStyle( fontSize: 25.0, color: Color(0xff2b7600)),),
          color: Color(0xffddebd3),
          padding: EdgeInsets.all(10),
          elevation: 0,
        ),
        height: 50.0,
        width: 70.0,
      )
    )
  );
}

Widget btnCero( btnText, Color color){
  return Container(    
    padding: EdgeInsets.all(5.0),
    child: SizedBox(
    child: RaisedButton(
    onPressed: (){
      calcular(btnText);
    },
    //shape: StadiumBorder(),
    child: Text(btnText, style: TextStyle( fontSize: 25.0, color: Color(0xff2b7600)), textAlign: TextAlign.left,),
    color: Color(0xffddebd3),
    padding: EdgeInsets.all(10.0),
    elevation: 0,
    ),
    height: 50,
    width: 150,
    )
  );
}

  calcular(btnText){  
    setState((){    
      if(btnText == 'C'){
        ecuation = '0';
        result = '0';
      }
      else if(btnText == '='){
        expretion = ecuation;
        expretion = expretion.replaceAll('x', '*');
        expretion = expretion.replaceAll('÷', '/');
        try{
          Parser p = Parser();
          Expression exp = p.parse(expretion);
          ContextModel cm = new ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';       
        }
        catch(e){
          result = 'Error';
        }
      }
      else {
        if(ecuation == '0'){
          ecuation = btnText;
        }
        else{
          ecuation = ecuation + btnText;
        }      
      }
    });
  }  

  calcular1(btnText){  
    setState((){    
      if(btnText == 'C'){
        ecuation = ecuation.substring(0, ecuation.length - 1);
        if(ecuation == '0'){
          result = '0';
        }
      }
      else if(btnText == '='){
        expretion = ecuation;
        expretion = expretion.replaceAll('x', '*');
        expretion = expretion.replaceAll('÷', '/');
        try{
          Parser p = Parser();
          Expression exp = p.parse(expretion);
          ContextModel cm = new ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';       
        }
        catch(e){
          result = 'Error';
        }
      }
      else {
        if(ecuation == '0'){
          ecuation = btnText;
        }
        else{
          ecuation = ecuation + btnText;
        }      
      }
    });
  }  
}



  
  




