import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class School extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Fade In Image';

    return new Scaffold(
      appBar: AppBar(title: Text(title)),
      body: 
          Center(child: new CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: 'http://g.hiphotos.baidu.com/image/h%3D300/sign=7dac85b2825494ee982209191df4e0e1/c2cec3fdfc03924558fae5028994a4c27d1e256b.jpg',
          ),)
    );
  }
}