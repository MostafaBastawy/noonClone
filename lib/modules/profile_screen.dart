import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon_clone/cubit/cubit.dart';
import 'package:noon_clone/cubit/states.dart';
import 'package:noon_clone/modules/login_screen.dart';
import 'package:noon_clone/shared/components.dart';

class ProfileScreen extends StatelessWidget {
  var firstNameController = TextEditingController();
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getUserData();
    AppCubit cubit = AppCubit.get(context);

    firstNameController.text = cubit.userDataModel!.firstName.toString();
    fullNameController.text = cubit.userDataModel!.fullName.toString();
    phoneController.text = cubit.userDataModel!.phone.toString();
    addressController.text = cubit.userDataModel!.address.toString();
    cubit.getUserData();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {
        if (state is AppUserSignOutSuccessState) {
          navigateAndFinish(context: context, widget: LoginScreen());
        }
      },
      builder: (BuildContext context, state) {
        return ConditionalBuilder(
          condition: cubit.userDataModel != null,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cubit.userDataModel!.firstName.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.0),
                    ),
                    Text(
                      cubit.userDataModel!.email.toString(),
                      style: const TextStyle(fontSize: 15.0),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    defaultButton(
                      function: () {
                        cubit.userSignOut();
                      },
                      text: 'Logout',
                    ),
                  ],
                ),
              ),
            );
          },
          fallback: (BuildContext context) {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
