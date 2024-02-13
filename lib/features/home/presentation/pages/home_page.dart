import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widget/modal_progres_hud.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/products_bloc/products_event.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/products_bloc/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.status.isLoading,
          child: CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: state.products.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(state.products[index].title),
                  trailing: IconButton(
                      onPressed: () {
                        context.read<ProductsBloc>().add(
                            DeleteProductsEvent(id: state.products[index].id));
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

/// get it
/// either
/// mixin
