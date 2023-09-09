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
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "Delate",
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
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title.toUpperCase()),
          SizedBox(
            height: 5,
          ),
          Text(post.title.toUpperCase()),
        ],
      ),
    ),
  );
}
