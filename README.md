# BMI Calculator App

A beautiful and intuitive BMI (Body Mass Index) Calculator built with Flutter. This app helps users calculate their BMI and provides health recommendations based on their measurements.

## Features

-  Clean and modern UI design
-  BMI calculation with visual feedback
-  BMI category classification (Underweight, Normal, Overweight, Obese)
-  Visual BMI scale with color-coded ranges
-  Personalized health recommendations
-  Easy navigation between screens
-  Unit toggle (Feet/Meters for height)
- ➕➖ Simple increment/decrement controls for weight and age

## Screenshots
<img width="300" height="1400" alt="Home Screen" src="https://github.com/user-attachments/assets/4ba13936-2f1e-42d2-8d24-a2e3d24414ce" />
<img width="300" height="1400" alt="Information Screen" src="https://github.com/user-attachments/assets/2905ad4d-276e-4651-ac65-5a128bdb93fd" />
<img width="300" height="1400" alt="Results Screen" src="https://github.com/user-attachments/assets/34023cb9-66cf-482e-8930-851b7a91f13e" />
<img width="300" height="1400" alt="Results Screen" src="https://github.com/user-attachments/assets/7e5d8ef4-ea01-4aa3-a50a-ca231c542a56" />



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

## Key Widgets and Components Used Explained 

### 1. Stateless vs Stateful Widgets

#### StatelessWidget
- **What it is**: A widget that doesn't change once it's built. It's immutable.
- **Used in**: `Home` and `ResultScreen`
- **Example**: The home screen doesn't need to update its content based on user interaction - it just displays static welcome content
- **Why use it**: More efficient for static content, simpler to implement, better performance
- **Key characteristic**: No `setState()` method, no mutable state variables

```dart
class Home extends StatelessWidget {
  const Home({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

**When to use StatelessWidget:**
- Screens with static content
- Widgets that only depend on configuration (constructor parameters)
- Result/display screens that just show data without user interaction changing the display

#### StatefulWidget
- **What it is**: A widget that can change its content dynamically. It has a separate State object that holds mutable data.
- **Used in**: `InformationScreen`
- **Example**: The information screen updates when users change gender, select height, adjust weight, or modify age
- **Why use it**: Necessary when the UI needs to react to user input or data changes
- **Key characteristic**: Has a `State` object with mutable variables and `setState()` method

```dart
class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});
  
  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  // Mutable state variables - these can change
  String selectedGender = 'Male';
  bool isFeet = true;
  double heightInMeters = 1.80;
  int weight = 75;
  int age = 24;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(...);
  }
}
```

**When to use StatefulWidget:**
- Forms with user input
- Screens with toggles, sliders, or counters
- Any widget where the display needs to update based on user interaction
- Widgets that need to maintain local state

### 2. Layout Widgets

#### Scaffold
- **Purpose**: Provides the basic visual structure for Material Design apps
- **What it includes**: 
  - AppBar (top navigation bar)
  - Body (main content area)
  - FloatingActionButton (optional floating button)
  - Drawer (optional side menu)
  - BottomNavigationBar (optional bottom navigation)
  - backgroundColor (screen background color)
- **Usage**: Every screen in this app uses Scaffold as the root widget
- **Why important**: Gives your app a consistent, professional structure

```dart
Scaffold(
  appBar: AppBar(
    title: Text('My Results'),
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    ),
  ),
  backgroundColor: Color(0xFFF5F5F5),
  body: Column(...),  // Main content
)
```

**Real usage in our app:**
- Home screen: No AppBar, just body with SafeArea
- InformationScreen: AppBar with title "My Information" and back button
- ResultScreen: AppBar with title "My Results" and back button

#### Column
- **Purpose**: Arranges children widgets vertically (top to bottom)
- **Main Properties**:
  - `mainAxisAlignment`: Controls vertical spacing (start, center, end, spaceBetween, spaceAround, spaceEvenly)
  - `crossAxisAlignment`: Controls horizontal alignment (start, center, end, stretch)
  - `mainAxisSize`: min (takes minimum space) or max (takes all available space)
  - `children`: List of widgets to display
- **Usage**: Used extensively in all screens for vertical layout

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,     // Center vertically
  crossAxisAlignment: CrossAxisAlignment.start,    // Align to left
  children: [
    Text('Gender'),
    SizedBox(height: 12),  // Spacing
    Row(...),              // Gender buttons
  ],
)
```

**Real examples from our app:**
- InformationScreen: Main body uses Column to stack gender, height, weight/age sections vertically
- ResultScreen: Uses Column to stack BMI card, scale, and recommendation vertically
- Inside containers: Weight and Age cards use Column to stack label, value, and buttons

