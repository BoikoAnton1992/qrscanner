import 'package:barcode_scan2/model/scan_result.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrscan/l10n_extension.dart';
import 'package:qrscan/page/scan_list_screen/widget/baracode.dart';
import 'package:share/share.dart';
import '../../widget/custom_app_bar.dart';
import '../scan_screen/widget/copyable_text.dart';
import 'widget/custom_floating_button.dart';
import 'widget/custom_floating_icon_button.dart';

class ScanListOfcode extends StatefulWidget {
  const ScanListOfcode({super.key});

  @override
  State<ScanListOfcode> createState() => _ScanListOfcodeState();
}

class _ScanListOfcodeState extends State<ScanListOfcode> {
  List<String> qrListResult = [];

  Future openDialogDelete(int index) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            context.text.scanListScreenDialogDeleteTitle,
            textAlign: TextAlign.center,
          ),
          content: Text(qrListResult[index]),
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child:
                      Text(context.text.scanListScreenDialogDeleteButtonClose)),
              TextButton(
                  onPressed: () {
                    deleteItem(index);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(milliseconds: 750),
                          content: Text(
                            context.text.scanListScreenDialogDeleteButtonDelete,
                            textAlign: TextAlign.center,
                          )),
                    );
                  },
                  child: Text(context.text.scanListScreenDialogDeleteButtonYes))
            ])
          ],
        );
      });

  Future openDialogDeleteAll(qrListResult) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              context.text.scanListScreenDialogDeleteAllTitle,
              textAlign: TextAlign.center,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                        context.text.scanListScreenDialogDeleteButtonClose),
                  ),
                  TextButton(
                    onPressed: () {
                      deleteAllItem(qrListResult);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(milliseconds: 750),
                          content: Text(
                            context.text.scanListScreenDialogDeleteButtonDelete,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    child:
                        Text(context.text.scanListScreenDialogDeleteButtonYes),
                  ),
                ],
              ),
            ],
          );
        },
      );

  void deleteItem(int index) {
    setState(() {
      qrListResult.removeAt(index);
    });
  }

  void deleteAllItem(int index) {
    setState(() {
      qrListResult.clear();
    });
  }

  void copyToClipboard(List<String> qrListResult) {
    String text = qrListResult.join(', ');
    Clipboard.setData(ClipboardData(text: text));
  }

  void _shareQR() {
    String qrListResultString = qrListResult.join(', ');
    Share.share(qrListResultString);
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (qrListResult.isEmpty) {
      body = Center(
        child: Text(
          context.text.scanListScreenCenterText,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      );
    } else {
      body = ListView.separated(
        separatorBuilder: (context, index) => const Divider(thickness: 3),
        itemCount: qrListResult.length,
        padding: const EdgeInsets.only(bottom: 35.0),
        itemBuilder: ((context, index) {
          BarcodeGenerator barcodeGenerator = BarcodeGenerator(
            data: qrListResult[index],
            barcodeType: BarcodeType.code128,
          );
          var isLink = Uri.tryParse(qrListResult[index])?.isAbsolute ?? false;
          return ListTile(
            onLongPress: () {
              String elementToCopy = qrListResult[index];
              Clipboard.setData(ClipboardData(text: elementToCopy));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    behavior: SnackBarBehavior.floating,
                    duration: const Duration(milliseconds: 750),
                    content: Text(
                      context
                          .text.scanListScreenBootonCopyScanResaultOnLongPress,
                      textAlign: TextAlign.center,
                    )),
              );
            },
            title: CopyableText(
              text: qrListResult[index],
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                openDialogDelete(index);
              },
            ),
            subtitle: isLink
                ? const SizedBox.shrink()
                : barcodeGenerator.build(context),
          );
        }),
      );
    }
    return Scaffold(
      appBar: CustomAppBar(
        action: IconButton(
            onPressed: () {
              openDialogDeleteAll(qrListResult.length);
            },
            icon: const Icon(
              Icons.cleaning_services_outlined,
              color: Colors.white,
            )),
        title: context.text.scanListScreenTitle,
      ),
      body: body,
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(
                width: 13,
              ),
              CustomFloatingIconButton(
                key: const ValueKey('copy'),
                onPressed: () {
                  if (qrListResult.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(milliseconds: 750),
                        content: Text(
                          context
                              .text.scanListScreenSnackBarBehaviorCopyfirstText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    copyToClipboard(qrListResult);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(milliseconds: 750),
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          context.text
                              .scanListScreenSnackBarBehaviorCopySecondText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                height: 65,
                icon: Icons.copy,
                width: 65,
              ),
              const Spacer(),
              CustomFloatingIconButton(
                key: const ValueKey('send'),
                onPressed: () {
                  if (qrListResult.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(milliseconds: 750),
                        content: Text(
                          context
                              .text.scanListSreenSnackBarBehaviorSendSecondText,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  } else {
                    _shareQR();
                  }
                },
                height: 65,
                icon: Icons.send,
                width: 65,
              ),
              const SizedBox(
                width: 13,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        key: const ValueKey('add'),
        onPressed: () async {
          ScanResult scaning = await BarcodeScanner.scan();
          setState(() {
            if (scaning.rawContent.isNotEmpty) {
              qrListResult.add(scaning.rawContent);
            }
          });
        },
        height: 70,
        icon: Icons.add,
        width: 70,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
