import 'package:flutter/material.dart';
import 'form_detail.dart'; // Update if necessary to match the updated FormDetail class

class FormInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormInputState();
  }
}

class FormInputState extends State<FormInput> {
  final _productNameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  final List<String> availabilityOptions = ['In Stock', 'Out of Stock'];
  String? selectedAvailability;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Form'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _textboxProductName(),
              _textboxCategory(),
              _textboxPrice(),
              _textboxDescription(),
              _dropdownAvailability(),
              const SizedBox(height: 20.0),
              _saveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textboxProductName() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: _inputDecoration(),
      child: TextField(
        controller: _productNameController,
        decoration: const InputDecoration(
          labelText: "Product Name",
          prefixIcon: Icon(Icons.shopping_cart),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
      ),
    );
  }

  Widget _textboxCategory() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: _inputDecoration(),
      child: TextField(
        controller: _categoryController,
        decoration: const InputDecoration(
          labelText: "Category",
          prefixIcon: Icon(Icons.category),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
      ),
    );
  }

  Widget _textboxPrice() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: _inputDecoration(),
      child: TextField(
        controller: _priceController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: "Price",
          prefixIcon: Icon(Icons.attach_money),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
      ),
    );
  }

  Widget _textboxDescription() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: _inputDecoration(),
      child: TextField(
        controller: _descriptionController,
        maxLines: 3,
        decoration: const InputDecoration(
          labelText: "Description",
          prefixIcon: Icon(Icons.description),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
      ),
    );
  }

  Widget _dropdownAvailability() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      decoration: _inputDecoration(),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: "Availability",
          prefixIcon: Icon(Icons.check_circle),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
        items: availabilityOptions
            .map((option) => DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                ))
            .toList(),
        value: selectedAvailability,
        onChanged: (String? value) {
          setState(() {
            selectedAvailability = value;
          });
        },
      ),
    );
  }

  Widget _saveButton() {
    return ElevatedButton(
      onPressed: () {
        // Collect input data
        String productName = _productNameController.text;
        String category = _categoryController.text;
        String price = _priceController.text;
        String description = _descriptionController.text;
        String availability = selectedAvailability ?? 'Not Specified';

        // Navigate to details page with the collected data
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FormDetail(
              productName: productName,
              category: category,
              price: price,
              description: description,
              availability: availability,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        elevation: 5.0,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      child: const Text(
        'Save',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  BoxDecoration _inputDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
