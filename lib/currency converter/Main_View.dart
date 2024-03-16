import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Main_View extends StatefulWidget {
  @override
  State<Main_View> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<Main_View> {
  final String _apiKey = "22379bb1f9dea7c3b670bc4adef263ef";

  final String _baseUrl = "http://api.exchangeratesapi.io/v1/latest?access_key=";

  Map<String, double> _oranlar = {};

  TextEditingController _controller = TextEditingController();

  String _secilenDeyer = "USD";
  double _sonuc = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _verileriCek();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: _controller,
                  //Veri giriş türü
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                  onChanged: (String yeniDeyer) {
                    _hesapla();
                  },
                )),
                SizedBox(
                  width: 16,
                ),
                DropdownButton<String>(
                  value: _secilenDeyer,
                  icon: Icon(Icons.arrow_drop_down),
                  underline: SizedBox(),
                  items: _oranlar.keys.map((String kur) {
                    return DropdownMenuItem<String>(child: Text(kur), value: kur);
                  }).toList(),
                  onChanged: (String? yeniDeyer) {
                    if (yeniDeyer != null) {
                      _secilenDeyer = yeniDeyer;
                      _hesapla();
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "${_sonuc.toStringAsFixed(3)} TL",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            Container(
              height: 2,
              color: Colors.black,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _oranlar.keys.length,
                itemBuilder: _buildListItem,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _hesapla() {
    double? deyer = double.tryParse(_controller.text);

    double? oran = _oranlar[_secilenDeyer];

    if (deyer != null && oran != null) {
      setState(() {
        _sonuc = deyer * oran;
      });
    }
  }

  Widget _buildListItem(BuildContext context, int index) {
    return ListTile(
      title: Text(_oranlar.keys.toList()[index]),
      trailing: Text(_oranlar.values.toList()[index].toStringAsFixed(2)),
    );
  }

  void _verileriCek() async {
    Uri uri = Uri.parse(_baseUrl + _apiKey);

    http.Response response = await http.get(uri);

    Map<String, dynamic> parseResponsed = jsonDecode(response.body);
    //
    //
    //
    Map<String, dynamic> rates = parseResponsed["rates"];
    double? baseTlKuru = rates["TRY"];
    if (baseTlKuru != null) {
      for (String ulkeKuru in rates.keys) {
        //
        double? baseKur = double.tryParse(rates[ulkeKuru].toString());
        if (baseKur != null) {
          double tlKuru = baseTlKuru / baseKur;
          _oranlar[ulkeKuru] = tlKuru;
        }
      }
    }
    setState(() {});
  }
}

/*
{
    "success": true,
    "timestamp": 1519296206,
    "base": "EUR",
    "date": "2021-03-17",
    "rates": {
        "AUD": 1.566015,
        "CAD": 1.560132,
        "CHF": 1.154727,
        "CNY": 7.827874,
        "GBP": 0.882047,
        "JPY": 132.360679,
        "USD": 1.23396,
    [...]
    }
}
 */
