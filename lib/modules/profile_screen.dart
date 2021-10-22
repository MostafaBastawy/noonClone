import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  var firstNameController = TextEditingController();
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ahlan Mostafa',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
            ),
            const Text(
              'mostafa@gmail.com',
              style: TextStyle(fontSize: 15.0),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            TextFormField(
              controller: firstNameController,
              keyboardType: TextInputType.name,
              validator: (String? value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
                prefixIcon: Icon(Icons.person),
              ),
              onTap: () {},
              onChanged: (String value) {},
              onFieldSubmitted: (value) {},
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              controller: fullNameController,
              keyboardType: TextInputType.name,
              validator: (String? value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
              ),
              onTap: () {},
              onChanged: (String value) {},
              onFieldSubmitted: (value) {},
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.text,
              validator: (String? value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
                prefixIcon: Icon(Icons.phone),
              ),
              onTap: () {},
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              controller: addressController,
              keyboardType: TextInputType.phone,
              validator: (String? value) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address',
                prefixIcon: Icon(Icons.location_city),
              ),
              onTap: () {},
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
