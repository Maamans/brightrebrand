import 'package:flutter/material.dart';

class CentralizedHub extends StatefulWidget {
  const CentralizedHub({super.key});

  @override
  State<CentralizedHub> createState() => _CentralizedHubState();
}

class _CentralizedHubState extends State<CentralizedHub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agriculture Hub'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Find agriculture opportunities',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Browse by categories section
            const Text(
              'Browse by categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),
              children: [
                _categoryTile('Farming', Icons.agriculture),
                _categoryTile('AgriTech', Icons.computer),
                _categoryTile('Agro-Finance', Icons.monetization_on),
                _categoryTile('Livestock', Icons.pets),
                _categoryTile('Crop Management', Icons.grass),
                _categoryTile('See more', Icons.more_horiz),
              ],
            ),
            const SizedBox(height: 20),

            // Recent Agriculture Opportunities section
            const Text(
              'Recent Agriculture Opportunities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Filter buttons (All, Grants, Seeds, Fertilizers)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _filterButton('All'),
                _filterButton('Grants'),
                _filterButton('Seeds'),
                _filterButton('Fertilizers'),
                _filterButton('Equipment'),
              ],
            ),
            const SizedBox(height: 10),

            // List of recent opportunities
            Expanded(
              child: ListView(
                children: [
                  _opportunityTile(
                    'Seed Grants for Small Farms',
                    'National Agriculture Org.',
                    'Available nationwide',
                    'USD 5,000',
                    'Grant',
                    Icons.local_florist,
                  ),
                  _opportunityTile(
                    'Organic Fertilizers Subsidy',
                    'GreenGrow Initiative',
                    'Kenya',
                    '50% Subsidy',
                    'Subsidy',
                    Icons.eco,
                  ),
                  _opportunityTile(
                    'AgriTools Equipment Rental',
                    'Farming Resources Co.',
                    'Remote',
                    'Affordable rates',
                    'Equipment Rental',
                    Icons.build,
                  ),
                  const SizedBox(height: 20),

                  // New Cards for FAO, MAFFS, and WFP Opportunities
                  _opportunityWithImageTile(
                    'FAO Livelihoods Assistance',
                    'Food and Agriculture Organization',
                    'Global',
                    'Access to tools and resources',
                    'Assistance Program',
                    'images/fao.png',
                  ),
                  _opportunityWithImageTile(
                    'MAFFS Seed Distribution Program',
                    'Ministry of Agriculture, Forestry, and Food Security',
                    'Sierra Leone',
                    'Free seeds for farmers',
                    'Distribution Program',
                    'images/moa.jpg',
                  ),
                  _opportunityWithImageTile(
                    'WFP Food Assistance',
                    'World Food Programme',
                    'Remote',
                    'Food security support',
                    'Aid Program',
                    'images/wfp.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.work_outline), label: 'Opportunities'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  // Widget for category tile
  Widget _categoryTile(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Navigate to category details (not implemented)
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.green),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // Widget for filter button
  Widget _filterButton(String label) {
    return ElevatedButton(
      onPressed: () {
        // Implement filter functionality
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: Text(label),
    );
  }

  // Widget for opportunity tile
  Widget _opportunityTile(String title, String organization, String location,
      String amount, String type, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.green),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(organization),
            Text(location),
            Text(amount),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        onTap: () {
          // Navigate to opportunity details (not implemented)
        },
      ),
    );
  }

  // Widget for opportunity tile with organization image
  Widget _opportunityWithImageTile(String title, String organization, String location,
      String amount, String type, String imagePath) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(organization),
            Text(location),
            Text(amount),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        onTap: () {
          // Navigate to opportunity details (not implemented)
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CentralizedHub(),
    debugShowCheckedModeBanner: false,
  ));
}
