import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/Templates/Text.dart';

class KesanPesanPage extends StatelessWidget {
  const KesanPesanPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img_2.png'),
          fit: BoxFit.cover
        )
      ),
      height: MediaQuery.of(context).size.height-60,
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: EdgeInsets.all(20),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldText('Kesan dan Pesan'),
                    SizedBox(height: 10,),
                    Divider(color: Colors.black,),
                    SizedBox(height: 10,),
                    KesanPesanText('Saya mengucapkan terima kasih atas pengajaran yang telah diberikan bapak selama ini. Saya juga menghargai upaya bapak untuk memahamkan kami melalui soal-soal dan tugas yang diberikan. Namun, bagi saya sendiri masih kesulitan dalam mengaplikasikan konsep-konsep tersebut. Terimakasih'),
                  ],
        ),
              ),
            ],
          ),
      ),
    );
  }
}
