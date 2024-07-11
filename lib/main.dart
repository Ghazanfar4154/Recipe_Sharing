import 'package:flutter/material.dart';
import 'package:recipe_sharing/Details_Page.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class CategoryItem {
  final String name;
  final IconData icon;

  CategoryItem(this.name, this.icon);
}

class Recipe {
  final String imageUrl;
  final int likes;
  final String title;
  final String chef;
  final String category;
  final String duration;

  Recipe({
    required this.imageUrl,
    required this.likes,
    required this.title,
    required this.chef,
    required this.category,
    required this.duration,
  });
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  final List<CategoryItem> categories = [
    CategoryItem('Breakfast', Icons.free_breakfast),
    CategoryItem('Lunch', Icons.fastfood),
    CategoryItem('Dinner', Icons.restaurant),
    CategoryItem('Dessert', Icons.cake),
    CategoryItem('Appetizers', Icons.local_dining),
    CategoryItem('Salads', Icons.local_florist),
    CategoryItem('Soups', Icons.soup_kitchen),
    CategoryItem('Snacks', Icons.fastfood),
    // Add more categories as needed
  ];

  final List<Recipe> recipes = [
    Recipe(
      imageUrl: "assets/images/reciepe1.png",
      likes: 390,
      title: "Salad with Tomatoes and Cucumbers",
      chef: "Instashops",
      category: "Breakfast",
      duration: "10 minutes",
    ),
    Recipe(
      imageUrl: "assets/images/reciepe1.png",
      likes: 390,
      title: "Salad with Tomatoes and Cucumbers",
      chef: "Instashops",
      category: "Breakfast",
      duration: "10 minutes",
    ),
    Recipe(
      imageUrl: "assets/images/reciepe1.png",
      likes: 390,
      title: "Salad with Tomatoes and Cucumbers",
      chef: "Instashops",
      category: "Breakfast",
      duration: "10 minutes",
    ),
    // Add more recipes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delicious Recipes"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.account_circle),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80, // Set a fixed height for the category list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Icon(categories[index].icon),
                        Text(categories[index].name),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10), // Add some spacing between the category list and the recipe grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // Disable scrolling of the grid view
              itemCount: recipes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return RecipeCard(recipe: recipes[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

}

class RecipeCard extends StatelessWidget {

  final Recipe recipe;

  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context){
                  return DetailPage(recipe: recipe,);
                }));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        recipe.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.yellow,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(recipe.likes.toString()),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border_rounded),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            recipe.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "by ${recipe.chef}",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                child: Text(
                  recipe.category,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellow,
                ),
                padding: EdgeInsets.all(5),
              ),
              SizedBox(width: 10),
              Container(
                child: Text(
                  recipe.duration,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.yellow,
                ),
                padding: EdgeInsets.all(5),
              ),
            ],
          )
        ],
      ),
    );
  }

}