#### Row
- **Purpose**: Arranges children widgets horizontally (left to right)
- **Properties**: Similar to Column but in horizontal direction
- **Usage**: Used for side-by-side layouts

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Icon(Icons.male),
    SizedBox(width: 8),
    Text('Male'),
  ],
)
```

**Real usage in our app:**
- Gender selection: Male and Female buttons side by side
- Weight and Age: Two containers displayed side by side using Row
- Height display: Min value, current value, max value in a row
- BMI scale labels: Four category labels displayed horizontally
- Icon + Text combinations: Throughout the app (e.g., info icon + text)

#### Container
- **Purpose**: A versatile box widget for styling and positioning
- **Features**: 
  - `padding`: Space inside the container
  - `margin`: Space outside the container
  - `decoration`: Visual styling (BoxDecoration)
  - `width` and `height`: Size constraints
  - `alignment`: How child is positioned inside
  - `child`: The widget inside the container
- **Usage**: Used extensively for creating cards and styled boxes

```dart
Container(
  padding: EdgeInsets.all(20),
  margin: EdgeInsets.symmetric(horizontal: 16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 20,
        offset: Offset(0, 10),
      ),
    ],
  ),
  child: Text('Content'),
)
```

**Real usage in our app:**
- White cards: Height section, Weight/Age cards, BMI result card all use Container
- Gender buttons: Container with conditional styling based on selection
- Illustration area: Container with light blue background (#E8F4FD)
- Icon backgrounds: Small containers with circular shape for increment/decrement buttons
- BMI scale bars: Containers with specific colors for each BMI category

#### Expanded
- **Purpose**: Makes a child widget expand to fill available space in Row/Column
- **How it works**: Takes all remaining space after other widgets are laid out
- **flex property**: Controls proportion of space when multiple Expanded widgets exist (default is 1)
- **Usage**: Perfect for making responsive layouts

```dart
Row(
  children: [
    Expanded(  // Takes half the width
      flex: 1,
      child: Container(...),  // Male button
    ),
    SizedBox(width: 12),
    Expanded(  // Takes half the width
      flex: 1,
      child: Container(...),  // Female button
    ),
  ],
)
```

**Real usage in our app:**
- Gender buttons: Both Male and Female buttons use Expanded to take equal width
- Weight and Age containers: Each uses Expanded to take half the row width
- BMI scale visualization: Four colored bars use Expanded with different flex values to represent proportions
  - Underweight (blue): flex: 185
  - Normal (green): flex: 65
  - Overweight (orange): flex: 50
  - Obese (red): flex: 100
- Text wrapping: Expanded wraps long recommendation text to prevent overflow

#### Stack
- **Purpose**: Overlays widgets on top of each other (like layers in Photoshop)
- **How it works**: Children are painted in order, with later children appearing on top
- **Usage**: Used for absolute positioning and overlapping elements
- **Key widgets used with Stack**:
  - `Positioned`: Places widget at specific coordinates (left, top, right, bottom)
  - `Align`: Aligns widget within the Stack

```dart
Stack(
  children: [
    Container(...),  // Background layer
    Positioned(      // Positioned on top
      left: 100,
      top: 20,
      child: Icon(Icons.arrow_down),
    ),
  ],
)
```

**Real usage in our app:**
- Home screen: Stack with centered main content and positioned info icon (top-right) and Start button (bottom-right)
- Illustration area: Stack with decorative icons positioned around central emojis
- BMI scale pointer: Uses LayoutBuilder with Stack to position arrow indicator above the colored scale
- Decorative elements: Heart, water drop, eco, and sports icons positioned at specific locations

#### SingleChildScrollView
- **Purpose**: Makes content scrollable when it overflows the screen
- **Why needed**: Prevents overflow errors on small screens or when keyboard appears
- **How it works**: Wraps content and allows vertical or horizontal scrolling
- **Usage**: Essential for forms and long content

```dart
SingleChildScrollView(
  child: Column(
    children: [
      // All your widgets that might overflow
    ],
  ),
)
```

**Real usage in our app:**
- InformationScreen: Wraps the entire body so users can scroll if content doesn't fit (especially on small screens or when keyboard is visible)
- ResultScreen: Allows scrolling through BMI value, scale, and recommendations
- Important for accessibility: Users with different font size settings or smaller screens can still access all content

#### SafeArea
- **Purpose**: Ensures content doesn't overlap with system UI elements
- **What it avoids**: iPhone notch, status bar, home indicator, rounded corners
- **How it works**: Adds automatic padding to keep content in safe area
- **Usage**: Typically wraps the body content

```dart
SafeArea(
  child: Column(...),
)
```

**Real usage in our app:**
- Home screen: Wraps the Stack to ensure info icon and content don't overlap with notch or status bar
- Not needed in InformationScreen/ResultScreen: AppBar already handles this automatically

### 3. Interactive Widgets

#### ElevatedButton
- **Purpose**: Material Design raised button with elevation (shadow)
- **Properties**: 
  - `onPressed`: Function called when button is tapped (null makes button disabled)
  - `style`: ElevatedButton.styleFrom() for customization
  - `child`: Widget displayed inside button (usually Text)
- **Styling options**:
  - `backgroundColor`: Button background color
  - `foregroundColor`: Text/icon color
  - `padding`: Space inside button
  - `shape`: Button shape (rounded corners, etc.)
  - `elevation`: Shadow depth
- **Usage**: "Start" button (Home) and "Calculate" button (InformationScreen)

```dart
ElevatedButton(
  onPressed: () {
    // Action when button is pressed
    Navigator.push(context, MaterialPageRoute(...));
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF4A90E2),  // Blue background
    foregroundColor: Colors.white,       // White text
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),  // Rounded corners
    ),
    elevation: 5,  // Shadow depth
  ),
  child: Text('Calculate'),
)
```

**Real usage in our app:**
- Home screen "Start" button: Navigates to InformationScreen, has arrow icon
- "Calculate" button: Navigates to ResultScreen with calculated BMI data
- "Recalculate BMI" button: Goes back to edit information
- All buttons use consistent blue color (#4A90E2) and rounded shape

#### GestureDetector
- **Purpose**: Detects various gestures (tap, long press, drag, swipe, etc.) on any widget
- **Why use it**: When you need tap detection on non-button widgets or custom-styled buttons
- **Common callbacks**:
  - `onTap`: Single tap
  - `onDoubleTap`: Double tap
  - `onLongPress`: Long press
  - `onPanUpdate`: Drag/pan gesture
- **Usage**: Custom gender selection buttons, unit toggle buttons (Feet/Meters)

```dart
GestureDetector(
  onTap: () {
    setState(() {
      selectedGender = 'Male';
    });
  },
  child: Container(
    // Custom styled button
    padding: EdgeInsets.symmetric(vertical: 14),
    decoration: BoxDecoration(
      color: selectedGender == 'Male' 
          ? Color(0xFF4A90E2)  // Selected color
          : Colors.white,       // Unselected color
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text('Male'),
  ),
)
```

**Real usage in our app:**
- Male/Female gender buttons: Changes selectedGender and updates UI color
- Feet/Meters toggle: Switches between height units (isFeet boolean)
- Custom buttons: Allows full control over button appearance vs standard ElevatedButton
- Conditional styling: Background color and text color change based on selection state

#### Slider
- **Purpose**: Allows users to select a value by dragging a thumb along a track
- **Properties**:
  - `value`: Current value (double)
  - `min`: Minimum value
  - `max`: Maximum value
  - `divisions`: Number of discrete intervals (null for continuous)
  - `onChanged`: Callback when value changes
  - `activeColor`: Color of active (filled) portion
  - `inactiveColor`: Color of inactive portion
  - `label`: Tooltip shown above thumb (requires divisions)
- **Usage**: Height selection in InformationScreen

```dart
Slider(
  value: heightInMeters,  // Current value: 1.80
  min: 1.0,               // Minimum: 1.0m
  max: 2.5,               // Maximum: 2.5m
  divisions: 150,         // 150 discrete steps
  activeColor: Color(0xFF4A90E2),    // Blue for filled portion
  inactiveColor: Colors.grey[300],   // Grey for unfilled portion
  onChanged: (value) {
    setState(() {
      heightInMeters = value;  // Update state with new value
    });
  },
)
```

**Real usage in our app:**
- Height slider: Range from 1.0m to 2.5m with 150 divisions (0.01m steps)
- Real-time updates: As user drags, heightInMeters updates and display refreshes
- Unit conversion: Display shows feet when isFeet is true, but internal value stays in meters
- Visual feedback: Blue color shows selected range

#### IconButton
- **Purpose**: A button containing an icon
- **Properties**:
  - `icon`: The Icon widget to display
  - `onPressed`: Function called when tapped
  - `iconSize`: Size of the icon (default 24)
  - `color`: Icon color
  - `padding`: Space around icon
  - `constraints`: Minimum size constraints
- **Usage**: Back button, info button, increment/decrement controls

```dart
IconButton(
  onPressed: () {
    setState(() {
      weight++;  // Increment weight
    });
  },
  icon: Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Color(0xFFE8F4FD),  // Light blue background
      borderRadius: BorderRadius.circular(8),
    ),
    child: Icon(
      Icons.add,
      color: Color(0xFF4A90E2),
    ),
  ),
)
```

**Real usage in our app:**
- Back buttons: In AppBar with arrow_back icon, calls Navigator.pop()
- Info button: Top-right of Home screen (circular bordered)
- Weight controls: Plus and minus buttons to increment/decrement weight
- Age controls: Plus and minus buttons to increment/decrement age
- Custom styling: Icons wrapped in colored containers for better visual appeal

### 4. Display Widgets

#### Text
- **Purpose**: Displays text on screen
- **Properties**:
  - `style`: TextStyle for formatting (fontSize, fontWeight, color, etc.)
  - `textAlign`: Alignment (left, center, right, justify)
  - `maxLines`: Maximum number of lines
  - `overflow`: How to handle overflow (ellipsis, fade, clip)
  - `softWrap`: Whether text should wrap to next line (true/false)
- **TextStyle properties**:
  - `fontSize`: Size in logical pixels
  - `fontWeight`: Bold, normal (FontWeight.bold, FontWeight.w600, etc.)
  - `color`: Text color
  - `height`: Line height multiplier
  - `letterSpacing`: Space between letters

```dart
Text(
  'Calculate my BMI',
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFF2C3E50),
    height: 1.5,  // 1.5x line height
  ),
)
```

**Real usage in our app:**
- Headings: Large bold text for titles ("Modern BMI Calculator", "Your current BMI")
  - fontSize: 28-72
  - fontWeight: FontWeight.bold
  - color: #2C3E50 (dark) or dynamic based on BMI category
- Labels: Medium text for field labels ("Birth Gender", "Height", "Weight (kg)")
  - fontSize: 14-16
  - fontWeight: FontWeight.w600
  - color: #2C3E50
- Descriptions: Regular text for explanatory content
  - fontSize: 12-14
  - color: #7F8C8D (grey)
  - height: 1.5-1.6 (better readability)
- Values: Large prominent numbers (BMI value, height, weight, age)
  - fontSize: 32-72
  - fontWeight: FontWeight.bold
- Dynamic text: BMI category gets color from getBMIColor() function

#### Icon
- **Purpose**: Displays Material Design icons
- **Icon Library**: Icons class provides 1000+ pre-made icons
- **Properties**:
  - `size`: Icon size in logical pixels
  - `color`: Icon color
- **Common icons used**: Icons.male, Icons.female, Icons.arrow_back, Icons.add, Icons.remove, Icons.arrow_forward

```dart
Icon(
  Icons.monitor_weight_outlined,
  size: 60,
  color: Color(0xFF4A90E2),
)
```

**Real usage in our app:**
- Gender icons: Icons.male and Icons.female in gender selection buttons
- Navigation icons: Icons.arrow_back (back button), Icons.arrow_forward (Start button)
- Action icons: Icons.add and Icons.remove for weight/age increment/decrement
- Info icon: Icons.info_outline in top-right of Home screen
- Decorative icons: 
  - Icons.favorite (heart) - size: 35, color: blue[600]
  - Icons.eco (plant/leaf) - size: 35, color: green[300]
  - Icons.sports_basketball - size: 35, color: blue[300]
  - Icons.water_drop - size: 30, color: blue[400]
  - Icons.monitor_weight_outlined - size: 60, color: #4A90E2
  - Icons.lightbulb_outline - size: 24, color: #F39C12
- Pointer icon: Icons.arrow_drop_down - size: 40, dynamic color based on BMI

#### SizedBox
- **Purpose**: Creates fixed-size spacing or constrains child size
- **Two main uses**:
  1. Spacing: Empty box with width or height
  2. Sizing: Container with specific dimensions for child
- **Properties**:
  - `width`: Fixed width
  - `height`: Fixed height
  - `child`: Optional widget to constrain

```dart
// Vertical spacing
SizedBox(height: 20),  // 20 pixels of vertical space

