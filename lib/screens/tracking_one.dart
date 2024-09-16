import 'package:flutter/material.dart';

class TrackingOne extends StatefulWidget {
  const TrackingOne({super.key});

  @override
  State<TrackingOne> createState() => _TrackingOneState();
}

class _TrackingOneState extends State<TrackingOne> {
  // Sample data
  final List<Map<String, String>> steps = [
    {
      'title': 'Order Placed',
      'date': 'October 21, 2023',
      'status': 'Completed',
    },
    {
      'title': 'Order Confirmed',
      'date': 'October 22, 2023',
      'status': 'Completed',
    },
    {
      'title': 'Out for Delivery',
      'date': 'Pending',
      'status': 'Pending',
    },
    {
      'title': 'Order Delivered',
      'date': 'Pending',
      'status': 'Pending',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Order"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Full-width layout with padding
        child: ListView.builder(
          itemCount: steps.length,
          itemBuilder: (context, index) {
            final step = steps[index];
            return GestureDetector(
              onTap: () {
                // Navigate to a new screen depending on the step clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StepDetailsScreen(
                      stepTitle: step['title']!,
                      status: step['status']!,
                    ),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 10), // Spacing between each card
                elevation: 4, // Adds shadow for depth
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),  // Padding inside the card
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: step['status'] == 'Completed'
                            ? Colors.green
                            : Colors.grey,
                        size: 30,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            step['title']!,
                            style: TextStyle(
                              fontSize: 18,
                              color: step['status'] == 'Completed'
                                  ? Colors.green
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            step['date']!,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// This is a placeholder for the detailed screen that the navigation leads to.
class StepDetailsScreen extends StatelessWidget {
  final String stepTitle;
  final String status;

  const StepDetailsScreen({
    Key? key,
    required this.stepTitle,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stepTitle),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Status: $status',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Details about $stepTitle',
              style: const TextStyle(fontSize: 16),
            ),
            // Add more content or data related to this step if necessary
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: TrackingOne(),
  ));
}
