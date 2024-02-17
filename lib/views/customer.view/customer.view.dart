import 'package:demo_app/styles/allDialog.dart';
import 'package:demo_app/view.models/customer.view.model.dart';
import 'package:demo_app/views/customer.view/customer.add.dart';
import 'package:demo_app/views/customer.view/customer.edit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo App')),
      body: Consumer<CustomerViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.dataList.length,
            itemBuilder: (context, index) {
              final customer = viewModel.dataList[index];
              return Container(
                color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                child: ListTile(
                  title: Text("${customer.cFirstName} ${customer.cLastName}"),
                  subtitle: Text('Province: ${customer.cProvince}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      Tdialog.infoDialog(
                          context,
                          Text(
                              "Do you want delete ${customer.cFirstName} ${customer.cLastName} ?"),
                          () {
                        viewModel.deleteCustomer(customer);
                        Navigator.of(context, rootNavigator: true).pop("Ok");
                      }, () {
                        Navigator.of(context, rootNavigator: true)
                            .pop("Cancel");
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CustomerEdit(information: customer)));
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddCustomerView()));
        },
      ),
    );
  }
}
