import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_arman/models/post_model.dart';

class DataFromServerScreen extends StatefulWidget {
  const DataFromServerScreen({Key? key}) : super(key: key);

  @override
  State<DataFromServerScreen> createState() => _DataFromServerScreenState();
}

class _DataFromServerScreenState extends State<DataFromServerScreen> {
  List<PostModel> postsList = [];
  bool loadingMore = false;
  bool showLoading = false;
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _getDataFromServer(false);
  }

  Future<void> _getDataFromServer(bool showMore) async {
    Dio dio = Dio();
    String url =
        'https://jsonplaceholder.typicode.com/posts?_page=$currentPage&_limit=13';

    if (!showMore) {
      setState(() {
        showLoading = true;
      });
    }

    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        List receivedData = response.data;
        List<PostModel> newPosts =
            receivedData.map((e) => PostModel.fromJson(e)).toList();

        setState(() {
          postsList.addAll(newPosts);
          if (!showMore) {
            showLoading = false;
          }
        });
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void _onEndReached() {
    if (!loadingMore) {
      setState(() {
        loadingMore = true;
      });

      currentPage++;
      _getDataFromServer(true).whenComplete(() {
        setState(() {
          loadingMore = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Server data')),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is ScrollEndNotification &&
              scrollInfo.metrics.extentAfter == 0) {
            _onEndReached();
          }
          return false;
        },
        child: showLoading
            ? const Center(child: CircularProgressIndicator())
            : postsList.isEmpty
                ? const Center(
                    child: Text('There is no data'),
                  )
                : ListView.builder(
                    itemCount: postsList.length + (loadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == postsList.length) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        PostModel post = postsList[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(post.title ?? 'no title for this post'),
                          ),
                        );
                      }
                    },
                  ),
      ),
    );
  }
}
