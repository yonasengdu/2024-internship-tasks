import 'package:ecommerce/features/product/data/model/product_model.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/features/product/presentation/widgets/button_widget.dart';
import 'package:ecommerce/features/product/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProductAdd extends StatefulWidget {
  final String initialTitle;
  final String initialCategory;
  final double initialPrice;
  final String initialDescription;
  final String? image;

  ProductAdd({
    super.key,
    this.image,
    this.initialTitle = '',
    this.initialCategory = '',
    this.initialPrice = 0.0,
    this.initialDescription = '',
  });
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductAdd> {
  late String _selectedImagePath = "";
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _catagoryController = TextEditingController();

  String? titleValidator(String? field) {
    if (_titleController.text == '') {
      return "Empty field not allowed";
    }
    return null;
  }

  String? priceValidator(String? field) {
    if (_priceController.text == '' ||
        double.tryParse(_priceController.text) == null) {
      return "Empty field not allowed";
    }
    return "0";
  }

  String? categoryValidator(String? field) {
    if (_catagoryController.text == '') {
      return "Empty field not allowed";
    }
    return null;
  }

  String? descriptionValidator(String? field) {
    if (_descriptionController.text == '') {
      return "Empty field not allowed";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    // Initialize controllers with initial values
    _titleController.text = widget.initialTitle;
    _catagoryController.text = widget.initialCategory;
    _priceController.text = widget.initialPrice.toString();
    _descriptionController.text = widget.initialDescription;
  }

  void uploadProduct(BuildContext context) {
      context.read<ProductBloc>().add(AddProductEvent(
          title: _titleController.text,
          price: double.parse(_priceController.text),
          description: _descriptionController.text,
          catagory: _catagoryController.text,
          imageUrl: _selectedImagePath ));
  
  }


  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImagePath = pickedFile.path;
      });
    }
  }

  void reset() {
    setState(() {
      _titleController.text = '';
      _catagoryController.text = '';
      _descriptionController.text = '';
      _priceController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.chevron_left,
                            color: Colors.blue, size: 35)),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "Add  Product",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromRGBO(243, 243, 243, 1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_outlined,
                        size: 50,
                      ),
                      SizedBox(height: 12),
                      Text(
                        "upload image",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                TextBoxWidget(
                  title: 'name',
                ),
                TextBoxWidget(
                  title: 'category',
                ),
                TextBoxWidget(
                  title: 'price',
                ),
                TextBoxWidget(title: 'description', height: 140),
                ButtonWidget(
                  buttonWidth: double.infinity,
                  buttonText: "UPDATE",
                  buttonType: false,
                ),
                ButtonWidget(
                  buttonWidth: double.infinity,
                  buttonText: "DELETE",
                  buttonType: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
