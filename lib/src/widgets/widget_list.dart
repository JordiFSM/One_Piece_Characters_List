
import 'package:flutter/material.dart';
import 'package:one_piece_list/src/pages/detail_page.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({super.key});  

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {

  double screenWidth = 0;
  double screenHeight = 0;

  final titleStyleText = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {

    screenWidth = MediaQuery.of(context).size.width - 50;

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Text(
            'Portadas',
            style: titleStyleText
          ),
          const SizedBox(
                height: 15,
              ),
          Row(
            children: [
              fontBlock('p1.jpg','Temporada: ','2019'),
              SizedBox(
                width: screenWidth*0.03,
              ),
              fontBlock('p2.jpg','Temporada: ','2012'),
               SizedBox(
                width: screenWidth*0.03,
              ),
              fontBlock('p3.jpg','Temporada: ','2014'),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.white,
          ),
          const SizedBox(
                height: 20,
              ),
          characterBlock('Brook', Color.fromARGB(202, 152, 0, 253), 'o1', context),
          characterBlock('Monkey D. Luffy', Color.fromARGB(66, 207, 22, 22), 'o2', context),
          characterBlock('Portgas D. Ace', Color.fromARGB(66, 224, 138, 9), 'o3', context),
          characterBlock('Nico Robin', Color.fromARGB(209, 54, 13, 236), 'o4', context),
          characterBlock('Boa Hancock', Color.fromARGB(66, 235, 120, 120), 'o5', context),
          characterBlock('Roronoa Zoro', Color.fromARGB(195, 2, 255, 36), 'o6', context),
          characterBlock('Enel', Color.fromARGB(209, 173, 189, 28), 'o7', context),
          characterBlock('Usoop', Color.fromARGB(66, 18, 38, 223), 'o8', context),
          characterBlock('Tony Tony Chopper', Color.fromARGB(66, 253, 10, 103), 'o9', context),
          characterBlock('Eustas Kid', Color.fromARGB(230, 121, 0, 0), 'o10', context), 
          characterBlock('Kaikyō no Jinbē', Color.fromARGB(230, 231, 133, 5), 'o11', context), 
          characterBlock('Sir Crocodile', Color.fromARGB(237, 0, 109, 36), 'o12', context), 
          characterBlock('Vinzsmoke Sanji', Color.fromARGB(255, 251, 255, 0), 'o13', context), 
          characterBlock('Kaido', Color.fromARGB(236, 11, 0, 109), 'o14', context), 
          characterBlock('Nami', Color.fromARGB(255, 255, 153, 0), 'o15', context), 
        ],
      ),
    );
  }

  Widget characterBlock(String name, Color color, String image, BuildContext contextParam){
    String colorString = color.toString();
    String valueString = colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    
    return GestureDetector(
      onTap: ()=>{
        Navigator.of(contextParam).push(MaterialPageRoute(
          builder: (context) => DetailPageWidget(color: value, image: "assets/$image.png", name: name,)))
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(66, 61, 59, 59),
          borderRadius: BorderRadius.circular(15)
        ),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: color,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset("assets/$image.png"),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white
                  ),
                )
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_rounded, color: Colors.grey,))
      
          ],
        ),
      ),
    );
  }

  Widget fontBlock(String image, String title, String subtitle){
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset('assets/$image',
          width:screenWidth*0.313, height: 110,
          fit: BoxFit.cover,
          ),          
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(text: TextSpan(
          text: title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14
          ),
          children: [ TextSpan(
            text: subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w300
              )
            )
          ]
        ))
      ],
    );
  }

}