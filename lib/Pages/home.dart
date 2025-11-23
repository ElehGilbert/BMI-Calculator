import 'package:flutter/material.dart';
import 'informationScreen.dart'; // Import the information screen to navigate to it

/// Home is a StatelessWidget - a widget that doesn't change once built
/// This is the landing/welcome screen of the BMI calculator app
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic visual structure (app bar, body, etc.)
    return Scaffold(
      // Background color for the entire screen - light blue shade
      backgroundColor: const Color(0xFFB3D9F2),
      
      // SafeArea ensures content doesn't overlap with system UI (notch, status bar)
      body: SafeArea(
        // Stack allows positioning decorative clouds
        child: Stack(
          children: [
            // Decorative clouds in the background
            Positioned(
              top: 20,
              left: 30,
              child: CustomPaint(
                size: const Size(60, 30),
                painter: CloudPainter(),
              ),
            ),
            Positioned(
              top: 40,
              right: 100,
              child: CustomPaint(
                size: const Size(80, 40),
                painter: CloudPainter(),
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: CustomPaint(
                size: const Size(100, 50),
                painter: CloudPainter(),
              ),
            ),
            
            // Main content
            Center(
              // Padding adds space around the content
              child: Padding(
                padding: const EdgeInsets.all(24.0), // 24 pixels on all sides
                
                // Column arranges children widgets vertically (top to bottom)
                child: Column(
                  // Center children horizontally within the column
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container for the illustration and welcome text
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      // Decoration adds styling to the container
                      decoration: BoxDecoration(
                        color: Colors.white, // White background
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                        // BoxShadow adds a soft shadow for depth
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          // Info icon button in the top-left corner
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!, width: 1.5),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.info_outline,
                                  color: Color(0xFF7F8C8D),
                                  size: 20,
                                ),
                                onPressed: () {
                                  // This would show app information (you can implement a dialog)
                                },
                              ),
                            ),
                          ),
                          
                          const SizedBox(height: 10),
                          
                          // Illustration area with decorative elements
                          Container(
                            height: 220,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8F4FD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(
                              children: [
                                // Decorative elements positioned around
                                Positioned(
                                  top: 20,
                                  left: 30,
                                  child: CustomPaint(
                                    size: const Size(40, 20),
                                    painter: CloudPainter(),
                                  ),
                                ),
                                Positioned(
                                  top: 15,
                                  right: 20,
                                  child: Icon(Icons.access_time, color: Colors.grey[400], size: 30),
                                ),
                                Positioned(
                                  bottom: 30,
                                  left: 20,
                                  child: Icon(Icons.eco, color: Colors.green[300], size: 35),
                                ),
                                Positioned(
                                  bottom: 20,
                                  right: 20,
                                  child: Icon(Icons.sports_basketball, color: Colors.blue[300], size: 35),
                                ),
                                Positioned(
                                  top: 30,
                                  left: 20,
                                  child: Icon(Icons.favorite, color: Colors.blue[600], size: 35),
                                ),
                                Positioned(
                                  top: 50,
                                  right: 40,
                                  child: Icon(Icons.water_drop, color: Colors.blue[400], size: 30),
                                ),
                                
                                // Central illustration
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Running people emojis
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '🏃‍♂️',
                                            style: TextStyle(fontSize: 80),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            '🏃‍♀️',
                                            style: TextStyle(fontSize: 80),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                          
                          // Main heading text
                          const Text(
                            'Calculate my BMI',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold, // Makes text bold
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                          
                          const SizedBox(height: 16),
                          
                          // Description text explaining the app
                          const Text(
                            'Discover your BMI with our app! Enter your height and weight to get valuable insights into your health. Let\'s start your wellness journey today!',
                            textAlign: TextAlign.center, // Center-align the text
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF7F8C8D),
                              height: 1.5, // Line height for better readability
                            ),
                          ),
                          
                          const SizedBox(height: 30),
                          
                          // Start button - navigates to the information screen
                          SizedBox(
                            width: double.infinity, // Makes button full width
                            child: ElevatedButton(
                              // onPressed defines what happens when button is tapped
                              onPressed: () {
                                // Navigator.push adds a new screen on top of current screen
                                // This is how we navigate between screens in Flutter
                                Navigator.push(
                                  context, // Context provides location in widget tree
                                  // MaterialPageRoute creates a platform-adaptive page transition
                                  MaterialPageRoute(
                                    builder: (context) => const InformationScreen(),
                                  ),
                                );
                              },
                              // Style the button
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4A90E2), // Blue background
                                foregroundColor: Colors.white, // White text
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 5, // Shadow depth
                              ),
                              // Button content: text and icon in a row
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Start',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward), // Arrow icon
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    
                    // Decorative plants at the bottom
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Plant icon 1
                        CustomPaint(
                          size: const Size(40, 60),
                          painter: PlantPainter(),
                        ),
                        const SizedBox(width: 40),
                        // Plant icon 2
                        CustomPaint(
                          size: const Size(40, 60),
                          painter: PlantPainter(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom painter for cloud shapes
class CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.2, size.height * 0.3,
      size.width * 0.4, size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.5, 0,
      size.width * 0.7, size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width, size.height * 0.3,
      size.width * 0.9, size.height * 0.7,
    );
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Custom painter for plant/leaf shapes
class PlantPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2D5016)
      ..style = PaintingStyle.fill;

    // Draw stem
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.45, size.height * 0.3, size.width * 0.1, size.height * 0.7),
      paint,
    );

    // Draw leaves on alternating sides
    for (int i = 0; i < 5; i++) {
      final yPos = size.height * (0.3 + i * 0.12);
      final isLeft = i % 2 == 0;
      
      final path = Path();
      if (isLeft) {
        path.moveTo(size.width * 0.45, yPos);
        path.quadraticBezierTo(
          size.width * 0.2, yPos - 5,
          size.width * 0.1, yPos + 10,
        );
        path.quadraticBezierTo(
          size.width * 0.25, yPos + 5,
          size.width * 0.45, yPos + 15,
        );
      } else {
        path.moveTo(size.width * 0.55, yPos);
        path.quadraticBezierTo(
          size.width * 0.8, yPos - 5,
          size.width * 0.9, yPos + 10,
        );
        path.quadraticBezierTo(
          size.width * 0.75, yPos + 5,
          size.width * 0.55, yPos + 15,
        );
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}