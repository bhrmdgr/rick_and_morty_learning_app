class Karakter{

  String karakterid;
  String isim;
  String durum;
  String tur;
  String cinsiyet;
  String mensei;
  String konum;
  String gorsel;

  Karakter.maptenOlustur(Map<String,dynamic> karakterMap):
        karakterid = karakterMap["id"].toString() ?? "0",
        isim = karakterMap["name"] ?? "0",
        durum = karakterMap["status"] ?? "0",
        tur = karakterMap["species"] ?? "0",
        cinsiyet = karakterMap["gender"] ?? "0",
        mensei = karakterMap["origin"]["name"] ?? "0",
        konum = karakterMap["location"]["name"] ?? "0",
        gorsel = karakterMap["image"] ?? "0";


}

/*{
  "info": {
    "count": 826,
    "pages": 42,
    "next": "https://rickandmortyapi.com/api/character/?page=2",
    "prev": null
  },
  "results": [
    {
      "id": 1,
      "name": "Rick Sanchez",
      "status": "Alive",
      "species": "Human",
      "type": "",
      "gender": "Male",
      "origin": {
        "name": "Earth",
        "url": "https://rickandmortyapi.com/api/location/1"
      },
      "location": {
        "name": "Earth",
        "url": "https://rickandmortyapi.com/api/location/20"
      },
      "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
      "episode": [
        "https://rickandmortyapi.com/api/episode/1",
        "https://rickandmortyapi.com/api/episode/2",
        // ...
      ],
      "url": "https://rickandmortyapi.com/api/character/1",
      "created": "2017-11-04T18:48:46.250Z"
    },
    // ...
  ]
}*/

