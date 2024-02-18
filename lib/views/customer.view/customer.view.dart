import 'package:demo_app/models/customer.models.dart';
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
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Demo App'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "First Name (A-Z)",
              ),
              Tab(
                text: "Province (A-Z)",
              ),
            ],
          ),
        ),
        body: Consumer<CustomerViewModel>(builder: (context, viewModel, child) {
          return TabBarView(
            children: <Widget>[
              Center(
                child: dataView(viewModel, "cFirstName"),
              ),
              Center(
                child: dataView(viewModel, "cProvince"),
              ),
            ],
          );
        }),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddCustomerView()));
          },
        ),
      ),
    );
  }

  Widget dataView(CustomerViewModel viewModel, String sortBy) {
    List<CustomerDataModel> dataList = [...viewModel.dataList];
    switch (sortBy) {
      case "cFirstName":
        dataList.sort(((a, b) => a.cFirstName!.compareTo(b.cFirstName!)));
      case "cProvince":
        dataList.sort(((a, b) => a.cProvince!.compareTo(b.cProvince!)));
    }
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final customer = dataList[index];
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
                  Navigator.of(context, rootNavigator: true).pop("Cancel");
                });
              },
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CustomerEdit(information: customer)));
            },
          ),
        );
      },
    );
  }
}
