import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/data/model/product_model.dart';
import 'package:flutter_application_1/features/home/data/model/product_request.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/products_bloc/products_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:flutter_application_1/features/home/presentation/pages/update_page/mixin/update_mixin.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key, required this.prouct});

  final ProductModel prouct;

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> with UpdateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: titleController,
              ),
              ElevatedButton(
                  onPressed: () {
                    _bloc.add(UpdateProductsEvent(
                        productRequest: ProductRequest(
                      id: widget.prouct.id,
                      title: titleController.text,
                      category: titleController.text,
                      description: titleController.text,
                      image: titleController.text,
                      price: 12,
                    )));
                  },
                  child: Text('Update'))
            ],
          ),
        ),
      ),
    );
  }
}
