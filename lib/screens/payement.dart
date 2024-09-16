import 'package:brightmain/screens/tracking_one.dart';
import 'package:flutter/material.dart';

class PayCard extends StatefulWidget {
  const PayCard({super.key});

  @override
  State<PayCard> createState() => _PayCardState();
}

class _PayCardState extends State<PayCard> {
  bool saveCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Step indicators (Delivery, Payment, Track Order)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(height: 4),
                      Text('Delivery', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(height: 4),
                      Text('Payment', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.circle_outlined, color: Colors.grey),
                      SizedBox(height: 4),
                      Text('Track Order', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
        
              // Payment options (Cash on Delivery, Credit Card, Mobile)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.local_shipping, size: 40),
                      SizedBox(height: 8),
                      Text('Cash On Delivery', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.credit_card, size: 40),
                      SizedBox(height: 8),
                      Text('Credit Card', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.phone_android, size: 40),
                      SizedBox(height: 8),
                      Text('Mobile', style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
        
              // Card image section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Master Card',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '**** **** **** 1234',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'CARD HOLDER',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'VALID THRU',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bob Kamara',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '06/25',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
        
              // Cardholder Name
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Card Holder Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
        
              // Card Number
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
        
              // Expiry Date and CVV
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Month/Year',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
        
              // Save Card Checkbox
              Row(
                children: [
                  Checkbox(
                    value: saveCard,
                    onChanged: (value) {
                      setState(() {
                        saveCard = value!;
                      });
                    },
                  ),
                  Text('Save this card'),
                ],
              ),
              SizedBox(height: 32),
        
              // Make Payment Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TrackingOne()),
      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'MAKE PAYMENT',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
