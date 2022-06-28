import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[600],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            height: 70.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'assets/img/JohnN.jpg',
                ),
              ),
            ),
          ),
          const Text(
            'Hello I\'m JohnN',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const Text(
            'Teknologi Informasi',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const Text(
            'Undiknas Denpasar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
