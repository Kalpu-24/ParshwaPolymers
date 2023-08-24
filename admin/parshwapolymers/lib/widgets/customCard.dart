// ignore_for_file: file_names, camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:parshwapolymers/api/apiController.dart';
import '../models/product.dart';

class customCard extends StatelessWidget {
  const customCard({
    Key? key,
    required this.context,
    required this.products,
    required this.deleteCallback,
    required this.editCallback,
  }) : super(key: key);

  final BuildContext context;
  final Product products;
  final VoidCallback deleteCallback;
  final VoidCallback editCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Theme.of(context).cardColor,
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(
                base64Decode(products.image['data']),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            products.name,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 15),
          Text(
            products.material,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton.icon(
                  style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                        overlayColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColorLight),
                      ),
                  onPressed: () {
                    editCallback();
                  },
                  icon: const Icon(Icons.edit_outlined),
                  label: Text(
                    'Edit',
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
              OutlinedButton.icon(
                  style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                        overlayColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColorLight),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.red)),
                        iconColor:
                            const MaterialStatePropertyAll(Color(0xffff0000)),
                      ),
                  onPressed: () {
                    deleteProduct(products.id).then((value) {
                      if (value.statusCode == 200) {
                        deleteCallback();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Product Deleted"),
                        ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Error Deleting Product"),
                        ));
                      }
                    });
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: Text(
                    'Delete',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: const Color(0xffff0000)),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
