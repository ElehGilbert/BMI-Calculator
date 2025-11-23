# BMI Calculator App

A beautiful and intuitive BMI (Body Mass Index) Calculator built with Flutter. This app helps users calculate their BMI and provides health recommendations based on their measurements.

## Features

- 🎨 Clean and modern UI design
- 📊 BMI calculation with visual feedback
- 🎯 BMI category classification (Underweight, Normal, Overweight, Obese)
- 📈 Visual BMI scale with color-coded ranges
- 💡 Personalized health recommendations
- 🔄 Easy navigation between screens
- ⚖️ Unit toggle (Feet/Meters for height)
- ➕➖ Simple increment/decrement controls for weight and age

## Screenshots

The app consists of three main screens:
1. **Home Screen** - Welcome screen with app introduction
2. **Information Screen** - Input form for user data
3. **Result Screen** - BMI calculation results and recommendations

## Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code with Flutter extensions
- Android/iOS emulator or physical device

### Installation

1. Clone this repository
2. Navigate to the project directory:
   ```bash
   cd bmi_calculator
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                 # App entry point
└── Pages/
    ├── home.dart             # Welcome/landing screen
    ├── informationScreen.dart # Data input screen
    └── resultScreen.dart     # Results display screen
```

## Key Widgets and Components Explained

### 1. Stateless vs Stateful Widgets

#### StatelessWidget
- **What it is**: A widget that doesn't change once it's built
- **Used in**: `Home` and `ResultScreen`
- **Example**: The home screen doesn't need to update its content based on user interaction
- **Why use it**: More efficient for static content, simpler to implement

```dart
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

#### StatefulWidget
- **What it is**: A widget that can change its content dynamically
- **Used in**: `InformationScreen`
- **Example**: The information screen updates when users change gender, height, weight, or age
- **Why use it**: Necessary when the UI needs to react to user input or data changes

```dart
class InformationScreen extends StatefulWidget {
  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  // Mutable state variables
  String selectedGender = 'Male';
  int weight = 75;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

### 2. Layout Widgets

#### Scaffold
- **Purpose**: Provides the basic visual structure for Material Design apps
- **Components**: AppBar, Body, FloatingActionButton, Drawer, etc.
- **Usage**: Every screen in this app uses Scaffold as the root widget

```dart
Scaffold(
  appBar: AppBar(...),  // Top bar
  body: Column(...),    // Main content
  backgroundColor: Colors.white,  // Background color
)
```

#### Column
- **Purpose**: Arranges children widgets vertically (top to bottom)
- **Properties**:
  - `mainAxisAlignment`: Controls vertical spacing
  - `crossAxisAlignment`: Controls horizontal alignment
  - `children`: List of widgets to display

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,  // Center vertically
  crossAxisAlignment: CrossAxisAlignment.start, // Align to left
  children: [
    Text('First'),
    Text('Second'),
    Text('Third'),
  ],
)
```

#### Row
- **Purpose**: Arranges children widgets horizontally (left to right)
- **Similar to Column** but in horizontal direction

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Icon(Icons.male),
    Text('Male'),
  ],
)
```

#### Container
- **Purpose**: A versatile widget for styling and positioning
- **Features**: Padding, margin, decoration, size constraints
- **Usage**: Used extensively for creating cards and styled boxes

```dart
Container(
  padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [BoxShadow(...)],
  ),
  child: Text('Content'),
)
```

#### Expanded
- **Purpose**: Makes a child widget fill available space
- **Usage**: Used in Row/Column to distribute space
- **flex**: Controls the proportion of space taken

```dart
Row(
  children: [
    Expanded(  // Takes half the width
      child: Container(...),
    ),
    SizedBox(width: 16),
    Expanded(  // Takes half the width
      child: Container(...),
    ),
  ],
)
```

#### Stack
- **Purpose**: Overlays widgets on top of each other
- **Usage**: Used in ResultScreen for BMI scale with position marker

```dart
Stack(
  children: [
    Container(...),  // Background
    Positioned(      // Positioned on top
      left: 100,
      top: 20,
      child: Icon(Icons.arrow_down),
    ),
  ],
)
```

### 3. Interactive Widgets

#### ElevatedButton
- **Purpose**: Material Design raised button
- **Properties**: onPressed, style, child
- **Usage**: "Start" and "Calculate" buttons

```dart
ElevatedButton(
  onPressed: () {
    // Action when button is pressed
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF4A90E2),
    padding: EdgeInsets.symmetric(vertical: 16),
  ),
  child: Text('Calculate'),
)
```

