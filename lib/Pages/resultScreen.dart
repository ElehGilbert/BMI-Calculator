import 'package:flutter/material.dart';

/// ResultScreen is a StatelessWidget that displays the BMI calculation results
/// It receives data from the previous screen through constructor parameters
class ResultScreen extends StatelessWidget {
  // Final variables - these values won't change after being set
  final double bmi; // The calculated BMI value
  final int weight; // User's weight in kg
  final double height; // User's height in meters
  final int age; // User's age
  final String gender; // User's gender
  
  // Constructor - receives all the data when the screen is created
  const ResultScreen({
    super.key,
    required this.bmi, // required means this parameter must be provided
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  });
  
  /// Function to get BMI category based on BMI value
  /// Returns a string like "Underweight", "Normal", etc.
  String getBMICategory() {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
  
  /// Function to get color based on BMI category
  /// Different colors help visualize health status
  Color getBMIColor() {
    if (bmi < 18.5) {
      return Colors.blue; // Underweight - blue
    } else if (bmi >= 18.5 && bmi < 25) {
      return Colors.green; // Normal - green
    } else if (bmi >= 25 && bmi < 30) {
      return Colors.orange; // Overweight - orange
    } else {
      return Colors.red; // Obese - red
    }
  }
  
  /// Function to get health recommendation message
  String getRecommendation() {
    String category = getBMICategory();
    
    if (category == 'Underweight') {
      return 'Your BMI is $category. Consider consulting with a healthcare provider about healthy weight gain strategies.';
    } else if (category == 'Normal') {
      return 'Your BMI is ${bmi.toStringAsFixed(1)}, indicating your weight is in the Normal category for adults of your height.';
    } else if (category == 'Overweight') {
      return 'Your BMI is $category. Maintaining a healthy weight through diet and exercise may reduce health risks.';
    } else {
      return 'Your BMI is $category. Consider consulting with a healthcare provider about healthy weight management.';
    }
  }
  
  /// Calculate healthy weight range for the user's height
  /// Normal BMI range is 18.5 - 24.9
  String getHealthyWeightRange() {
    double minWeight = 18.5 * height * height;
    double maxWeight = 24.9 * height * height;
    return '${minWeight.toStringAsFixed(1)} to ${maxWeight.toStringAsFixed(1)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      
      // AppBar with back button and title
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2C3E50)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Results',
          style: TextStyle(
            color: Color(0xFF2C3E50),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              
              // MAIN RESULTS CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Decorative icon
                    const Icon(
                      Icons.monitor_weight_outlined,
                      size: 60,
                      color: Color(0xFF4A90E2),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // "Your current BMI" label
                    const Text(
                      'Your current BMI',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7F8C8D),
                      ),
                    ),
                    
                    const SizedBox(height: 10),
                    
                    // BMI VALUE - large and prominent
                    Text(
                      bmi.toStringAsFixed(1), // Show BMI with 1 decimal place
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: getBMIColor(), // Color based on category
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // BMI CATEGORY INDICATOR
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: getBMIColor().withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: getBMIColor(),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        getBMICategory(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: getBMIColor(),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Healthy weight range display
                    Text(
                      '${getHealthyWeightRange()} kg',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF27AE60),
                      ),
                    ),
                    const Text(
                      'Normal weight range',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF7F8C8D),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // BMI SCALE VISUALIZATION
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'BMI Scale',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Visual representation of BMI scale
                    // Stack allows overlaying widgets on top of each other
                    // LayoutBuilder gets the available width for accurate positioning
                    Column(
                      children: [
                        // Arrow pointer above the scale
                        LayoutBuilder(
                          builder: (context, constraints) {
                            // Calculate BMI position as a percentage (0.0 to 1.0)
                            // BMI scale from 0 to 40 for visual representation
                            final bmiPosition = (bmi / 40).clamp(0.0, 1.0);
                            final scaleWidth = constraints.maxWidth;
                            
                            // Calculate left position for the arrow
                            final arrowWidth = 40.0;
                            final leftPosition = (bmiPosition * scaleWidth - (arrowWidth / 2)).clamp(0.0, scaleWidth - arrowWidth);
                            
                            return SizedBox(
                              height: 40,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: leftPosition,
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: getBMIColor(),
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        // The colored scale bars
                        Row(
                          children: [
                            // Underweight zone (blue)
                            Expanded(
                              flex: 185, // 0-18.5 (18.5% of 0-40 scale)
                              child: Container(
                                height: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            // Normal zone (green)
                            Expanded(
                              flex: 65, // 18.5-25 (6.5% of 0-40 scale)
                              child: Container(
                                height: 30,
                                color: Colors.green,
                              ),
                            ),
                            // Overweight zone (orange)
                            Expanded(
                              flex: 50, // 25-30 (5% of 0-40 scale)
                              child: Container(
                                height: 30,
                                color: Colors.orange,
                              ),
                            ),
                            // Obese zone (red)
                            Expanded(
                              flex: 100, // 30-40 (10% of 0-40 scale)
                              child: Container(
                                height: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 15),
                    
                    // Labels for BMI ranges
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildScaleLabel('Underweight', Colors.blue),
                        _buildScaleLabel('Normal', Colors.green),
                        _buildScaleLabel('Overweight', Colors.orange),
                        _buildScaleLabel('Obese', Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // RECOMMENDATION CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.lightbulb_outline,
                          color: Color(0xFFF39C12),
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: const Text(
                            'For your height, a normal weight range would be:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Recommendation text
                    Text(
                      getRecommendation(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7F8C8D),
                        height: 1.6,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Additional health tip
                    const Text(
                      'Maintaining a healthy weight offers benefits such as reduced risk of chronic diseases, improved mental well-being, and increased longevity.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF95A5A6),
                        height: 1.5,
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 30),
              
              // RECALCULATE BUTTON - goes back to information screen
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Pop removes current screen from navigation stack
                    Navigator.pop(context);
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
                    'Recalculate BMI',
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
  
  /// Helper widget to build BMI scale labels
  /// This is a custom widget method to avoid code repetition
  Widget _buildScaleLabel(String text, Color color) {
    return Column(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle, // Makes it circular
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF7F8C8D),
          ),
        ),
      ],
    );
  }
}

