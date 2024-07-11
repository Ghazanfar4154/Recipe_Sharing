import 'package:flutter/material.dart';
import 'main.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            _buildRecipeInfo(),
            _buildTabBar(),
            _buildTabBarView(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(recipe.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 10,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        Positioned(
          top: 35,
          left: 70,
          child: Text(
            recipe.title.toString().split(' ').first,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Row(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              SizedBox(width: 4),
              Text(
                '${recipe.likes}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        Positioned(
          top: 30,
          right: 10,
          child: PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: ListTile(
                  title: Text('Save Excel'),
                  onTap: () {
                    // Add functionality here
                  },
                ),
              ),
            ],
            icon: Icon(Icons.more_vert),
          ),
        ),
      ],
    );
  }

  Widget _buildRecipeInfo() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipe.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          _buildRowWithIconAndText(
            Icons.person,
            recipe.chef,
            Icons.access_time,
            recipe.duration,
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildRowWithIconAndText(
      IconData icon1,
      String text1,
      IconData? icon2,
      String? text2,
      ) {
    return Row(
      children: [
        Icon(icon1),
        SizedBox(width: 4),
        Text(text1),
        if (icon2 != null && text2 != null) ...[
          SizedBox(width: 16),
          Icon(icon2),
          SizedBox(width: 4),
          Text(text2),
        ],
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      tabs: [
        Tab(text: "Details"),
        Tab(text: "Cooking"),
        Tab(text: "Reviews"),
      ],
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          _buildDetailsTab(),
          _buildCookingTab(),
          _buildReviewsTab(),
        ],
      ),
    );
  }

  Widget _buildDetailsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ingredients:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '''
            Here 
            are 
            Ingredients
            ''',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
          Text(
            "Instructions:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '''
            Here
            Are 
            Instruction
            ''',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildCookingTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cooking Instructions:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "1. Preheat oven to 475°F (245°C).\n"
                "2. Roll out dough on lightly floured surface until it is the desired size and thickness.\n"
                "3. Transfer dough to pizza stone or baking sheet.\n"
                "4. Spread sauce evenly over dough.\n"
                "5. Sprinkle cheese and toppings over sauce.\n"
                "6. Bake in preheated oven for 12-15 minutes or until crust is golden brown and cheese is melted and bubbly.\n"
                "7. Remove from oven and let cool slightly before slicing and serving.",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsTab() {
    return Center(
      child: Text("Reviews"),
    );
  }
}