// Horizontal spacing
SizedBox(width: 16),   // 16 pixels of horizontal space

// Full-width button
SizedBox(
  width: double.infinity,  // Full available width
  child: ElevatedButton(...),
)
```

**Real usage in our app:**
Consistent spacing pattern used throughout:
- `SizedBox(height: 30)`: Large section spacing (between major sections)
- `SizedBox(height: 20)`: Medium spacing (between related elements)
- `SizedBox(height: 16)`: Small spacing (between label and input)
- `SizedBox(height: 12)`: Extra small spacing (between very close elements)
- `SizedBox(height: 10)`: Minimal spacing
- `SizedBox(width: 8)`: Icon-text spacing
- `SizedBox(width: 12)`: Button spacing (between gender buttons)
- `SizedBox(width: 16)`: Container spacing (between weight and age)
- Full-width buttons: All ElevatedButtons wrapped in SizedBox(width: double.infinity)

#### Padding
- **Purpose**: Adds space around a widget (inside its parent)
- **EdgeInsets options**:
  - `all(value)`: Same padding on all sides
  - `symmetric(horizontal: h, vertical: v)`: Different horizontal and vertical
  - `only(left: l, top: t, right: r, bottom: b)`: Specific sides
  - `fromLTRB(left, top, right, bottom)`: All four sides different
- **Difference from margin**: Padding is inside, margin is outside

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
  child: Column(...),
)
```

**Real usage in our app:**
- Screen-level padding: `EdgeInsets.all(20)` wraps all screen content
- Card padding: `EdgeInsets.all(20)` or `EdgeInsets.all(30)` inside white containers
- Button padding: `EdgeInsets.symmetric(horizontal: 32, vertical: 16)` or `EdgeInsets.symmetric(vertical: 14)`
- Content padding: `EdgeInsets.symmetric(horizontal: 32)` for Home screen centered content
- Badge padding: `EdgeInsets.symmetric(horizontal: 24, vertical: 12)` for BMI category badge
- Small padding: `EdgeInsets.all(4)` for icon button backgrounds

