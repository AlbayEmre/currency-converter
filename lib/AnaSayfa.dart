import 'package:flutter/material.dart';

/*

//stless yazarak kolayca bu kalıp yazilabilr
class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  //Bu StatelessWidget Ekran 1 kez cizilir ve oyle kalir
  int _sayac = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //En tepeye Hello word yazdirdik
        title: Text("Hello Word"),
      ),
      floatingActionButton: FloatingActionButton(
        //Sağ alta + olan buton ekledik
        child: Icon(Icons.add),
        onPressed: _butonaTiklandi,
      ),
      body: Center(
        child: Text(_sayac.toString()),
      ),
    );
  }

  void _butonaTiklandi() {
    // _sayac++;   Sayacin butona basinca saymasi icin
    setState(() {
      //Bunun içinde yazmaliyizs
      _sayac++;
    });
  }
}
// *********************************************************************************************************************************
*/

//Text ile ilgili özellikler
/*
class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Merhaba dunya",
        textAlign: TextAlign.center,
        maxLines: 2, //Maxsimum satır sayısı
        overflow: TextOverflow.fade, //Taşan metni şeffaf hale getirir
        textDirection: TextDirection.ltr, //Yazinin akış yönü

        style: TextStyle(
            fontSize: 36, //yazi bpyutu
            fontWeight: FontWeight.bold, //yazı kalınlığı
            fontStyle: FontStyle.italic, //yazi Sitili
            color: Colors.green, //Text rengi
            backgroundColor: Colors.red, //Arka plan rengi
            decoration: TextDecoration.underline
            //Yazinin ustu , alti çizili olmasi

            ),
      )),
    );
  }
}
*/
/*
class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 250,
      height: 300,
      color: Colors.blue,
      margin: EdgeInsets.only(top: 50, left: 20),
      // padding: EdgeInsets.all(30),//İcinde yazilani her taraftan 30 br bosluk birakir
      //padding: EdgeInsets.symmetric(horizontal: 30), sağ-sol bolsuk bırakir
      padding: EdgeInsets.symmetric(vertical: 30), //ustden-altan bosluk bırakır
      child: Text(
        "Hello Word Hello Word Hello Word"
        "Hello Word Hello Word Hello Word"
        "Hello Word Hello Word Hello Word"
        "Hello Word Hello Word Hello Word"
        "Hello Word Hello Word Hello Word"
        "Hello Word Hello Word Hello Word"
        "Hello Word Hello Word Hello Word"
        "Hello Word Hello Word Hello Word"
        "Hello Word Hello Word Hello Word"
        "Hello Word Hello Word Hello Word",
        textAlign: TextAlign.justify, //Sağa sola yasta
      ),
    ));
  }
}
*/
/*
class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AppBar"), backgroundColor: Colors.blue),
      body: Column(
        //Dikey sıralar
        //mainAxisAlignment: MainAxisAlignment.center,//İcindeki ogeleri nereye koyacağini belirler
        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
        //Arada esit bosluk brakrak sıralar
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //Container'lerin 1 tanesi sonsuz uzunlukta ise diyerleri sola dayali duracak

        children: [
          Container(width: double.infinity, height: 50, color: Colors.green),
          SizedBox(height: 20), //Kendi istedimiz kadar bosluk bırakma
          Container(width: 50, height: 50, color: Colors.red),
          SizedBox(height: 20), //Kendi istedimiz kadar bosluk bırakma
          Container(width: 50, height: 50, color: Colors.yellow),
        ],
      ),
    );
  }
}
*/

//Image.assets

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Image.asset("assets/kup.jpg"),
    );
  }
}
