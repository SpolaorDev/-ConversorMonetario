import 'package:flutter/material.dart';

void main() {
  runApp(MyCurrencyConverter());
}

class MyCurrencyConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor Monetário',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: CurrencyConverterScreen(),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  String _selectedCurrency = 'Real';
  List<String> _currencies = ['Real', 'Dólar', 'Euro'];
  double _realToDollarRate = 5.16; // cotação de conversão Real para Dólar
  double _realToEuroRate = 5.52; // cotação de conversão Real para Euro

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor Monetário - DevSpolaor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor em $_selectedCurrency',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            DropdownButton(
              value: _selectedCurrency,
              items: _currencies.map((currency) {
                return DropdownMenuItem(
                  value: currency,
                  child: Text(currency,
                      style: TextStyle(
                        color: Colors.white, // cor do texto
                      )),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCurrency = value.toString();
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _result = convertCurrency(double.parse(_controller.text));
                });
              },
              child: Text('Converter'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // cor do botão
              ),
            ),
            SizedBox(height: 20.0),
            Text('Resultado: $_result',
                style: TextStyle(
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }

  double convertCurrency(double value) {
    if (_selectedCurrency == 'Real') {
      return value;
    } else if (_selectedCurrency == 'Dólar') {
      return value / _realToDollarRate;
    } else if (_selectedCurrency == 'Euro') {
      return value / _realToEuroRate;
    }
    return 0.0;
  }
}
