import 'package:demo_app/models/api.models.dart';
import 'package:demo_app/models/customer.models.dart';
import 'package:demo_app/styles/allDialog.dart';
import 'package:demo_app/styles/theme.color.dart';
import 'package:demo_app/view.models/customer.view.model.dart';
import 'package:demo_app/views/customer.view/customer.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class CustomerEdit extends StatefulWidget {
  final CustomerDataModel information;
  const CustomerEdit({super.key, required this.information});

  @override
  State<CustomerEdit> createState() => _CustomerEditState();
}

class _CustomerEditState extends State<CustomerEdit> {
  double widthScreen = 0;
  FocusNode cIdNode = FocusNode();
  FocusNode cFirstNameNode = FocusNode();
  FocusNode cLastNameNode = FocusNode();
  FocusNode cAddressNode = FocusNode();
  FocusNode cTellNode = FocusNode();

  TextEditingController cIdController = TextEditingController();
  TextEditingController cFirstNameController = TextEditingController();
  TextEditingController cLastNameController = TextEditingController();
  TextEditingController cAddressController = TextEditingController();
  String cDistrictController = "";
  String cSubDistrictController = "";
  String cProvinceController = "";
  String cPostCodeController = "10110";
  TextEditingController cTellController = TextEditingController();
  List<DropdownMenuItem> provinceList = [
    DropdownMenuItem(
      value: "",
      child: Text(
        "Please choose a province",
        style: TextStyle(color: ThemeColorApp().placeholder),
      ),
    ),
    const DropdownMenuItem(
      value: "กรุงเทพมหานคร",
      child: Text("กรุงเทพมหานคร"),
    ),
    const DropdownMenuItem(
      value: "พะเยา",
      child: Text("พะเยา"),
    ),
  ];

  List<DropdownMenuItem> districtList = [
    DropdownMenuItem(
      value: "",
      child: Text(
        "Please choose a district",
        style: TextStyle(color: ThemeColorApp().placeholder),
      ),
    ),
  ];

