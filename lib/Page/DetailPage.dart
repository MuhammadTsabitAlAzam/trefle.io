import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/ApiServices/PlantApi.dart';
import 'package:project_akhir_mobile/Component/DefaultButton.dart';
import 'package:project_akhir_mobile/Templates/Text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Models/PlantModel.dart';

class DetailPage extends StatefulWidget {
  final String links;

  DetailPage({Key? key, required this.links});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late PlantDetail _plantDetail;

  @override
  void initState() {
    super.initState();
    _plantDetail = PlantDetail(
        id: 0,
        commonName: '',
        scientificName: '',
        imageUrl: '',
        edible: false,
        genus: '',
        family: '',
        leafImages: [],
        barkImages: [],
        habitImages: [],
        fruitImages: [],
        natives: [],
        synonyms: [],
      edibleParts: []
    );
    _fetchPlantDetail();
  }

  Future<void> _fetchPlantDetail() async {
    try {
      ApiServicePlant apiService = ApiServicePlant();
      PlantDetail plantDetail = await apiService.fetchPlantDetail(widget.links);
      setState(() {
        _plantDetail = plantDetail;
      });
    } catch (error) {
      print('Error fetching plant detail: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //Gambar Utama
            Container(
              child: _plantDetail.imageUrl != null
                  ? Image.network(
                      _plantDetail.imageUrl!,
                      height: _height / 3,
                      width: _width - 50,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/Image_not_available.png',
                          height: _height / 3,
                          width: _width - 50,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.asset(
                      'assets/Image_not_available.png',
                      height: _height / 3,
                      width: _width - 50,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 20,),

            //Kotak Detail Tanaman
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: _width - 50,
              decoration: BoxDecoration(
                //color: Colors.white,
                border: Border.all(width: 0.1)
              ),
              child: Column(
                children: [
                  BoldText(_plantDetail.commonName),
                  Subtitle('(${_plantDetail.scientificName})'),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CommonText('Family'),
                      ),
                      Expanded(
                        child: CommonText(_plantDetail.family),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CommonText('Genus'),
                      ),
                      Expanded(
                        child: CommonText(_plantDetail.genus),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CommonText('Edible'),
                      ),
                      Expanded(
                        child: CommonText(_plantDetail.edible ? 'Yes' : 'No'),
                      ),
                    ],
                  ),
                  if (_plantDetail.edible)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CommonText('Edible Parts'),
                        ),
                        Expanded(
                          child: CommonText(_plantDetail.edibleParts != null ? _plantDetail.edibleParts!.join(', ') : ''),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CommonText('Synonyms'),
                      ),
                      Expanded(
                        child: CommonText(_plantDetail.synonyms.isNotEmpty ? _plantDetail.synonyms.first : ''),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CommonText('Natives'),
                      ),
                      Expanded(
                        child: CommonText(_plantDetail.natives.isNotEmpty ? _plantDetail.natives.first.name : ''),
                      ),
                    ],
                  ),
                  if (_plantDetail.leafImages.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: CommonText('Leaf Images')),
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _plantDetail.leafImages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0),
                                  child: Image.network(
                                    _plantDetail.leafImages[index].imageUrl,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                  // Display Bark Images
                  if (_plantDetail.barkImages.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: CommonText('Bark Images')),
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _plantDetail.barkImages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0),
                                  child: Image.network(
                                    _plantDetail.barkImages[index].imageUrl,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                  // Display Habit Images
                  if (_plantDetail.habitImages.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: CommonText('Habit Images')),
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _plantDetail.habitImages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0),
                                  child: Image.network(
                                    _plantDetail.habitImages[index].imageUrl,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                  // Display Fruit Images
                  if (_plantDetail.fruitImages.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: CommonText('Fruit Images')),
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _plantDetail.fruitImages.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4.0),
                                  child: Image.network(
                                    _plantDetail.fruitImages[index].imageUrl,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            DefaultButton(
              label: 'Info Lainnya',
              onPressed: () async {
                Uri wikipediaUrl = Uri.parse('https://id.wikipedia.org/w/index.php?search=${_plantDetail.scientificName}');
                if (!await launchUrl(wikipediaUrl)) {
                  print('Could not launch $wikipediaUrl');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}