#### CustomPaint & CustomPainter
- **Purpose**: Create custom graphics and drawings
- **CustomPaint**: Widget that provides a canvas for custom painting
- **CustomPainter**: Abstract class you extend to define custom drawing logic
- **Canvas methods**: drawRect, drawCircle, drawPath, drawLine, etc.
- **Paint object**: Defines how to draw (color, style, stroke width)

```dart
// Widget that uses custom painting
CustomPaint(
  size: Size(40, 20),
  painter: CloudPainter(),
)

// Custom painter class
class CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.7);
    path.quadraticBezierTo(...);
    // ... draw cloud shape
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
```

**Real usage in our app:**
- **CloudPainter**: Draws decorative cloud outline in home screen
  - Uses `Path` with quadratic Bezier curves for smooth cloud shape
  - White stroke with 30% opacity
  - Size: 40x20 pixels
  - Positioned at top-left of illustration area
  
- **PlantPainter**: Draws decorative plant/stem with leaves (defined but not currently displayed)
  - Draws vertical stem using `drawRect`
  - Draws alternating leaves using Path and quadratic Bezier curves
  - Green color (#2D5016)
  - Dynamic leaf positioning using loop

- **Key methods**:
  - `paint()`: Where actual drawing happens
  - `shouldRepaint()`: Returns false since our painters don't change
  - `Path`: Defines complex shapes
  - `quadraticBezierTo()`: Creates smooth curves

### 5. Styling Widgets

#### BoxDecoration
- **Purpose**: Provides visual decoration for Container widget
- **Features**: 
  - `color`: Background color
  - `borderRadius`: Rounded corners
  - `border`: Border around container
  - `boxShadow`: Drop shadow effects (list of BoxShadow)
  - `gradient`: Gradient fills (LinearGradient, RadialGradient)
  - `shape`: BoxShape.rectangle or BoxShape.circle
- **Usage**: Used with Container to create cards, buttons, and styled boxes

```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),  // Rounded corners
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),  // 5% black
        blurRadius: 20,    // How blurred the shadow is
        offset: Offset(0, 10),  // Shadow position (x, y)
        spreadRadius: 0,   // How far shadow extends
      ),
    ],
    border: Border.all(
      color: Colors.grey[300]!,
      width: 1.5,
    ),
  ),
  child: Text('Styled content'),
)
```

**Real usage in our app:**

**White Cards with Shadow:**
```dart
// Main result card, height card, weight/age cards
BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),  // Rounded corners
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 20,
      offset: Offset(0, 10),
    ),
  ],
)
```

**Gender Selection Buttons (Conditional):**
```dart
// Male button - changes based on selection
BoxDecoration(
  color: selectedGender == 'Male' 
      ? Color(0xFF4A90E2)   // Blue when selected
      : Colors.white,        // White when not selected
  borderRadius: BorderRadius.circular(30),  // Fully rounded
  border: Border.all(
    color: selectedGender == 'Male'
        ? Color(0xFF4A90E2)
        : Colors.grey[300]!,
  ),
)
```

**BMI Category Badge:**
```dart
BoxDecoration(
  color: getBMIColor().withOpacity(0.1),  // Light tint
  borderRadius: BorderRadius.circular(20),
  border: Border.all(
    color: getBMIColor(),  // Dynamic color based on BMI
    width: 2,
  ),
)
```

**Illustration Container:**
```dart
BoxDecoration(
  color: Color(0xFFE8F4FD),  // Light blue background
  borderRadius: BorderRadius.circular(20),
)
```

**Circular Icon Background:**
```dart
BoxDecoration(
  border: Border.all(color: Colors.grey[300]!, width: 1.5),
  shape: BoxShape.circle,  // Makes it circular
)
```

**Small Action Button Background:**
```dart
BoxDecoration(
  color: Color(0xFFE8F4FD),  // Light blue
  borderRadius: BorderRadius.circular(8),
)
```

**BMI Scale Bars (Partial Rounding):**
```dart
// Leftmost bar (Underweight)
BoxDecoration(
  color: Colors.blue,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15),
    bottomLeft: Radius.circular(15),
  ),
)

// Rightmost bar (Obese)
BoxDecoration(
  color: Colors.red,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(15),
    bottomRight: Radius.circular(15),
  ),
)
```

**Category Label Dot:**
```dart
BoxDecoration(
  color: color,  // Blue, green, orange, or red
  shape: BoxShape.circle,  // Circular dot
)
```

#### BorderRadius
- **Purpose**: Defines rounded corners for containers
- **Methods**:
  - `circular(value)`: All corners same radius
  - `only(topLeft, topRight, bottomLeft, bottomRight)`: Specific corners
  - `horizontal(left, right)`: Left and right sides
  - `vertical(top, bottom)`: Top and bottom sides
- **Usage**: Makes rectangular containers look softer and more modern

**Real usage examples:**
- `BorderRadius.circular(20)`: Most cards and containers
- `BorderRadius.circular(30)`: Buttons and gender selection
- `BorderRadius.circular(8)`: Small icon backgrounds
- `BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))`: Left side of BMI scale
- `BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))`: Right side of BMI scale

#### BoxShadow
- **Purpose**: Creates drop shadow effect beneath containers
- **Properties**:
  - `color`: Shadow color (usually black with opacity)
  - `blurRadius`: How blurred/soft the shadow is
  - `spreadRadius`: How far the shadow extends
  - `offset`: Shadow position relative to widget (Offset(x, y))
- **Usage**: Gives depth to cards and makes them appear elevated

```dart
boxShadow: [
  BoxShadow(
    color: Colors.black.withOpacity(0.05),  // Very subtle shadow
    blurRadius: 20,     // Soft blur
    offset: Offset(0, 10),  // 10 pixels down, 0 horizontal
  ),
]
```

**Real usage in our app:**
- All white cards: Very subtle shadow (5% black opacity, 20px blur, 10px down)
- Main result card: Same subtle shadow for consistency
- No shadow on: Gender buttons, unit toggles, BMI scale (flat design)

### 6. Special & Advanced Widgets

#### Positioned
- **Purpose**: Positions a child widget at specific coordinates within a Stack
- **Properties**:
  - `left`: Distance from left edge
  - `top`: Distance from top edge
  - `right`: Distance from right edge
  - `bottom`: Distance from bottom edge
- **Important**: Only works as a child of Stack widget
- **Usage**: Absolute positioning of overlapping elements

```dart
Stack(
  children: [
    Container(...),  // Base layer
    Positioned(
      top: 20,
      right: 20,
      child: IconButton(...),  // Positioned at top-right
    ),
    Positioned(
      bottom: 32,
      right: 32,
      child: ElevatedButton(...),  // Positioned at bottom-right
    ),
  ],
)
```

**Real usage in our app:**
- **Info icon** (Home screen): `Positioned(top: 20, right: 20)` - top-right corner
- **Start button** (Home screen): `Positioned(bottom: 32, right: 32)` - bottom-right corner
- **Decorative icons** (Illustration area):
  - Cloud: `Positioned(top: 20, left: 30)`
  - Heart icon: `Positioned(top: 30, left: 20)`
  - Water drop: `Positioned(top: 50, right: 40)`
  - Eco icon: `Positioned(bottom: 30, left: 20)`
  - Sports ball: `Positioned(bottom: 20, right: 20)`
- **BMI pointer arrow**: `Positioned(left: calculatedPosition)` - dynamic positioning based on BMI value

#### Center
- **Purpose**: Centers a child widget within its parent
- **How it works**: Takes all available space and centers child both horizontally and vertically
- **Properties**: 
  - `child`: Widget to center
  - `widthFactor`: If set, constrains width (null = unconstrained)
  - `heightFactor`: If set, constrains height (null = unconstrained)
- **Usage**: Simple way to center content

```dart
Center(
  child: Column(
    mainAxisSize: MainAxisSize.min,  // Don't take full height
    children: [
      // Centered content
    ],
  ),
)
```

**Real usage in our app:**
- **Home screen main content**: Centers illustration, title, and description vertically and horizontally
- **Illustration emojis**: Centers the runner emojis inside the illustration container
- **Height values row**: Centers min/current/max height values
- **Gender icon+text**: Centers content within gender buttons

#### LayoutBuilder
- **Purpose**: Builds a widget tree based on parent widget's constraints
- **What it provides**: Access to BoxConstraints (maxWidth, maxHeight, minWidth, minHeight)
- **When to use**: When you need to know available space before building widgets
- **Callback**: builder(BuildContext context, BoxConstraints constraints)

```dart
LayoutBuilder(
  builder: (context, constraints) {
    // constraints.maxWidth gives available width
    final availableWidth = constraints.maxWidth;
    
    // Calculate position based on available space
    final position = (value / maxValue) * availableWidth;
    
    return Stack(
      children: [
        Positioned(
          left: position,
          child: Icon(...),
        ),
      ],
    );
  },
)
```

**Real usage in our app:**
- **BMI scale pointer positioning**:
  - Gets available width: `constraints.maxWidth`
  - Calculates BMI position: `(bmi / 40).clamp(0.0, 1.0)`
  - Converts to pixels: `bmiPosition * scaleWidth`
  - Centers arrow: Subtracts half arrow width
  - Clamps to bounds: Ensures arrow stays within scale
  
```dart
LayoutBuilder(
  builder: (context, constraints) {
    final bmiPosition = (bmi / 40).clamp(0.0, 1.0);
    final scaleWidth = constraints.maxWidth;
    final arrowWidth = 40.0;
    final leftPosition = (bmiPosition * scaleWidth - (arrowWidth / 2))
        .clamp(0.0, scaleWidth - arrowWidth);
    
    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          Positioned(
            left: leftPosition,
            child: Icon(Icons.arrow_drop_down, ...),
          ),
        ],
      ),
    );
  },
)
```

#### MediaQuery
- **Purpose**: Gets information about the device screen and current context
- **What it provides**:
  - Screen size: `MediaQuery.of(context).size`
  - Screen orientation: `MediaQuery.of(context).orientation`
  - Device pixel ratio: `MediaQuery.of(context).devicePixelRatio`
  - Text scale factor: `MediaQuery.of(context).textScaleFactor`
  - System padding (notch, etc.): `MediaQuery.of(context).padding`
- **Usage**: Creating responsive layouts

```dart
double screenWidth = MediaQuery.of(context).size.width;
double screenHeight = MediaQuery.of(context).size.height;

// Use screen dimensions for responsive design
Container(
  width: screenWidth * 0.8,  // 80% of screen width
  height: screenHeight * 0.3,  // 30% of screen height
)
```

**Real usage in our app:**
- Currently not directly used, but available for:
  - Responsive sizing
  - Adapting to different screen sizes
  - Detecting orientation changes
  - Supporting accessibility (large text)

#### AppBar
- **Purpose**: Material Design top app bar
- **Properties**:
  - `title`: Widget displayed in center (usually Text)
  - `leading`: Widget at left (usually back button or menu)
  - `actions`: List of widgets at right (usually IconButtons)
  - `backgroundColor`: AppBar background color
  - `elevation`: Shadow depth beneath AppBar
  - `centerTitle`: Whether to center title (true/false)
- **Usage**: Navigation and screen titles

```dart
AppBar(
  backgroundColor: Colors.white,
  elevation: 0,  // No shadow
  leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Color(0xFF2C3E50)),
    onPressed: () => Navigator.pop(context),
  ),
  title: Text(
    'My Information',
    style: TextStyle(
      color: Color(0xFF2C3E50),
      fontWeight: FontWeight.bold,
    ),
  ),
  centerTitle: true,
)
```

**Real usage in our app:**
- **InformationScreen AppBar**:
  - Title: "My Information"
  - Back button (leading)
  - White background, no shadow
  - Centered title
  
- **ResultScreen AppBar**:
  - Title: "My Results"
  - Back button (leading)
  - White background, no shadow
  - Centered title

- **Home screen**: No AppBar (uses SafeArea instead)

#### MaterialPageRoute
- **Purpose**: Platform-adaptive page transition for navigation
- **How it works**: Creates a route with platform-specific animation
  - iOS: Slide from right
  - Android: Fade + slide from bottom
- **Properties**:
  - `builder`: Function that builds the destination screen
- **Usage**: Used with Navigator.push() for navigation

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => InformationScreen(),
  ),
)

