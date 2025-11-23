import 'package:flutter/material.dart';
import 'resultScreen.dart'; // Import result screen for navigation

/// InformationScreen is a StatefulWidget because it has data that changes
/// StatefulWidget has a State object that can rebuild when data changes
class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

/// State class holds the mutable data for InformationScreen
/// The underscore (_) makes this class private to this file
class _InformationScreenState extends State<InformationScreen> {
  // State variables - these hold the user's input data
  String selectedGender = 'Male'; // Currently selected gender
  bool isFeet = true; // Toggle between feet and meters for height
  double heightInMeters = 1.80; // Height value in meters
  int weight = 75; // Weight in kilograms
  int age = 24; // Age in years
  
  /// Function to calculate BMI from weight and height
  /// BMI = weight (kg) / (height (m))²
  double calculateBMI() {
    return weight / (heightInMeters * heightInMeters);
  }
  
  /// Function to convert meters to feet for display
  String getHeightInFeet() {
    double feet = heightInMeters * 3.28084;
    return feet.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background
      
      // AppBar is the top bar with title and back button
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Removes shadow under app bar
        // Leading is the left-side widget (back button)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2C3E50)),
          // Pop removes current screen and goes back
          onPressed: () => Navigator.pop(context),
        ),
        // Title in the center
        title: const Text(
          'My Information',
          style: TextStyle(
            color: Color(0xFF2C3E50),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      
      // Body with scrollable content
      body: SingleChildScrollView(
        // SingleChildScrollView makes content scrollable if it overflows
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to start (left)
            children: [
              const SizedBox(height: 10),
              
              // GENDER SELECTION SECTION
              const Text(
                'Birth Gender',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 12),
              
              // Row of two gender buttons
              Row(
                children: [
                  // Male button - takes half the width
                  Expanded(
                    child: GestureDetector(
                      // GestureDetector detects taps and other gestures
                      onTap: () {
                        // setState tells Flutter to rebuild the widget with new data
                        setState(() {
                          selectedGender = 'Male';
                        });
                      },
                      // Container for styling the button
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          // Change color based on selection
                          color: selectedGender == 'Male' 
                              ? const Color(0xFF4A90E2) 
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          // Optional border when not selected
                          border: Border.all(
                            color: selectedGender == 'Male'
                                ? const Color(0xFF4A90E2)
                                : Colors.grey[300]!,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              color: selectedGender == 'Male' 
                                  ? Colors.white 
                                  : Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Male',
                              style: TextStyle(
                                color: selectedGender == 'Male' 
                                    ? Colors.white 
                                    : Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 12), // Space between buttons
                  
                  // Female button - same structure as Male button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'Female';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: selectedGender == 'Female' 
                              ? const Color(0xFFFF69B4) 
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: selectedGender == 'Female'
                                ? const Color(0xFFFF69B4)
                                : Colors.grey[300]!,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              color: selectedGender == 'Female' 
                                  ? Colors.white 
                                  : Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Female',
                              style: TextStyle(
                                color: selectedGender == 'Female' 
                                    ? Colors.white 
                                    : Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // HEIGHT SECTION
              const Text(
                'Height',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 12),
              
              // White card containing height controls
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Toggle between Feet and Meters
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Feet toggle button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFeet = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isFeet 
                                  ? const Color(0xFFE8F4FD) 
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Feet',
                              style: TextStyle(
                                color: isFeet 
                                    ? const Color(0xFF4A90E2) 
                                    : Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: 12),
                        
                        // Meters toggle button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFeet = false;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: !isFeet 
                                  ? const Color(0xFFE8F4FD) 
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Meters',
                              style: TextStyle(
                                color: !isFeet 
                                    ? const Color(0xFF4A90E2) 
                                    : Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Display current height value
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Min value
                        Text(
                          isFeet ? '5.87' : '1.79',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        ),
                        
                        const SizedBox(width: 20),
                        
                        // Current value - large and prominent
                        Text(
                          isFeet 
                              ? getHeightInFeet() 
                              : heightInMeters.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4A90E2),
                          ),
                        ),
                        
                        const SizedBox(width: 20),
                        
                        // Max value
                        Text(
                          isFeet ? '5.94' : '1.81',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // Slider for height adjustment
                    // Slider is a widget that lets users select a value by dragging
                    Slider(
                      value: heightInMeters,
                      min: 1.0, // Minimum height in meters
                      max: 2.5, // Maximum height in meters
                      divisions: 150, // Number of discrete intervals
                      activeColor: const Color(0xFF4A90E2),
                      inactiveColor: Colors.grey[300],
                      // onChanged is called when slider value changes
                      onChanged: (value) {
                        setState(() {
                          heightInMeters = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              // WEIGHT AND AGE SECTION - displayed side by side
              Row(
                children: [
                  // Weight container - takes half width
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Weight (kg)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF7F8C8D),
                            ),
                          ),
                          const SizedBox(height: 10),
                          
                          // Display current weight
                          Text(
                            '$weight',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                          const SizedBox(height: 10),
                          
                          // Plus and minus buttons to adjust weight
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Minus button
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 1) weight--;
                                  });
                                },
                                icon: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F4FD),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Color(0xFF4A90E2),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Plus button
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F4FD),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Color(0xFF4A90E2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Age container - same structure as weight
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF7F8C8D),
                            ),
                          ),
                          const SizedBox(height: 10),
                          
                          Text(
                            '$age',
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                          const SizedBox(height: 10),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Minus button
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (age > 1) age--;
                                  });
                                },
                                icon: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F4FD),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Color(0xFF4A90E2),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Plus button
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F4FD),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Color(0xFF4A90E2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // CALCULATE BUTTON - navigates to results screen
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Calculate BMI
                    double bmi = calculateBMI();
                    
                    // Navigate to result screen and pass the calculated data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          bmi: bmi,
                          weight: weight,
                          height: heightInMeters,
                          age: age,
                          gender: selectedGender,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A90E2),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