  List<DropdownMenuItem> subDistrictList = [
    DropdownMenuItem(
      value: "",
      child: Text(
        "Please choose a subdistrict",
        style: TextStyle(color: ThemeColorApp().placeholder),
      ),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    cIdController.text = widget.information.cId!;
    cFirstNameController.text = widget.information.cFirstName!;
    cLastNameController.text = widget.information.cLastName!;
    cAddressController.text = widget.information.cAddress!;
    cDistrictController = widget.information.cDistrict!;
    cSubDistrictController = widget.information.cSubDistrict!;
    cProvinceController = widget.information.cProvince!;
    cPostCodeController = widget.information.cPostCode!;
    cTellController.text = widget.information.cTell!;
    switch (widget.information.cProvince) {
      case "พะเยา":
        {
          cPostCodeController = "56000";
          districtList = [
            DropdownMenuItem(
              value: "",
              child: Text(
                "Please choose a district",
                style: TextStyle(color: ThemeColorApp().placeholder),
              ),
            ),
            const DropdownMenuItem(
              value: "แม่กา",
              child: Text("แม่กา"),
            )
          ];

          subDistrictList = [
            DropdownMenuItem(
              value: "",
              child: Text(
                "Please choose a subdistrict",
                style: TextStyle(color: ThemeColorApp().placeholder),
              ),
            ),
            const DropdownMenuItem(
              value: "เมืองพะเยา",
              child: Text("เมืองพะเยา"),
            )
          ];
        }
      case "กรุงเทพมหานคร":
        {
          cPostCodeController = "10110";
          districtList = [
            DropdownMenuItem(
              value: "",
              child: Text(
                "Please choose a district",
                style: TextStyle(color: ThemeColorApp().placeholder),
              ),
            ),
            const DropdownMenuItem(
              value: "คลองเตย",
              child: Text("คลองเตย"),
            )
          ];

          subDistrictList = [
            DropdownMenuItem(
              value: "",
              child: Text(
                "Please choose a subdistrict",
                style: TextStyle(color: ThemeColorApp().placeholder),
              ),
            ),
            const DropdownMenuItem(
              value: "คลองเตย",
              child: Text("คลองเตย"),
            ),
            const DropdownMenuItem(
              value: "คลองตัน",
              child: Text("คลองตัน"),
            ),
            const DropdownMenuItem(
              value: "พระโขนง",
              child: Text("พระโขนง"),
            ),
          ];
        }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Customer"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [informationForm(), addressForm(), footer()],
            ),
          ),
        ));
  }

  Widget informationForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 48,
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: widthScreen * 0.2,
                      child: const Center(child: Text("ID:")),
                    ),
                    Container(
                      width: widthScreen * 0.7,
                      color: Colors.grey[300],
                      child: TextFormField(
                        enabled: false,
                        focusNode: cIdNode,
                        cursorColor: ThemeColorApp().primaryColor,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(13),
                        ],
                        keyboardType: TextInputType.number,
                        controller: cIdController,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: ThemeColorApp().secondaryColor,
                        ),
                        decoration: InputDecoration(
                          hintText: "Identification Number 13 digit",
                          hintStyle: TextStyle(
                            color: ThemeColorApp().placeholder,
                            fontSize: 14.0,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            cIdController.text = value;
                            cIdController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: cIdController.text.length));
                          });
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            cIdController.text = value;
                          });
                          FocusScope.of(context).requestFocus(cFirstNameNode);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 48,
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: widthScreen * 0.2,
                      child: const Center(child: Text("First Name:")),
                    ),
                    Container(
                      width: widthScreen * 0.7,
                      child: TextFormField(
                        focusNode: cFirstNameNode,
                        cursorColor: ThemeColorApp().primaryColor,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(13),
                        ],
                        keyboardType: TextInputType.text,
                        controller: cFirstNameController,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: ThemeColorApp().secondaryColor,
                        ),
                        decoration: InputDecoration(
                          hintText: "First Name",
                          hintStyle: TextStyle(
                            color: ThemeColorApp().placeholder,
                            fontSize: 14.0,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            cFirstNameController.text = value;
                            cFirstNameController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: cFirstNameController.text.length));
                          });
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            cFirstNameController.text = value;
                          });
                          FocusScope.of(context).requestFocus(cLastNameNode);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 48,
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: widthScreen * 0.2,
                      child: const Center(child: Text("Last Name:")),
                    ),
                    Container(
                      width: widthScreen * 0.7,
                      child: TextFormField(
                        focusNode: cLastNameNode,
                        cursorColor: ThemeColorApp().primaryColor,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(13),
                        ],
                        keyboardType: TextInputType.text,
                        controller: cLastNameController,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: ThemeColorApp().secondaryColor,
                        ),
                        decoration: InputDecoration(
                          hintText: "Last Name",
                          hintStyle: TextStyle(
                            color: ThemeColorApp().placeholder,
                            fontSize: 14.0,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            cLastNameController.text = value;
                            cLastNameController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: cLastNameController.text.length));
                          });
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            cLastNameController.text = value;
                          });
                          FocusScope.of(context).requestFocus(cAddressNode);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addressForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 48,
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: widthScreen * 0.2,
                      child: const Center(child: Text("Address:")),
                    ),
                    Container(
                      width: widthScreen * 0.7,
                      child: TextFormField(
                        focusNode: cAddressNode,
                        cursorColor: ThemeColorApp().primaryColor,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(13),
                        ],
                        keyboardType: TextInputType.number,
                        controller: cAddressController,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: ThemeColorApp().secondaryColor,
                        ),
                        decoration: InputDecoration(
                          hintText: "Address",
                          hintStyle: TextStyle(
                            color: ThemeColorApp().placeholder,
                            fontSize: 14.0,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            cAddressController.text = value;
                            cAddressController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: cAddressController.text.length));
                          });
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            cAddressController.text = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 64,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: widthScreen * 0.2,
                    child: const Center(child: Text("Province:")),
                  ),
                  Container(
                    width: widthScreen * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9.0)),
                        border: Border.all(color: ThemeColorApp().placeholder)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: Icon(Icons.arrow_drop_down_circle,
                              color: Colors.grey.withOpacity(0.7)),
                          items: provinceList,
                          onChanged: (value) {
                            setState(() {
                              cProvinceController = value;
                              cDistrictController = "";
                              cSubDistrictController = "";
                              cPostCodeController = "";
                              districtList = [];
                              subDistrictList = [];
                              switch (value) {
                                case "พะเยา":
                                  {
                                    cPostCodeController = "56000";
                                    districtList = [
                                      DropdownMenuItem(
                                        value: "",
                                        child: Text(
                                          "Please choose a district",
                                          style: TextStyle(
                                              color:
                                                  ThemeColorApp().placeholder),
                                        ),
                                      ),
                                      const DropdownMenuItem(
                                        value: "แม่กา",
                                        child: Text("แม่กา"),
                                      )
                                    ];

                                    subDistrictList = [
                                      DropdownMenuItem(
                                        value: "",
                                        child: Text(
                                          "Please choose a subdistrict",
                                          style: TextStyle(
                                              color:
                                                  ThemeColorApp().placeholder),
                                        ),
                                      ),
                                      const DropdownMenuItem(
                                        value: "เมืองพะเยา",
                                        child: Text("เมืองพะเยา"),
                                      )
                                    ];
                                  }
                                case "กรุงเทพมหานคร":
                                  {
                                    cPostCodeController = "10110";
                                    districtList = [
                                      DropdownMenuItem(
                                        value: "",
                                        child: Text(
                                          "Please choose a district",
                                          style: TextStyle(
                                              color:
                                                  ThemeColorApp().placeholder),
                                        ),
                                      ),
                                      const DropdownMenuItem(
                                        value: "คลองเตย",
                                        child: Text("คลองเตย"),
                                      )
                                    ];

                                    subDistrictList = [
                                      DropdownMenuItem(
                                        value: "",
                                        child: Text(
                                          "Please choose a subdistrict",
                                          style: TextStyle(
                                              color:
                                                  ThemeColorApp().placeholder),
                                        ),
                                      ),
                                      const DropdownMenuItem(
                                        value: "คลองเตย",
                                        child: Text("คลองเตย"),
                                      ),
                                      const DropdownMenuItem(
                                        value: "คลองตัน",
                                        child: Text("คลองตัน"),
                                      ),
                                      const DropdownMenuItem(
                                        value: "พระโขนง",
                                        child: Text("พระโขนง"),
                                      ),
                                    ];
                                  }
                              }
                            });
                          },
                          value: cProvinceController,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 64,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: widthScreen * 0.2,
                    child: const Center(child: Text("District:")),
                  ),
                  Container(
                    width: widthScreen * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9.0)),
                        border: Border.all(color: ThemeColorApp().placeholder)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: Icon(Icons.arrow_drop_down_circle,
                              color: Colors.grey.withOpacity(0.7)),
                          items: districtList,
                          onChanged: (value) {
                            setState(() {
                              cDistrictController = value;
                            });
                          },
                          value: cDistrictController,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 64,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: widthScreen * 0.2,
                    child: const Center(child: Text("Subdistrict:")),
                  ),
                  Container(
                    width: widthScreen * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9.0)),
                        border: Border.all(color: ThemeColorApp().placeholder)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: Icon(Icons.arrow_drop_down_circle,
                              color: Colors.grey.withOpacity(0.7)),
                          items: subDistrictList,
                          onChanged: (value) {
                            setState(() {
                              cSubDistrictController = value;
                              if (value == "เมืองพะเยา") {
                                cPostCodeController = "56000";
                              }
                            });
                          },
                          value: cSubDistrictController,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              height: 64,
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: widthScreen * 0.2,
                      child: const Center(child: Text("Post Code:")),
                    ),
                    Container(
                      width: widthScreen * 0.7,
                      height: 48,
                      decoration: BoxDecoration(
                        color: HexColor("#f1f1f1"),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 14, 8, 8),
                        child: Text(cSubDistrictController == ""
                            ? "00000"
                            : cPostCodeController),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 48,
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: widthScreen * 0.2,
                    child: const Center(child: Text("Tell:")),
                  ),
                  Container(
                    width: widthScreen * 0.7,
                    child: TextFormField(
                      focusNode: cTellNode,
                      cursorColor: ThemeColorApp().primaryColor,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      keyboardType: TextInputType.number,
                      controller: cTellController,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: ThemeColorApp().secondaryColor,
                      ),
                      decoration: InputDecoration(
                        hintText: "Tell",
                        hintStyle: TextStyle(
                          color: ThemeColorApp().placeholder,
                          fontSize: 14.0,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          cTellController.text = value;
                          cTellController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: cTellController.text.length));
                        });
                      },
                      onFieldSubmitted: (value) {
                        setState(() {
                          cTellController.text = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pop("Cancel");
                  },
                  child: Container(
                    width: widthScreen * 0.4,
                    height: 48,
                    decoration: BoxDecoration(
                      color: ThemeColorApp().placeholder,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(9.0)),
                    ),
                    child: const Center(child: Text("Cancel")),
                  )),
              const Spacer(),
              InkWell(
                  onTap: () {
                    updateCustomer();
                  },
                  child: Container(
                    width: widthScreen * 0.4,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    ),
                    child: const Center(
                        child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    )),
                  )),
            ],
          )),
    );
  }

  ApiResponseModel validateInformation() {
    bool error = false;
    String errorMessage = "";

    if (cFirstNameController.text == "") {
      error = true;
      errorMessage = "Please enter First Name.";
    }

    if (cLastNameController.text == "") {
      error = true;
      errorMessage = "Please enter Last Name.";
    }

    if (cAddressController.text == "") {
      error = true;
      errorMessage = "Please enter Address.";
    }

    if (cDistrictController == "") {
      error = true;
      errorMessage = "Please enter District.";
    }

    if (cSubDistrictController == "") {
      error = true;
      errorMessage = "Please enter Subdistrict.";
    }

    if (cProvinceController == "") {
      error = true;
      errorMessage = "Please enter Province.";
    }
    return ApiResponseModel(success: error, message: errorMessage, result: "");
  }

  updateCustomer() {
    ApiResponseModel validate = validateInformation();

    if (validate.success == true) {
      Tdialog.errorDialog(
        context,
        '${validate.message}',
        () {
          Navigator.of(context, rootNavigator: true).pop("Ok");
        },
      );
    } else {
      final viewModel = Provider.of<CustomerViewModel>(context, listen: false);
      CustomerDataModel req = CustomerDataModel(
          cId: cIdController.text,
          cFirstName: cFirstNameController.text,
          cLastName: cLastNameController.text,
          cAddress: cAddressController.text,
          cDistrict: cDistrictController,
          cSubDistrict: cSubDistrictController,
          cProvince: cProvinceController,
          cPostCode: cPostCodeController,
          cTell: cTellController.text);

      viewModel.editCustomer(widget.information, req);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const CustomerView()),
          (Route<dynamic> route) => false);
    }
  }
}
