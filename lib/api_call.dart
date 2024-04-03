import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

//Auth token we will use to generate a meeting and connect to it
String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiJiODAyYzc3ZS02ZTMyLTQyYjQtYmU1OS02ZDY4MzFiMzZhYzkiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxMjA4MzcyNywiZXhwIjoxNzEyNjg4NTI3fQ.ekh2VbjuSWJKfP8PWJ6B22oDE0He06-7ksNOV5kaOlM";

// API call to create meeting
Future<String> createMeeting() async {

  String meetingApi = dotenv.get("VIDEOSDK_API_ENDPOINT", fallback: "");

  final http.Response httpResponse = await http.post(
    Uri.parse(meetingApi + "/rooms"),
    headers: {'Authorization': token},
  );

//Destructuring the roomId from the response
  return json.decode(httpResponse.body)['roomId'];
}