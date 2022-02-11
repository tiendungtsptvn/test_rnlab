import 'package:flutter/material.dart';
import 'package:rn_lab/data/model/category_model.dart';
import 'package:rn_lab/helper/dimension.dart';
import 'package:rn_lab/presentation/category/list_category_bloc.dart';

class ListCategoryScreen extends StatefulWidget {
  const ListCategoryScreen({Key? key}) : super(key: key);

  @override
  _ListCategoryScreenState createState() => _ListCategoryScreenState();
}

class _ListCategoryScreenState extends State<ListCategoryScreen> {
  ListCategoryBloc? bloc;
  @override
  void initState() {
    bloc = ListCategoryBloc()..init();
    super.initState();
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int padding = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(width(context, 20)),
        child: SingleChildScrollView(
            child: StreamBuilder<List<CategoryModel>>(
          stream: bloc?.categoriesStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              padding = 0;
              return Column(
                children: [_buildPanel(bloc?.categories, padding)],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        )),
      ),
    );
  }

  Widget _buildPanel(List<CategoryModel>? items, int padding) {
    if (items != null) {
      padding += 15;
      return ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 500),
        expansionCallback: (int index, bool isExpanded) {
          items[index].isExpanded = !isExpanded;
          if (items[index].categories != null) {
            for (var i in items[index].categories!) {
              i.isExpanded = false;
            }
          }
          setState(() {});
        },
        children: items.map((CategoryModel item) {
          return ExpansionPanel(
            hideIcon: (item.categories!.isNotEmpty) ? false : true,
            backgroundColor: Colors.grey.withOpacity(0.3),
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                height: height(context, 20),
                padding: EdgeInsets.only(
                  left: width(context, double.parse(padding.toString())),
                ),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            (item.image?.src != null)
                                ? "${item.image?.src}"
                                : "",
                            errorBuilder: (BuildContext context,
                                Object? exception, StackTrace? stackTrace) {
                              return Image(
                                image: const AssetImage(
                                    "assets/images/default_image.png"),
                                width: width(context, 30),
                                height: width(context, 30),
                                fit: BoxFit.fill,
                              );
                            },
                            height: width(context, 30),
                            width: width(context, 30),
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            (item.name ?? ""),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: fontSize(context, 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
            body: (item.categories != null)
                ? ((item.categories!.isNotEmpty)
                    ? _buildPanel(item.categories, padding)
                    : const SizedBox.shrink())
                : const SizedBox.shrink(),
            isExpanded:
                ((item.categories!.isNotEmpty) ? item.isExpanded : false),
          );
        }).toList(),
        dividerColor: Colors.grey.withOpacity(0.5),
        elevation: 1,
      );
    }
    return const SizedBox.shrink();
  }
}