#### GestureDetector
- **Purpose**: Detects various gestures (tap, long press, drag, etc.)
- **Usage**: Custom gender selection buttons
- **Why use it**: When you need tap detection on non-button widgets

```dart
GestureDetector(
  onTap: () {
    setState(() {
      selectedGender = 'Male';
    });
  },
  child: Container(...),  // Custom styled button
)
```

#### Slider
- **Purpose**: Allows users to select a value by dragging
- **Properties**: value, min, max, divisions, onChanged
- **Usage**: Height selection in InformationScreen

```dart
Slider(
  value: heightInMeters,
  min: 1.0,
  max: 2.5,
  divisions: 150,
  onChanged: (value) {
    setState(() {
      heightInMeters = value;
    });
  },
)
```

#### IconButton
- **Purpose**: A button with an icon
- **Usage**: Increment/decrement controls, back button

```dart
IconButton(
  onPressed: () {
    setState(() {
      weight++;
    });
  },
  icon: Icon(Icons.add),
)
```

### 4. Display Widgets

#### Text
- **Purpose**: Displays text
- **Properties**: style, textAlign, maxLines
- **TextStyle**: fontSize, fontWeight, color, etc.

```dart
Text(
  'Calculate my BMI',
  style: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFF2C3E50),
  ),
)
```

#### Icon
- **Purpose**: Displays Material Design icons
- **Properties**: size, color

```dart
Icon(
  Icons.favorite,
  size: 40,
  color: Colors.blue,
)
```

### 5. Styling Widgets

#### BoxDecoration
- **Purpose**: Provides visual decoration for Container
- **Features**: color, borderRadius, border, boxShadow, gradient

```dart
BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 20,
      offset: Offset(0, 10),
    ),
  ],
  border: Border.all(color: Colors.grey, width: 2),
)
```

#### Padding
- **Purpose**: Adds space around a widget
- **EdgeInsets**: all, symmetric, only

```dart
Padding(
  padding: EdgeInsets.all(20),  // 20 pixels on all sides
  child: Text('Padded text'),
)

Padding(
  padding: EdgeInsets.symmetric(
    horizontal: 24,  // 24 pixels left and right
    vertical: 12,    // 12 pixels top and bottom
  ),
  child: Text('Text'),
)
```

#### SizedBox
- **Purpose**: Creates fixed-size spacing or constrains child size
- **Usage**: Vertical/horizontal spacing between widgets

```dart
SizedBox(height: 20),  // Vertical space
SizedBox(width: 16),   // Horizontal space
SizedBox(
  width: double.infinity,  // Full width
  child: ElevatedButton(...),
)
```

### 6. Scrolling Widgets

#### SingleChildScrollView
- **Purpose**: Makes content scrollable when it overflows
- **Usage**: Wraps the body content in screens with lots of content
- **Why needed**: Prevents overflow errors on small screens

```dart
SingleChildScrollView(
  child: Column(
    children: [
      // All your widgets
    ],
  ),
)
```

### 7. Special Widgets

#### SafeArea
- **Purpose**: Ensures content doesn't overlap with system UI (notch, status bar)
- **Usage**: Wraps the body content in Home screen

```dart
SafeArea(
  child: Column(...),
)
```

#### MediaQuery
- **Purpose**: Gets information about the device screen
- **Usage**: Used for responsive positioning in ResultScreen
- **Properties**: size, orientation, padding

```dart
double screenWidth = MediaQuery.of(context).size.width;
double screenHeight = MediaQuery.of(context).size.height;
```

## Navigation in Flutter

### How Navigation Works

Flutter uses a **stack-based navigation system** (like a stack of cards):
- **Push**: Adds a new screen on top of the stack
- **Pop**: Removes the top screen and goes back

### Navigator.push()

**Purpose**: Navigate to a new screen

**When used**:
- Home → Information Screen (when "Start" is pressed)
- Information Screen → Result Screen (when "Calculate" is pressed)

**How it works**:
1. Takes the current `context` (location in widget tree)
2. Creates a `MaterialPageRoute` with the destination screen
3. Pushes the new screen on top of the navigation stack
4. Automatically adds a back button to the new screen's AppBar

```dart
Navigator.push(
  context,  // Current location
  MaterialPageRoute(
    builder: (context) => InformationScreen(),  // New screen
  ),
);
```

### Navigator.pop()

**Purpose**: Go back to the previous screen

**When used**:
- Back button in AppBar
- "Recalculate BMI" button

**How it works**:
1. Removes the current screen from the navigation stack
2. Shows the previous screen underneath
3. Can optionally return data to the previous screen

```dart
Navigator.pop(context);
```

### Passing Data Between Screens

**Method**: Through constructor parameters

