import 'package:demo_app/models/customer.models.dart';
import 'package:demo_app/view.models/customer.view.model.dart';
import 'package:demo_app/views/customer.view/customer.add.dart';
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
              return ListTile(
                title: Text("${customer.cFirstName} ${customer.cLastName}"),
                subtitle: Text('Tell: ${customer.cTell}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => viewModel.deleteCustomer(customer),
                ),
                onTap: () {},
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // final viewModel =
          //     Provider.of<CustomerViewModel>(context, listen: false);
          // CustomerDataModel req = CustomerDataModel(
          //     cId: "EZ0001",
          //     cFirstName: "1",
          //     cLastName: "",
          //     cAddress: "3ขฒ9114",
          //     cDistrict: "2024-01-31T10:14:48",
          //     cSubDistrict: "FLUKE",
          //     cProvince: "กรุงเทพมหานคร",
          //     cPostCode: "",
          //     cTell: "000000");
          // viewModel.addCustomer(req);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddCustomerView()));
        },
      ),
    );
  }
}
