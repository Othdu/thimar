import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(ThimarApp());
}

class ThimarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff527643),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Color(0xff527643),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    SmartFarmingScreen(),
    Center(child: Text('Store Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Feedback Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/image/thimar.jpg',
              height: 45,
              width: 45,
            ),
            SizedBox(width: 8),
            Text(
              'THIMAR',
              style: TextStyle(color: Color(0xff527643)),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.green,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
        BottomNavigationBarItem(icon: Icon(Icons.feedback), label: 'Feedback'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}

class SmartFarmingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Container(
            color: Colors.white,
            child: SizedBox(
              height: 105,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  final labels = [
                    'Plant Disease Detection',
                    'Weather Forecast',
                    'Crop Recommendation',
                    'Plant Monitoring'
                  ];
                  final images = [
                    'assets/image/disease.jpg',
                    'assets/image/weather.jpg',
                    'assets/image/crop_recommend.jpg',
                    'assets/image/plant_monitoring.jpg'
                  ];
                  return _buildQuickAccessCard(
                      images[index], labels[index], Color(0xfff3e9e1), context);
                },
                separatorBuilder: (context, index) => SizedBox(width: 8),
              ),
            ),
          ),
          SizedBox(height: 25),
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Opacity(
                      opacity: .7,
                      child: Image.asset(
                        'assets/image/weather3.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Mansoura',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Sunday 17th Jan 2024',
                        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '23°',
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Smart Farming Solutions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 22,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildOptionCard('assets/image/crop_recommend.jpg',
                  'Crop Recommendation', context),
              _buildOptionCard('assets/image/disease.jpg',
                  'Plant Disease Detection', context),
              _buildOptionCard('assets/image/plant_monitoring.jpg',
                  'Plant Monitoring', context),
              _buildOptionCard(
                  'assets/image/weather.jpg', 'Weather Forecast', context),
              _buildOptionCard(
                  'assets/image/soil_analysis.jpg', 'Soil Analysis', context),
              _buildOptionCard('assets/image/Fertilizer.png',
                  'Fertilizer Recommendation', context),
              _buildOptionCard('assets/image/plant_identifier.jpg',
                  'Plant Identifier', context),
              _buildOptionCard(
                  'assets/image/plant_doctor.jpg', 'Plant Doctor', context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessCard(
      String imagePath, String label, Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Widget page;
        switch (label) {
          case 'Plant Disease Detection':
            page = PlantDiseaseDetectionPage();
            break;
          case 'Weather Forecast':
            page = WeatherForecastPage();
            break;
          case 'Crop Recommendation':
            page = CropRecommendationPage();
            break;
          case 'Plant Monitoring':
            page = PlantMonitoringPage();
            break;
          default:
            page = Center(child: Text('Unknown Page'));
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 100,
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 50, width: 50),
            SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(
      String imagePath, String label, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Widget page;
        switch (label) {
          case 'Crop Recommendation':
            page = CropRecommendationPage();
            break;
          case 'Plant Disease Detection':
            page = PlantDiseaseDetectionPage();
            break;
          case 'Plant Monitoring':
            page = PlantMonitoringPage();
            break;
          case 'Weather Forecast':
            page = WeatherForecastPage();
            break;
          case 'Soil Analysis':
            page = SoilAnalysisPage();
            break;
          case 'Fertilizer Recommendation':
            page = FertilizerRecommendationPage();
            break;
          case 'Plant Identifier':
            page = PlantIdentifierPage();
            break;
          case 'Plant Doctor':
            page = PlantDoctorPage();
            break;
          default:
            page = Center(child: Text('Unknown Page'));
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 233, 225),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 60, width: 60),
            SizedBox(height: 10),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class CropRecommendationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Crop Recommendations',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              Text(
                'Sprout Your Success 🌱',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4b8b52),
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                      color: Colors.black26,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100),
              Text(
                "Ready to Grow?              Pick How You'll Begin!",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManualEntryScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff4B8B52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 59, vertical: 15),
                  elevation: 5,
                ),
                child: Text(
                  'Manual Entry',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'or',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UploadSoilImageScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff4B8B52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  elevation: 5,
                ),
                child: Text(
                  'Upload Soil Image',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 70),
              Text(
                "Not sure? Upload a photo, and we’ll take care of the rest, "
                "or manually enter soil details if you’re feeling fancy!",
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ManualEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Crop Recommendations',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Image.asset(
              'assets/image/facts.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 10),
            Text(
              'Field Facts',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4B8B52)),
            ),
            SizedBox(height: 10),
            InputField(
              label: 'Nitrogen:',
              placeholder: '25.3',
            ),
            InputField(
              label: 'Potassium:',
              placeholder: '39.777',
            ),
            InputField(
              label: 'Phosphorus:',
              placeholder: '2.67812',
            ),
            InputField(
              label: 'PH:',
              placeholder: '8.9',
            ),
            InputField(
              label: 'Humidity:',
              placeholder: '2.67812',
            ),
            InputField(
              label: 'Temperature:',
              placeholder: '39.777',
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement recommendation functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff527643),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    elevation: 0,
                  ),
                  child: Text(
                    'Recommend',
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isNumeric;

  const InputField({
    Key? key,
    required this.label,
    required this.placeholder,
    this.isNumeric = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 19,
            color: Color(0xff124217),
          ),
        ),
        SizedBox(height: 8),
        TextField(
          keyboardType: isNumeric
              ? TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          inputFormatters: isNumeric
              ? [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ]
              : [],
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.4),
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 230, 230, 230),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 159, 160, 159),
                width: 1.5,
              ),
            ),
          ),
        ),
        SizedBox(height: 7),
      ],
    );
  }
}

class UploadSoilImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'crop recommendations',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 110),
              Text(
                "Know Your Soil, Grow Your Soul",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 80),
              Container(
                width: 190,
                height: 191,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  'assets/image/image_loader.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  // Implement image upload functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff527643),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: Text(
                  'Select Soil Image',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FertilizerRecommendationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Fertilizer Recommendation',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Image.asset(
              'assets/image/farmer.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 10),
            InputField(
              label: 'Nitrogen:',
              placeholder: '25.3',
              isNumeric: true,
            ),
            InputField(
              label: 'Potassium:',
              placeholder: '39.777',
              isNumeric: true,
            ),
            InputField(
              label: 'Phosphorus:',
              placeholder: '2.67812',
              isNumeric: true,
            ),
            InputField(
              label: 'Crop Type:',
              placeholder: '',
              isNumeric: false,
            ),
            InputField(
              label: 'Soil Type:',
              placeholder: '',
              isNumeric: false,
            ),
            SizedBox(height: 30),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement recommendation functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff4B8B52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(42),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    elevation: 0,
                  ),
                  child: Text(
                    'Begin Healing',
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputField1 extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isNumeric;

  const InputField1({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.isNumeric,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 19,
            color: Color(0xff124217),
          ),
        ),
        SizedBox(height: 8),
        TextField(
          keyboardType: isNumeric
              ? TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          inputFormatters: isNumeric
              ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))]
              : [],
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.4),
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 230, 230, 230),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 159, 160, 159),
                width: 1.5,
              ),
            ),
          ),
        ),
        SizedBox(height: 7),
      ],
    );
  }
}

class PlantDiseaseDetectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plant Disease Detection')),
      body: Center(child: Text('Plant Disease Detection Page')),
    );
  }
}

class PlantMonitoringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plant Monitoring')),
      body: Center(child: Text('Plant Monitoring Page')),
    );
  }
}

class WeatherForecastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Forecast')),
      body: Center(child: Text('Weather Forecast Page')),
    );
  }
}

class SoilAnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Soil Analysis')),
      body: Center(child: Text('Soil Analysis Page')),
    );
  }
}

class PlantIdentifierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plant Identifier')),
      body: Center(child: Text('Plant Identifier Page')),
    );
  }
}

class PlantDoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plant Doctor')),
      body: Center(child: Text('Plant Doctor Page')),
    );
  }
}
