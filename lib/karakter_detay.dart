import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/karakter.dart';

class KarakterDetay extends StatelessWidget {

  final Karakter karakter;

  KarakterDetay({required this.karakter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),

      body: _buildBody(),


    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      title: Text(karakter.isim,
      style: TextStyle(
        fontSize: 32,
        color: Colors.white
      ),
      ),
      backgroundColor: Colors.purple,
    );
  }

  Widget _buildBody() {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: 
        _buildBodyColumn()
    );
  }
  
  Widget _buildBodyColumn(){
    return Column(
      children: [
        Image.network(karakter.gorsel,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 400,
          alignment: Alignment.center,
        ),
        SizedBox(height: 20,),
        Column(children: [
          _buildBodyRow("Character Name:" , karakter.isim ),
          SizedBox(height: 15,),
          _buildBodyRow("Character Origin:" , karakter.mensei ),
          SizedBox(height: 15,),
          _buildBodyRow("Character Location:" , karakter.konum ),
          SizedBox(height: 15,),
          _buildBodyRow("Character Species:" , karakter.tur ),
          SizedBox(height: 15,),
          _buildBodyRow("Character Male:" , karakter.cinsiyet ),

        ],
        )

      ],
    );
  }


  Widget _buildBodyRow(String baslik, String detay){
    return Row(
      children: [
        Expanded(
          flex: 6,
            child: Text(
              baslik,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            detay,
            style: TextStyle(
                fontSize: 24
            ),
          ),
        ),
      ],
    );
  }


}
