import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AddFarm extends StatefulWidget {
  const AddFarm({super.key});

  @override
  State<AddFarm> createState() => _AddFarmState();
}

class _AddFarmState extends State<AddFarm> {
  final TextEditingController _farmNameController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _plotSizeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  String? _selectedDistrict;
  String? _selectedChiefdom;
  String? _selectedPlotType;
  String? _unit = 'Acres';

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print('Location service enabled: $serviceEnabled');
    if (!serviceEnabled) {
      // If location services are not enabled, show an alert or prompt to enable them
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location services are disabled. Please enable them.')),
      );
      return;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    print('Location permission: $permission');
    if (permission == LocationPermission.denied) {
      // Request permission if it's denied
      permission = await Geolocator.requestPermission();
      print('Requested permission, result: $permission');
      if (permission == LocationPermission.denied) {
        // If permission is denied, show an alert
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location permissions are denied.')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // If permission is permanently denied, show an alert
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location permissions are permanently denied.')),
      );
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print('Position: Latitude: ${position.latitude}, Longitude: ${position.longitude}');

    // Update the latitude and longitude in the text fields
    setState(() {
      _latitudeController.text = position.latitude.toString();
      _longitudeController.text = position.longitude.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Farm"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Farm',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Farm Name Input
            TextField(
              controller: _farmNameController,
              decoration: const InputDecoration(
                labelText: 'Farm Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            
            // District Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'District',
                border: OutlineInputBorder(),
              ),
              value: _selectedDistrict,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDistrict = newValue;
                });
              },
              items: ['District 1', 'District 2', 'District 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            
            // Chiefdom Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Chiefdom',
                border: OutlineInputBorder(),
              ),
              value: _selectedChiefdom,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedChiefdom = newValue;
                });
              },
              items: ['Chiefdom 1', 'Chiefdom 2', 'Chiefdom 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            
            // Latitude Input
            TextField(
              controller: _latitudeController,
              decoration: const InputDecoration(
                labelText: 'GPS Coordinate (Latitude)',
                border: OutlineInputBorder(),
              ),
              readOnly: true, // Prevent manual edits to the field
            ),
            const SizedBox(height: 20),
            
            // Longitude Input
            TextField(
              controller: _longitudeController,
              decoration: const InputDecoration(
                labelText: 'GPS Coordinate (Longitude)',
                border: OutlineInputBorder(),
              ),
              readOnly: true, // Prevent manual edits to the field
            ),
            const SizedBox(height: 10),
            
            // Use Location Tracking Button
            GestureDetector(
              onTap: _getCurrentLocation,
              child: Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.teal),
                  SizedBox(width: 8),
                  Text(
                    'Use Location Tracking',
                    style: TextStyle(color: Colors.teal),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Plot Type Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Plot Type',
                border: OutlineInputBorder(),
              ),
              value: _selectedPlotType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPlotType = newValue;
                });
              },
              items: ['Crop', 'Livestock', 'Mixed']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            
            // Unit of Measurement
            const Text('Unit of measurement'),
            Row(
              children: [
                Radio<String>(
                  value: 'Acres',
                  groupValue: _unit,
                  onChanged: (String? value) {
                    setState(() {
                      _unit = value;
                    });
                  },
                ),
                const Text('Acres'),
                Radio<String>(
                  value: 'Hectares',
                  groupValue: _unit,
                  onChanged: (String? value) {
                    setState(() {
                      _unit = value;
                    });
                  },
                ),
                const Text('Hectares'),
              ],
            ),
            const SizedBox(height: 20),
            
            // Plot Size Input
            TextField(
              controller: _plotSizeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Plot Size',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            
            // Short Notes Input
            TextField(
              controller: _notesController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Short Notes',
                border: OutlineInputBorder(),
                hintText: 'Write Short Notes about this Farm',
              ),
            ),
            const SizedBox(height: 20),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle save action
                },
                child: const Text('Save Farm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AddFarm(),
  ));
}
