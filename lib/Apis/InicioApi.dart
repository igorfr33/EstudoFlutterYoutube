import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/models/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyC7MWE_V-MF0SqOhuRZP5ukzB5DGMw-dRo";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class ApiPesquisa{

  Future<List<Video>> pesquisar(String pesquisa) async {

    http.Response response = await http.get(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&q=$pesquisa"
    );

    if( response.statusCode == 200 ){


      Map<String, dynamic> dadosJson = json.decode( response.body );

      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
            //return Video.converterJson(map);
          }
      ).toList();

      return videos;

    }else{

    }

  }

}
