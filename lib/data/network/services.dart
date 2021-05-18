import 'package:blogapplication/data/core/api_client.dart';
import 'package:blogapplication/data/core/urls.dart';
import 'package:blogapplication/data/models/confession_response.dart';
import 'package:blogapplication/data/models/confessions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoteDataSource {
  Future<List<Confessions>> getLoveStory();
  Future<List<Confessions>> getFunnyStory();
  Future<List<Confessions>> getconfessionStory();
  Future<List<Confessions>> getrandomStory();
  Future<List<Confessions>> getschoolStory();
  Future<List<Confessions>> getmotivationStory();
  Future<List<Confessions>> getUserStory();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiClient _client;

  RemoteDataSourceImpl(this._client);
  @override
  Future<List<Confessions>> getLoveStory() async {
    final response = await _client.get(loveStoriesUrl);
    final loveStories = ConfessionResponse.fromJson(response).confessions;
    print(loveStories);
    return loveStories;
  }

  @override
  Future<List<Confessions>> getFunnyStory() async {
    final response = await _client.get(funnyStoriesUrl);
    final funnyStories = ConfessionResponse.fromJson(response).confessions;
    print(funnyStories);
    return funnyStories;
  }

  @override
  Future<List<Confessions>> getconfessionStory() async {
    final response = await _client.get(confessionStoriesUrl);
    final confessionStories = ConfessionResponse.fromJson(response).confessions;
    print(confessionStories);
    return confessionStories;
  }

  @override
  Future<List<Confessions>> getmotivationStory() async {
    final response = await _client.get(motivationStoriesUrl);
    final randomStories = ConfessionResponse.fromJson(response).confessions;
    print(randomStories);
    return randomStories;
  }

  @override
  Future<List<Confessions>> getrandomStory() async {
    final response = await _client.get(randomStoriesUrl);
    final schoolStories = ConfessionResponse.fromJson(response).confessions;
    print(schoolStories);
    return schoolStories;
  }

  @override
  Future<List<Confessions>> getschoolStory() async {
    final response = await _client.get(schoolStoriesUrl);
    final motivationalStories =
        ConfessionResponse.fromJson(response).confessions;
    print(motivationalStories);
    return motivationalStories;
  }

  @override
  Future<List<Confessions>> getUserStory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('userName');
    final response = await _client.get('$userDataUrl/$userName');
    final motivationalStories =
        ConfessionResponse.fromJson(response).confessions;
    print(motivationalStories);
    return motivationalStories;
  }
}
