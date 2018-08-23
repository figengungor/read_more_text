import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:read_more_text/read_more_text.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.pink,
      ),
      title: 'Read More Text Demo',
      home: DemoApp(),
    ));

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Read More Text Demo')),
      body: DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 16.0,
          //fontFamily: 'monospace',
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText(
                  'This is TrimMode.TrimLine test. trimLines: 2 trimCollapsedText width is not bigger than the maxWidth',
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Show more content',
                  trimExpandedText: ' show less',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText(
                  'This is TrimMode.TrimLine test. trimLines: 3 Text does not exceed trimLines so must not be trimmed',
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '...Show more content',
                  trimExpandedText: ' show less',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText(
                  'This is TrimMode.TrimLine test. trimLines: 2 trimCollapsedText width is bigger than the maxWidth so collapsedText will be added starting from trimLines number',
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText:
                      '...Show more content more more more more more more more more more',
                  trimExpandedText: ' show less',
                ),
              ),
              //TODO: Test case 4
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ReadMoreText(
                  'This is TrimMode.TrimLine test. trimLines: 2 trimCollapsedText'
                      ' wrapping issue occurs.AFter 2 there are some space'
                      ' because trimCollapsedText is too big so it is moved '
                      'to next line but after substring '
                      '...show was short enough to fit that space',
                  trimLines: 2,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText:
                      '...Show more content more more more more more mo',
                  trimExpandedText: ' show less',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
