import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/karakter_detay.dart';
import 'karakter.dart';

class AnaSayfa extends StatefulWidget {
  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final String _apiUrl = "https://rickandmortyapi.com/api/character";
  List<Karakter> _butunKarakterler = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _karakterleriInternettenCek();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.purple,
      centerTitle: true,
      title: Text(
        "Rick And Morty Characters",
        style: TextStyle(fontSize: 32, color: Colors.white),
      ),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // İki sütunlu grid görünümü
        childAspectRatio: 0.7, // Kartların yüksekliğini belirlemek için
      ),
      itemCount: _butunKarakterler.length,
      itemBuilder: _buildGridItem,
    );
  }

  void _karakterleriInternettenCek() async {
    Uri uri = Uri.parse(_apiUrl);
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> parsedResponse = jsonDecode(response.body);
      List<dynamic> karakterListesi = parsedResponse["results"];

      for (var karakterMap in karakterListesi) {
        Karakter karakter = Karakter.maptenOlustur(karakterMap);
        _butunKarakterler.add(karakter);
      }

      setState(() {});
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Widget _buildGridItem(BuildContext context, int index) {
    Karakter karakter = _butunKarakterler[index];

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KarakterDetay(karakter: karakter,),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              karakter.gorsel.isNotEmpty
                  ? Image.network(
                karakter.gorsel,
                height: 200,
                fit: BoxFit.cover,
              )
                  : SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  karakter.isim,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(karakter.durum),
              Text(karakter.tur),
              Text(karakter.cinsiyet)
            ],
          ),
        ),
      ),
    );
  }
}
