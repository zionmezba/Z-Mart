import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:z_mart/common/widgets/appbar/appbar.dart';
import 'package:z_mart/utils/constants/sizes.dart%20';
import 'package:z_mart/utils/helpers/helper_functions.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const ZAppBar(
        title: Text("Add new address"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                            color: dark ? Colors.white : Colors.black),
                        prefixIcon: const Icon(Iconsax.user),
                        labelText: 'Name')),
                const SizedBox(height: ZSizes.spaceBetweenInputFields),
                TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: 'Phone Number')),
                const SizedBox(height: ZSizes.spaceBetweenInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                              floatingLabelStyle: TextStyle(
                                  color: dark ? Colors.white : Colors.black),
                              prefixIcon: const Icon(Iconsax.building_31),
                              labelText: 'Street')),
                    ),
                    const SizedBox(width: ZSizes.spaceBetweenInputFields),
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                              floatingLabelStyle: TextStyle(
                                  color: dark ? Colors.white : Colors.black),
                              prefixIcon: const Icon(Iconsax.code),
                              labelText: 'Postal Code')),
                    ),
                  ],
                ),
                const SizedBox(height: ZSizes.spaceBetweenInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                              floatingLabelStyle: TextStyle(
                                  color: dark ? Colors.white : Colors.black),
                              prefixIcon: const Icon(Iconsax.building),
                              labelText: 'City')),
                    ),
                    const SizedBox(width: ZSizes.spaceBetweenInputFields),
                    Expanded(
                      child: TextFormField(
                          decoration: InputDecoration(
                              floatingLabelStyle: TextStyle(
                                  color: dark ? Colors.white : Colors.black),
                              prefixIcon: const Icon(Iconsax.activity),
                              labelText: 'State')),
                    ),
                  ],
                ),
                const SizedBox(height: ZSizes.spaceBetweenInputFields),
                TextFormField(
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(
                            color: dark ? Colors.white : Colors.black),
                        prefixIcon: const Icon(Iconsax.global),
                        labelText: 'Country')),
                const SizedBox(height: ZSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
