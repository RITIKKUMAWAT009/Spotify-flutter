import "package:cloud_firestore/cloud_firestore.dart";

class DummySong {
 static List<DummySongModel> songs = [
    DummySongModel(
        id: "1",
        title: "Aaj ki Raat",
        artist: "Stree2",
        duration: 3.45,
        release: DateTime.now()),
    DummySongModel(
        id: "2",
        title: "Barse niana",
        artist: "Sahid Mallya",
        duration: 3.45,
        release: DateTime.now()),
    DummySongModel(
        id: "3",
        title: "Dheere Dheere",
        artist: "Anirudh",
        duration: 3.40,
        release: DateTime.now()),
    DummySongModel(
        id: "4",
        title: "DO u Know",
        artist: "Diljit Singh",
        duration: 2.25,
        release: DateTime.now()),
    DummySongModel(
        id: "5",
        title: "Duur na karin",
        artist: "Zahrah S khan",
        duration: 3.25,
        release: DateTime.now()),
    DummySongModel(
        id: "6",
        title: "Haste Haste",
        artist: "Sachet Tandon",
        duration: 3.20,
        release: DateTime.now()),
    DummySongModel(
        id: "7",
        title: "Kaun khehte hai",
        artist: "bhagwan",
        duration: 4.50,
        release: DateTime.now()),
    DummySongModel(
        id: "8",
        title: "Khoobsurat Stree",
        artist: "Vishal mishra",
        duration: 4.0,
        release: DateTime.now()),
    DummySongModel(
        id: "9",
        title: "kya Haal hai",
        artist: "Sachet",
        duration: 3.45,
        release: DateTime.now()),
    DummySongModel(
        id: "10",
        title: "Sanware ",
        artist: "Hansraj",
        duration: 3.25,
        release: DateTime.now()),
    DummySongModel(
        id: "11",
        title: "Tauba tauba",
        artist: "Bad Newz",
        duration: 3.25,
        release: DateTime.now()),
    DummySongModel(
        id: "12",
        title: "Tumhara hi rahenge",
        artist: "Stree2",
        duration: 3.45,
        release: DateTime.now()),
  ];
}

class DummySongModel {
  final String id;
  final String title;
  final String artist;
  final double duration;
  final DateTime release;

  DummySongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.release,
      required this.id});

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "artist": artist,
        "duration": duration,
        "release": release
      };
}

uploadToCloud(List<DummySongModel> songs) async {
  try {
    for(var song in songs){
      await FirebaseFirestore.instance
          .collection("Songs")
          .doc(song.id)
          .set(song.toJson());
    }
    print("uploading success-==========");
  } catch (e) {
    print("uploading failed===========$e");
  }
}