// Can also pass parameters
MaterialPageRoute(
  builder: (context) => ResultScreen(
    bmi: 22.5,
    weight: 75,
    height: 1.80,
    age: 24,
    gender: 'Male',
  ),
)
```

**Real usage in our app:**
- **Home → InformationScreen**: Simple navigation without parameters
- **InformationScreen → ResultScreen**: Passes calculated BMI and all user data
- Platform-specific animations happen automatically

### 7. Helper Widgets & Utilities

#### mainAxisSize
- **Purpose**: Controls how much space Column/Row takes along main axis
- **Values**:
  - `MainAxisSize.max`: Take all available space (default)
  - `MainAxisSize.min`: Take only space needed by children
- **Usage**: Useful when you want Column/Row to not expand fully

```dart
Column(
  mainAxisSize: MainAxisSize.min,  // Only take needed space
  children: [
    Text('Title'),
    Text('Subtitle'),
  ],
)
```

**Real usage in our app:**
- **Home screen centered content**: `mainAxisSize: MainAxisSize.min` prevents Column from stretching to full height, allowing proper centering

#### MainAxisAlignment & CrossAxisAlignment
- **Purpose**: Controls spacing and alignment of children in Row/Column
- **MainAxisAlignment** (along the direction of Row/Column):
  - `start`: Pack children at start
  - `end`: Pack children at end
  - `center`: Pack children at center
  - `spaceBetween`: Space evenly, first and last at edges
  - `spaceAround`: Space evenly with half-size space at edges
  - `spaceEvenly`: Space evenly including edges
- **CrossAxisAlignment** (perpendicular to direction):
  - `start`: Align to start (left for Column, top for Row)
  - `end`: Align to end (right for Column, bottom for Row)
  - `center`: Center children
  - `stretch`: Stretch to fill cross axis
  - `baseline`: Align text baselines

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Space out
  crossAxisAlignment: CrossAxisAlignment.center,      // Center vertically
  children: [
    Text('Left'),
    Text('Middle'),
    Text('Right'),
  ],
)
```

