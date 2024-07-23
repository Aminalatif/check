// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:food/Models/recipe_model.dart';
//  import 'package:food/views/recipe_view.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   // List<RecipeModel> recipes =  new List <RecipeModel>();
//   List<RecipeModel> recipes = [];
//
//   TextEditingController textEditingController = new TextEditingController();
//   // String applicationId = "d5aea606";
//   // String applicationKey = "eac2e1fa8fb14d54eeabfbde86e2099d";
//   getRecipes(String query) async {
//     String url =
//         "https://api.edamam.com/search?q=$query&app_id=d5aea606&app_key=eac2e1fa8fb14d54eeabfbde86e2099d";
//
//     var uri = Uri.parse(url);
//     var response = await http.get(uri);
//     print("this is response");
//     Map<String,dynamic> jsonData =jsonDecode(response.body);
//      jsonData["hits"].forEach((element){
//        // print(element.toString());
//
//        RecipeModel recipeModel= new RecipeModel(url: 'url', label: 'label', image: 'image', source: 'source');
//        recipeModel= RecipeModel.fromMap(element["recipes"]);
//        recipes.add(recipeModel);
//      });
//      print("woahae");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//               const Color(0xff213A50),
//               const Color(0xff071934),
//             ])),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 35, horizontal: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       "Foodie Moodie",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Text(
//                       "Recipes",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.blue,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   "What will you cook today?",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Text(
//                   "Just enter ingredients you have and we will show the best recipe for you",
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(
//                         child: TextField(
//                           controller: textEditingController,
//                           decoration: InputDecoration(
//                               hintText: "Enter Ingredient",
//                               hintStyle: TextStyle(
//                                 color: Colors.white.withOpacity(0.5),
//                                 fontSize: 17,
//                               )),
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 17,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           if (textEditingController.text.isNotEmpty) {
//                             getRecipes(textEditingController.text);
//                             print("just do it");
//                           } else {}
//                         },
//                         child: Container(
//                           child: Icon(
//                             Icons.search,
//                             color: Colors.white,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,),
//                 Container(
//                   child: GridView(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 200, mainAxisSpacing: 10.0
//                   ),
//                     children: List.generate(recipes.length, (index) {
//                       return GridTile(
//                         child: RecipeTile(
//                           title: recipes[index].label,
//                           desc: recipes[index].source,
//                           imgUrl: recipes[index].image,
//                           url: recipes[index].url,
//                         ),
//                       );
//                     }),
//
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class RecipeTile extends StatefulWidget {
//   final String url, desc, title, imgUrl;
//
//   RecipeTile({
//     required this.url,
//     required this.title,
//     required this.imgUrl,
//     required this.desc,
//   });
//
//   @override
//   _RecipeTileState createState() => _RecipeTileState();
// }
//
// class _RecipeTileState extends State<RecipeTile> {
//    Future<void> _launchURL(String url) async {
//     print(url);
//     Uri uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//      return Wrap(
//        children:<Widget> [
//          GestureDetector(
//       onTap: () {
//         print("${widget.url} This is what we are going to see");
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => RecipeView(
//               postUrl: widget.url,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.all(8),
//         child: Stack(
//           children: <Widget>[
//             Image.network(
//               widget.imgUrl,
//               height: 200,
//               width: 200,
//               fit: BoxFit.cover,
//             ),
//             Container(
//               width: 200,
//               alignment: Alignment.bottomLeft,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.white30, Colors.white],
//                   begin: FractionalOffset.centerRight,
//                   end: FractionalOffset.centerLeft,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       widget.title,
//                       style: TextStyle(
//                         fontSize: 13,
//                         color: Colors.black54,
//                         fontFamily: 'OverpassRegular',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//        ],
//     );
//   }
// }
//
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food/Models/recipe_model.dart';
import 'package:food/views/recipe_view.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<RecipeModel> recipes = [];
  TextEditingController textEditingController = TextEditingController();

  getRecipes(String query) async {
    String url =
        "https://api.edamam.com/search?q=$query&app_id=d5aea606&app_key=eac2e1fa8fb14d54eeabfbde86e2099d";
    var uri = Uri.parse(url);
    var response = await http.get(uri);

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<RecipeModel> newRecipes = [];
    jsonData["hits"].forEach((element) {
      RecipeModel recipeModel = RecipeModel.fromMap(element["recipe"]);
      newRecipes.add(recipeModel);
    });

    setState(() {
      recipes = newRecipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xff213A50), const Color(0xff071934)],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 35, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Foodie Moodie",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Recipes",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  "What will you cook today?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Just enter ingredients you have and we will show the best recipe for you",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                            hintText: "Enter Ingredient",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 17,
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(width: 17),
                      InkWell(
                        onTap: () {
                          if (textEditingController.text.isNotEmpty) {
                            getRecipes(textEditingController.text);
                          }
                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: GridView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 39.0,
                    ),
                    children: List.generate(recipes.length, (index) {
                      return GridTile(
                        child: RecipeTile(
                          title: recipes[index].label,
                          desc: recipes[index].source,
                          imgUrl: recipes[index].image,
                          url: recipes[index].url,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeTile extends StatefulWidget {
  final String url, desc, title, imgUrl;

  RecipeTile({
    required this.url,
    required this.title,
    required this.imgUrl,
    required this.desc,
  });

  @override
  _RecipeTileState createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {
  Future<void> _launchURL(String url) async {
    print(url);
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            print("${widget.url} This is what we are going to see");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeView(
                  postUrl: widget.url,
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                Image.network(
                  widget.imgUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 200,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white30, Colors.white],
                      begin: FractionalOffset.centerRight,
                      end: FractionalOffset.centerLeft,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
