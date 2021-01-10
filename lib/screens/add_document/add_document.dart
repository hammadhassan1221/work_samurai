import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:work_samurai/res/colors.dart';
import 'package:work_samurai/res/sizes.dart';
import 'package:work_samurai/screens/add_document/add_document_components.dart';
import 'package:work_samurai/screens/add_document/add_document_provider.dart';
import 'package:work_samurai/widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';

class AddDocument extends StatefulWidget {
  @override
  _AddDocumentState createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  AddDocumentComponents _addDocumentComponents;
  String _selectedValue;

  String _fileName;
  List<PlatformFile> _paths;
  String _directoryPath;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();
  AddDocumentProviders _addDocumentProviders;
  TextEditingController _description;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addDocumentComponents = AddDocumentComponents();
    _addDocumentProviders = Provider.of<AddDocumentProviders>(context, listen: false);
    _addDocumentProviders.init(context: context);
    _controller.addListener(() => _extension = _controller.text);
    _description = TextEditingController();
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: _multiPick,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '')?.split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _paths != null ? _paths.map((e) => e.name).toString() : '...';
    });
  }

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {
      setState(() => _directoryPath = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AddDocumentProviders>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: AppSizes.height,
        width: AppSizes.width,
        color: AppColors.clr_bg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets.getAppBar(
                text: "Document Verification", context: context),
            Expanded(
                child: ListView(
              children: [
                _addDocumentComponents.getHeadings(
                    text: "Add a Document Verification"),
                //_addDocumentComponents.getUserInfo(onPress: (){}, text: "Verification Type", text1: "VEVO Check", iconData: Icons.keyboard_arrow_down, colors: AppColors.clr_bg_black),
                Container(
                  padding: EdgeInsets.only(
                    left: AppSizes.width * 0.03,
                    right: AppSizes.width * 0.03,
                  ),
                  height: AppSizes.height * 0.07,
                  width: AppSizes.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.sign_field),
                      borderRadius: BorderRadius.circular(8)),
                  margin: EdgeInsets.only(
                    left: AppSizes.width * 0.03,
                    right: AppSizes.width * 0.03,
                    top: AppSizes.width * 0.03,
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    value: _selectedValue,
                    hint: Text("Verification Type"),
                    items: <String>[
                      'VEVO Check',
                      'Police Lodgement',
                      'Driver Licence',
                      'Tesla',
                      'Criminal Background Check'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                ),
                _addDocumentComponents.getDescriptionContainer(
                    heading: "Description", desc: _description),
                SizedBox(height: AppSizes.height * 0.025),
                _addDocumentComponents.getDottedContainer(
                  text: _addDocumentProviders.getIsPicked()? "Atteched":"Add File",
                    onPress: () => _addDocumentProviders.pickFile()),
              ],
            )),
            CommonWidgets.getBottomButton(name: "Save", onButtonClick: (){
              _addDocumentProviders.onUploadDocument(
                context: context,
                desc: _description.text,
                systemUserId: 1011,
                verificationMethodId: 2,
              );
            }),
            SizedBox(height: AppSizes.height * 0.025)
          ],
        ),
      ),
    ));
  }
}