**Real usage in our app:**
- **Gender buttons row**: `mainAxisAlignment: MainAxisAlignment.center` for icon+text
- **Weight/Age controls**: `mainAxisAlignment: MainAxisAlignment.center` for +/- buttons
- **BMI scale labels**: `mainAxisAlignment: MainAxisAlignment.spaceBetween` to distribute across width
- **Height values**: `mainAxisAlignment: MainAxisAlignment.center` and `crossAxisAlignment: CrossAxisAlignment.end` for baseline alignment
- **Section headings**: `crossAxisAlignment: CrossAxisAlignment.start` to left-align

#### double.infinity
- **Purpose**: Represents unbounded/infinite size constraint
- **Usage**: Makes widget take all available space in that dimension
- **Common use**: Full-width buttons

```dart
SizedBox(
  width: double.infinity,  // Take full width
  child: ElevatedButton(
    child: Text('Full Width Button'),
  ),
)

Container(
  width: double.infinity,  // Full width container
  child: Text('Full width text container'),
)
```

**Real usage in our app:**
- All ElevatedButtons wrapped in `SizedBox(width: double.infinity)` to make them full-width
- Containers: `width: double.infinity` for full-width cards

#### Color & Opacity
- **Color formats**:
  - Hex: `Color(0xFF4A90E2)` - ARGB format
  - Named: `Colors.blue`, `Colors.white`, etc.
  - RGB: `Color.fromRGBO(74, 144, 226, 1.0)`
- **Opacity methods**:
  - `withOpacity(0.5)`: Returns new color with opacity (0.0 = transparent, 1.0 = opaque)
  - Alpha in hex: `0xFF` = opaque, `0x80` = 50%, `0x00` = transparent

```dart
Color(0xFF4A90E2)  // Fully opaque blue
//    │  │ │ │ │
//    │  │ │ │ └── Blue value (226)
//    │  │ │└──── Green value (144)
//    │  │└────── Red value (74)
//    │  └──────── Alpha/Opacity (255 = fully opaque)
//    └────────── 0x prefix (hexadecimal)

Colors.black.withOpacity(0.05)  // 5% opacity black
Colors.blue[300]  // Material blue, shade 300
```

**Real usage in our app:**
- **Primary blue**: `Color(0xFF4A90E2)` - buttons, selected items, accents
- **Dark text**: `Color(0xFF2C3E50)` - headings
- **Grey text**: `Color(0xFF7F8C8D)` - labels and descriptions
- **Light grey**: `Color(0xFFF5F5F5)` - screen backgrounds
- **Pink**: `Color(0xFFFF69B4)` - female selection
- **Light blue background**: `Color(0xFFE8F4FD)` - illustration area, button backgrounds
- **Icon button background**: `Color(0xFFE8F4FD)` - light blue
- **Healthy weight**: `Color(0xFF27AE60)` - green
- **Warning color**: `Color(0xFFF39C12)` - orange/amber
- **Shadows**: `Colors.black.withOpacity(0.05)` - very subtle
- **Category badge**: `getBMIColor().withOpacity(0.1)` - 10% tint
- **Cloud**: `Colors.white.withOpacity(0.3)` - semi-transparent
- **Dynamic BMI colors**: Blue (underweight), green (normal), orange (overweight), red (obese)

#### required keyword
- **Purpose**: Marks constructor parameters as mandatory
- **Usage**: Ensures data is provided when creating widget
- **Error**: Compile-time error if required parameter not provided

```dart
class ResultScreen extends StatelessWidget {
  final double bmi;
  final int weight;
  
  const ResultScreen({
    super.key,
    required this.bmi,     // Must be provided
    required this.weight,  // Must be provided
  });
}

// Usage - MUST provide bmi and weight
ResultScreen(
  bmi: 22.5,
  weight: 75,
)
```

**Real usage in our app:**
- **ResultScreen constructor**: All parameters (bmi, weight, height, age, gender) are required
- Ensures data integrity: Cannot create ResultScreen without BMI data

#### const keyword
- **Purpose**: Creates compile-time constants for better performance
- **Benefits**: 
  - Widget reuse: Same const widget reused instead of recreated
  - Memory efficient: Only one instance in memory
  - Performance: No rebuilding needed
- **When to use**: When widget and all its properties don't change

```dart
const Text('Static text')  // This text never changes

const SizedBox(height: 20)  // This spacing never changes

const Icon(Icons.arrow_back)  // This icon never changes
```

**Real usage in our app:**
- **All constructors**: `const Home({super.key})`
- **Static text**: `const Text('My Information')`
- **Fixed spacing**: `const SizedBox(height: 20)`
- **Static icons**: `const Icon(Icons.arrow_back)`
- Performance optimization throughout the app

#### setState()
- **Purpose**: Notifies Flutter that state has changed and widget needs rebuilding
- **How it works**:
  1. Update state variables inside setState callback
  2. Flutter marks widget as "dirty"
  3. Widget rebuilds with new values on next frame
