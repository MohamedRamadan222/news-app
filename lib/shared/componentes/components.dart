import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget myDivider() => Padding(
padding: const EdgeInsetsDirectional.only(start: 20),
child: Container(
width: double.infinity,
height: 1.0,
color: Colors.grey[300],
),
);
Widget buildArticaleItem(artical) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image:  DecorationImage(
                image: NetworkImage(
                    '${artical["image"]}'),
                fit: BoxFit.cover),
          )),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${artical["title"]}',
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w600),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${artical["updateAt"]}',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget articaleBuilder(list) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) =>
          buildArticaleItem(list[index]),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: 19,
    ),
    fallback: (context) =>
        Center(child: CircularProgressIndicator()));