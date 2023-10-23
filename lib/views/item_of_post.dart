// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider_example/viewmodel/home_viewmodel.dart';

import '../model/post_model.dart';

Widget itemOfPost(HomeViewModel viewModel, Post post) {
  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            viewModel.apiPostDelete(post).then(
                  (value) => {
                    if (value) viewModel.apiPostList(),
                  },
                );
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "Delete",
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {},
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: "Update",
        ),
      ],
    ),
    child: Container(
      height: 70,
      width: 370,
      color: Colors.grey.withOpacity(0.5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.id.toString(),
            maxLines: 1,
          ),
          SizedBox(height: 5),
          Text(post.title, maxLines: 1),
        ],
      ),
    ),
  );
}