- **Only works in**: StatefulWidget's State class
- **Critical rule**: ALWAYS modify state inside setState, never outside

```dart
// WRONG - UI won't update
void incrementWeight() {
  weight++;
}

// CORRECT - UI updates
void incrementWeight() {
  setState(() {
    weight++;
  });
}

// Can update multiple variables
void selectMale() {
  setState(() {
    selectedGender = 'Male';
    // Can update other variables here too
  });
}
```

**Real usage in our app:**
- **Gender selection**: `setState(() { selectedGender = 'Male'; })`
- **Height slider**: `setState(() { heightInMeters = value; })`
- **Weight increment**: `setState(() { weight++; })`
- **Weight decrement**: `setState(() { if (weight > 1) weight--; })`
- **Age increment**: `setState(() { age++; })`
- **Age decrement**: `setState(() { if (age > 1) age--; })`
- **Unit toggle**: `setState(() { isFeet = true; })` or `setState(() { isFeet = false; })`

Every user interaction that changes displayed data uses setState!

## Navigation in Flutter

### Navigation Fundamentals

Flutter uses a **stack-based navigation system**, similar to a stack of cards:
- **Stack**: Imagine screens stacked on top of each other
- **Push**: Adds a new screen on top of the stack
- **Pop**: Removes the top screen, revealing the one underneath
- **Current screen**: Always the one on top of the stack

### Visual Representation
```
Initial State:          After Push:              After Pop:
┌─────────────┐        ┌─────────────┐          ┌─────────────┐
│   Home      │   →    │Information  │    →     │   Home      │
└─────────────┘        ├─────────────┤          └─────────────┘
                       │   Home      │
                       └─────────────┘
```

### Navigator.push()

**Purpose**: Navigate to a new screen

**When used in our app**:
- Home → Information Screen (when "Start" button is pressed)
- Information Screen → Result Screen (when "Calculate" button is pressed)

**How it works**:
1. Takes the current `context` (your current location in widget tree)
2. Creates a `MaterialPageRoute` with the destination screen
3. Pushes the new screen on top of the navigation stack
4. Automatically adds a back button to the AppBar of new screen
5. Plays platform-specific transition animation

**Syntax**:
```dart
Navigator.push(
  context,                    // Where you are now
  MaterialPageRoute(          // How to get there
    builder: (context) => DestinationScreen(),  // Where to go
  ),
);
```

**Example from Home screen**:
```dart
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InformationScreen(),
      ),
    );
  },
  child: const Text('Start'),
)
```

**Example with data passing (from InformationScreen)**:
```dart
ElevatedButton(
  onPressed: () {
    double bmi = calculateBMI();  // Calculate first
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          bmi: bmi,              // Pass calculated BMI
          weight: weight,        // Pass current weight
          height: heightInMeters,  // Pass current height
          age: age,              // Pass current age
          gender: selectedGender,  // Pass selected gender
        ),
      ),
    );
  },
  child: const Text('Calculate'),
)
```

### Navigator.pop()

**Purpose**: Go back to the previous screen

**When used in our app**:
- Back button in AppBar (automatic)
- "Recalculate BMI" button in ResultScreen
- Back button swipe gesture on iOS (automatic)
- Android back button (automatic)

**How it works**:
1. Removes the current screen from the navigation stack
2. Disposes the current screen (frees memory)
3. Shows the previous screen underneath
4. Plays reverse transition animation
5. Can optionally return data to the previous screen (not used in our app)

**Syntax**:
```dart
Navigator.pop(context);
```

**Example from AppBar back button**:
```dart
AppBar(
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => Navigator.pop(context),  // Go back
  ),
  title: const Text('My Information'),
)
```

**Example from button**:
```dart
ElevatedButton(
  onPressed: () {
    Navigator.pop(context);  // Returns to InformationScreen
  },
  child: const Text('Recalculate BMI'),
)
```

### Navigation Flow in Our App

```
┌─────────────────────┐
│   Home Screen       │  ← Entry point
│   (StatelessWidget) │
└──────────┬──────────┘
           │ Navigator.push()
           │ (Start button)
           ▼
┌─────────────────────┐
│ Information Screen  │  ← Form screen
│  (StatefulWidget)   │
└──────────┬──────────┘
           │ Navigator.push()
           │ (Calculate button)
           │ Passes: bmi, weight, height, age, gender
           ▼
┌─────────────────────┐
│  Result Screen      │  ← Final screen
│ (StatelessWidget)   │
└─────────────────────┘
           │ Navigator.pop()
           │ (Recalculate button or back button)
           │
           ▼
     (Back to Information Screen)
```

### Passing Data Between Screens

**Method**: Through constructor parameters

**Step 1 - Define parameters in destination screen**:
```dart
class ResultScreen extends StatelessWidget {
  // Define what data this screen needs
  final double bmi;
  final int weight;
  final double height;
  final int age;
  final String gender;
  
  // Constructor receives the data
  const ResultScreen({
    super.key,
    required this.bmi,      // Required: must be provided
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  });
  
  @override
  Widget build(BuildContext context) {
    // Use the data: bmi, weight, height, etc.
    return Scaffold(...);
  }
}
```

**Step 2 - Pass data when navigating**:
```dart
// In InformationScreen
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ResultScreen(
      bmi: calculatedBMI,        // Provide all required data
      weight: weight,
      height: heightInMeters,
      age: age,
      gender: selectedGender,
    ),
  ),
);
```

**Why this approach**:
- ✅ Type-safe: Compiler checks if all required data is provided
- ✅ Clear: Easy to see what data screen needs
- ✅ Immutable: Data can't be accidentally changed
- ✅ Testable: Easy to create screen with test data

### Platform-Specific Navigation Behavior

**iOS**:
- Slide from right animation
- Swipe from left edge to go back
- Back button shows previous screen's title

**Android**:
- Fade + slide from bottom animation
- Hardware/software back button support
- Up button in AppBar

**MaterialPageRoute handles both automatically!**

## State Management

### Understanding State

**State** = Data that can change over time and affects what's displayed on screen

**Examples in our app**:
- Selected gender (Male or Female)
- Height value (changes as slider moves)
- Weight value (changes with +/- buttons)
- Age value (changes with +/- buttons)
- Unit toggle (Feet or Meters)

### setState()

**Purpose**: Tells Flutter to rebuild the widget with updated data

**Critical Rule**: ALWAYS modify state variables inside setState(), never outside!

