import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/Component/SearchButton.dart';
import 'package:project_akhir_mobile/Component/SearchField.dart';
import 'package:project_akhir_mobile/Templates/Text.dart';

import '../ApiServices/PlantApi.dart';
import '../Component/PlantItem.dart';
import '../Models/PlantModel.dart';
import '../Screen/DetailScreen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final TextEditingController _search = TextEditingController();

class _HomePageState extends State<HomePage> {
  ApiServicePlant apiService = ApiServicePlant();
  List<PlantSpecies> speciesList = [];
  int page = 1;
  bool isSearching = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    try {
      List<PlantSpecies> data = await apiService.fetchData(page: page);
      setState(() {
        speciesList.addAll(data);
        page++;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> searchFetchData() async {
    try {
      List<PlantSpecies> data =
      await apiService.SearchfetchData(page: page, search: _search.text);
      setState(() {
        speciesList.addAll(data);
        page++;
        print('Species list length: ${speciesList.length}');
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  void resetSpeciesList() {
    setState(() {
      speciesList = [];
      page = 1;
    });
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      isSearching ? searchFetchData() : fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    int columns = (MediaQuery.of(context).size.width / 200).round();
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          children: [
            Center(
              child: TitleText("Find Your Plant"),
            ),
            Container(
              height: 75,
              width: MediaQuery.of(context).size.width - 50,
              child: Row(
                children: [
                  SearchField(
                      controller: _search,
                      onPressed: () {
                        setState(() {
                          isSearching = false;
                        });
                        _search.clear();
                        resetSpeciesList();
                        fetchData();
                      }),
                  SearchButton(
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
                      resetSpeciesList();
                      searchFetchData();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: speciesList.length,
                itemBuilder: (context, index) {
                  return PlantItem(
                    image: speciesList[index].imageUrl,
                    commonName: speciesList[index].commonName ?? 'Unknown',
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen(links: speciesList[index].detail!,)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

