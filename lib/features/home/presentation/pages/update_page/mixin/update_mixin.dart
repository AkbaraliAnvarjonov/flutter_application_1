part of 'package:flutter_application_1/features/home/presentation/pages/update_page/update_page.dart';

mixin UpdateMixin on State<UpdatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  late final ProductsBloc _bloc = context.read<ProductsBloc>();

  @override
  void initState() {
    titleController.text = widget.prouct.title;
    super.initState();
  }
}
