import 'package:flutter/material.dart';

void main() {
 runApp(MaterialApp(
   home: Home(),
   debugShowCheckedModeBanner: false,
 ));

}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

 TextEditingController _alcoolcontroler = TextEditingController();
 TextEditingController _gasolinacontroler = TextEditingController();
 String _resultado = "Informe os valores";
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 void _calculaCombustiveIdeal(){
   setState(() {
     double vAcool = double.parse(_alcoolcontroler.text.replaceAll(',', '.'));
     double vGas = double.parse(_gasolinacontroler.text.replaceAll(',', '.'));
     double proporcao = vAcool / vGas;
     _resultado = (proporcao < 0.7) ? "Abastaça com Àlcool" : "Abasteça com Gasolina";
   });
   void _reset(){
     setState(() {
       _alcoolcontroler.text = "";
       _gasolinacontroler.text = "";
       _resultado = "Informe os valores";
       _formKey = GlobalKey<FormState>();
     });
   }

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina",
          style: TextStyle(color: Colors.white ),
        ),
         centerTitle:  true,
        backgroundColor: Colors.lightBlue[900],
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
      onPressed: _reset
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.local_gas_station,
                size: 160.0,
                color: Colors.lightBlue[900],
              ),
              TextFormField(
                controller: _gasolinacontroler,
                validator: (value) => value.isEmpty ? "Informe o valor da galosina" : null,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
                decoration: InputDecoration(
                  labelText: "Valor da Gasolina",
                  labelStyle: TextStyle(color: Colors.lightBlue[900])),
              ),
          TextFormField(
            controller: _alcoolcontroler,
            validator: (value) => value.isEmpty ? "Informe o valor do Àcool" : null,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
          decoration: InputDecoration(
              labelText: "Valor do Àlcool",
              labelStyle: TextStyle(color: Colors.lightBlue[900])),
          ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState.validate()){
                      _calculaCombustiveIdeal();
                      }
                    },
                    child: Text('Verificar'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue[900],
                        onPrimary: Colors.white,
                        textStyle: TextStyle(
                            fontSize: 25.0
                        )
                    ),
                  ),
                ),
              ),
              Text(
                _resultado,
                    textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlue[900], fontSize: 26.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}



