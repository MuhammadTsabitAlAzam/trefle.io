import 'package:flutter/material.dart';

class PlantItem extends StatelessWidget {
  final String? image;
  final String commonName;
  final Function() onPressed;

  PlantItem({
    required this.image,
    required this.commonName,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: image != null
                  ? Image.network(
                      image!,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/Image_not_available.png',
                          height: 120,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.asset(
                      'assets/Image_not_available.png',
                      height: 120,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.transparent,
                child: Text(
                  commonName,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
