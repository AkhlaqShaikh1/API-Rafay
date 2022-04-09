import 'package:flutter/material.dart';

import '../services/get_api_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos"),
        elevation: 0,
      ),
      body: SafeArea(
        child: FutureBuilder<dynamic>(
          future: Api().getPhotos(),
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (asyncSnapshot.hasError) {
              return const Center(child: Text("An error occured"));
            } else {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    return Image.network(
                        asyncSnapshot.data![index].thumbnailUrl);
                  });
            }
          },
        ),
      ),
    );
  }
}