**How it works**:
1. You call `setState()` with a callback function
2. Inside the callback, you modify state variables
3. Flutter marks the widget as "dirty" (needs rebuilding)
4. Flutter rebuilds the widget on the next frame
5. UI updates to reflect new state

**Syntax**:
```dart
setState(() {
  // Modify state variables here
  variableName = newValue;
});
```

### Why setState() is Necessary

**❌ WRONG - UI won't update**:
```dart
void incrementWeight() {
  weight++;  // Variable changes but UI stays the same!
}
```

**✅ CORRECT - UI updates**:
```dart
void incrementWeight() {
  setState(() {
    weight++;  // Variable changes AND UI updates
  });
}
```

**What happens without setState()**:
- Variable value changes in memory
- Flutter doesn't know about the change
- UI doesn't rebuild
- Screen shows old value
- User sees no change despite tapping button

**What happens with setState()**:
- Variable value changes
- Flutter is notified
- Widget rebuilds
- Screen shows new value
- User sees immediate feedback

### Complete Examples from Our App

#### Example 1: Gender Selection
```dart
// State variable
String selectedGender = 'Male';

// When Male button is tapped
GestureDetector(
  onTap: () {
    setState(() {
      selectedGender = 'Male';  // Update state
    });
    // After setState, widget rebuilds
    // Male button shows blue background
    // Female button shows white background
  },
  child: Container(
    decoration: BoxDecoration(
      // Background color depends on state
      color: selectedGender == 'Male' 
          ? Color(0xFF4A90E2)  // Blue if selected
          : Colors.white,       // White if not
    ),
    child: Text('Male'),
  ),
)
```

**Flow**:
1. User taps Male button
2. `onTap` callback executes
3. `setState()` changes `selectedGender` to 'Male'
4. Widget rebuilds
5. Container checks `selectedGender == 'Male'` → true
6. Background becomes blue
7. User sees visual feedback

#### Example 2: Height Slider
```dart
// State variable
double heightInMeters = 1.80;

// Slider widget
Slider(
  value: heightInMeters,  // Current value shown
  min: 1.0,
  max: 2.5,
  onChanged: (value) {
    setState(() {
      heightInMeters = value;  // Update as user drags
    });
    // After setState, widget rebuilds
    // Display shows new height value
  },
)

// Display shows current value
Text(
  heightInMeters.toStringAsFixed(2),  // Shows updated value
  style: TextStyle(fontSize: 48),
)
```

**Flow**:
1. User drags slider
2. `onChanged` callback called with new value
3. `setState()` updates `heightInMeters`
4. Widget rebuilds
5. Slider thumb position updates
6. Text widget shows new value
7. User sees smooth, real-time updates

#### Example 3: Weight Increment/Decrement
```dart
// State variable
int weight = 75;

// Plus button
IconButton(
  onPressed: () {
    setState(() {
      weight++;  // Increment weight
    });
    // Widget rebuilds, shows new weight
  },
  icon: Icon(Icons.add),
)

// Minus button
IconButton(
  onPressed: () {
    setState(() {
      if (weight > 1) weight--;  // Decrement but not below 1
    });
    // Widget rebuilds, shows new weight
  },
  icon: Icon(Icons.remove),
)

// Display
Text(
  '$weight',  // Shows current weight
  style: TextStyle(fontSize: 32),
)
```

**Flow**:
1. User taps plus button
2. `setState()` increments weight
3. Widget rebuilds
4. Text shows new weight (76 instead of 75)
5. User sees immediate update

#### Example 4: Unit Toggle (Feet/Meters)
```dart
// State variable
bool isFeet = true;

// Feet button
GestureDetector(
  onTap: () {
    setState(() {
      isFeet = true;  // Switch to feet
    });
    // Widget rebuilds
    // Feet button highlighted
    // Display shows height in feet
  },
  child: Container(
    decoration: BoxDecoration(
      color: isFeet 
          ? Color(0xFFE8F4FD)  // Highlighted
          : Colors.transparent,  // Not highlighted
    ),
    child: Text('Feet'),
  ),
)

// Meters button
GestureDetector(
  onTap: () {
    setState(() {
      isFeet = false;  // Switch to meters
    });
  },
  child: Container(
    decoration: BoxDecoration(
      color: !isFeet 
          ? Color(0xFFE8F4FD)
          : Colors.transparent,
    ),
    child: Text('Meters'),
  ),
)

// Display - changes based on unit
Text(
  isFeet 
      ? getHeightInFeet()       // Show in feet
      : heightInMeters.toStringAsFixed(2),  // Show in meters
)
```

### Multiple State Updates

You can update multiple variables in one setState():
```dart
setState(() {
  weight = 80;
  age = 25;
  selectedGender = 'Female';
  // All update together in one rebuild
});
```

### setState() Best Practices

**DO**:
```dart
✅ setState(() { weight++; })
✅ setState(() { selectedGender = 'Male'; })
✅ setState(() { if (age > 1) age--; })
```

**DON'T**:
```dart
❌ weight++; setState(() {});  // Update outside
❌ setState(() { Navigator.push(...); });  // Navigation inside
❌ setState(() { print('Debug'); });  // Side effects only
```

### When NOT to use setState()

- **In StatelessWidget**: No setState() method available
- **For navigation**: Use Navigator directly, not inside setState
- **For showing dialogs**: Use showDialog directly
- **For one-time actions**: setState is for state changes, not side effects

### State Lifecycle

```
User Interaction
      ↓
   setState()
      ↓
State Variables Updated
      ↓
Widget Marked as Dirty
      ↓
  Build Method Called
      ↓
   New UI Created
      ↓
  Screen Updates
      ↓
User Sees Change
```

### All State Variables in InformationScreen

```dart
class _InformationScreenState extends State<InformationScreen> {
  // All mutable state - can change during app use
  String selectedGender = 'Male';      // Current gender
  bool isFeet = true;                  // Unit preference
  double heightInMeters = 1.80;        // Height value
  int weight = 75;                     // Weight value
  int age = 24;                        // Age value
  
  // These variables can be modified with setState()
  // When they change, the UI rebuilds to show new values
}
```

### Summary

| Concept | Purpose | When to Use |
|---------|---------|-------------|
| **State** | Data that changes | Any value that affects UI |
| **setState()** | Notify Flutter of changes | Every time you modify state |
| **StatefulWidget** | Widget with state | Screens with user interaction |
| **StatelessWidget** | Widget without state | Static screens, display-only |

**Golden Rule**: If it changes and affects the UI, it's state. If it's state, use setState() to change it!

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