**Example**: Passing BMI calculation data to ResultScreen

```dart
// In InformationScreen
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ResultScreen(
      bmi: calculatedBMI,
      weight: weight,
      height: heightInMeters,
      age: age,
      gender: selectedGender,
    ),
  ),
);

// In ResultScreen
class ResultScreen extends StatelessWidget {
  final double bmi;
  final int weight;
  // ... other parameters
  
  const ResultScreen({
    required this.bmi,
    required this.weight,
    // ... other parameters
  });
}
```

## State Management

### setState()

**Purpose**: Tells Flutter to rebuild the widget with updated data

**When used**: Whenever you change a variable and want the UI to update

**How it works**:
1. Modifies state variables inside the callback
2. Marks the widget as "dirty" (needs rebuilding)
3. Flutter rebuilds the widget on the next frame

```dart
// Without setState - UI won't update
void incrementWeight() {
  weight++;  // Variable changes but UI stays the same
}

// With setState - UI updates
void incrementWeight() {
  setState(() {
    weight++;  // Variable changes AND UI updates
  });
}
```

**Usage in InformationScreen**:
- Gender selection
- Height slider adjustment
- Weight/age increment/decrement
- Unit toggle (Feet/Meters)

## Color Scheme

The app uses a consistent color palette:

- **Primary Blue**: `Color(0xFF4A90E2)` - Buttons, accents
- **Dark Text**: `Color(0xFF2C3E50)` - Headings
- **Grey Text**: `Color(0xFF7F8C8D)` - Descriptions
- **Light Background**: `Color(0xFFF5F5F5)` - Screen backgrounds
- **Pink**: `Color(0xFFFF69B4)` - Female selection
- **Category Colors**:
  - Blue: Underweight
  - Green: Normal
  - Orange: Overweight
  - Red: Obese

### Color Format

```dart
Color(0xFF4A90E2)
//    │  │ │ │ │└── Blue
//    │  │ │ │└──── Green
//    │  │ │└────── Red
//    │  │└──────── Alpha (opacity)
//    │└────────── 0x prefix (hexadecimal)
//    └──────────── FF = fully opaque
```

## BMI Calculation

### Formula
```
BMI = weight (kg) / height² (m²)
```

### Categories
- **Underweight**: BMI < 18.5
- **Normal**: 18.5 ≤ BMI < 25
- **Overweight**: 25 ≤ BMI < 30
- **Obese**: BMI ≥ 30

### Implementation

```dart
double calculateBMI() {
  return weight / (heightInMeters * heightInMeters);
}

String getBMICategory() {
  if (bmi < 18.5) return 'Underweight';
  else if (bmi < 25) return 'Normal';
  else if (bmi < 30) return 'Overweight';
  else return 'Obese';
}
```

## Learning Tips

### For Beginners

1. **Start with StatelessWidget**: Understand basic widget structure first
2. **Learn Layout Widgets**: Column, Row, Container are fundamental
3. **Practice setState**: This is crucial for interactive apps
4. **Understand Navigation**: Navigator.push and pop are used in most apps
5. **Read Comments**: All code in this app is heavily commented
6. **Experiment**: Try changing colors, sizes, and text to see what happens

### Key Concepts to Master

1. **Widget Tree**: Everything in Flutter is a widget
2. **Build Method**: Defines what the widget looks like
3. **Const Constructors**: Use `const` for better performance
4. **Required Parameters**: Ensure necessary data is provided
5. **Context**: Represents the widget's location in the tree

### Common Patterns

#### Creating a Styled Button
```dart
ElevatedButton(
  onPressed: () { /* action */ },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    padding: EdgeInsets.symmetric(vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: Text('Button Text'),
)
```

#### Creating a Card
```dart
Container(
  padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: Offset(0, 10),
      ),
    ],
  ),
  child: /* content */,
)
```

#### Spacing Pattern
```dart
Column(
  children: [
    Text('First'),
    SizedBox(height: 16),  // Space
    Text('Second'),
    SizedBox(height: 16),  // Space
    Text('Third'),
  ],
)
```

## Customization Ideas

- Add more health metrics (BMR, ideal weight)
- Save calculation history using local storage
- Add animations for screen transitions
- Support for imperial units (pounds, inches)
- Dark mode theme
- Charts showing BMI history over time
- Social sharing features

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [Material Design Guidelines](https://material.io/design)
- [Flutter Widget Catalog](https://flutter.dev/docs/development/ui/widgets)

## License

This project is created for educational purposes.

---

**Happy Learning!** 🚀

Feel free to experiment with the code and make it your own. The best way to learn Flutter is by building and modifying apps!

