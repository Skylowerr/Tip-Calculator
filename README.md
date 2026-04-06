# Tip Calculator 💰

A SwiftUI tip calculator app with **multi-device adaptive layout**, **localization support**, and animated background visuals. Built to practice responsive design across iPhone and iPad, size classes, and app internationalization.

---

## 📁 Project Structure

```
Tip Calculator/
├── Models/
│   └── TipModel.swift                    # Tip calculation logic & data model
├── Views/
│   ├── Background/
│   │   ├── BackgroundView.swift          # Main animated background container
│   │   ├── SinePathView.swift            # Sine wave path shape
│   │   └── SineWaveView.swift            # Animated sine wave view
│   ├── Choose Tip View/
│   │   ├── ChooseTipView.swift           # Tip percentage selector screen
│   │   ├── CustomTipView.swift           # Custom tip % input field
│   │   ├── SelectButtonView.swift        # Tip option button component
│   │   └── TipPercentage.swift           # Enum for tip percentage options
│   ├── Enter Total View/
│   │   └── EnterTotalView.swift          # Bill amount input screen
│   ├── Payment Summary View/
│   │   ├── PaymentSummaryView.swift      # Final payment breakdown screen
│   │   └── SubTotalView.swift            # Subtotal row component
│   ├── Tip Calculator View/
│   │   ├── LandscapeTipCalculatorView.swift  # Landscape layout
│   │   ├── SplitView.swift               # Number of people splitter
│   │   ├── TipCalculatorView.swift       # Main calculator container view
│   │   └── TitleView.swift               # App title component
│   ├── Test Colors View/                 # Color palette testing view
│   └── Test Localization View/           # Localization testing view
├── Localizable/                          # Localization string files
├── MainView.swift                        # App root view
├── Assets.xcassets                       # Colors, icons, images
└── Tip_CalculatorApp.swift               # App entry point
```

---

## 🏗️ Architecture

| Layer | Files | Responsibility |
|-------|-------|----------------|
| **Model** | `TipModel`, `TipPercentage` | Calculation logic, tip % enum |
| **View** | All view files | UI rendering, screen decomposition |
| **Adaptive Layout** | `ChooseTipView`, `LandscapeTipCalculatorView` | Device & orientation detection |

---

## 📱 Multi-Device Adaptive Layout

The app detects device type and orientation using SwiftUI **size classes** and adapts its layout accordingly:

```swift
@Environment(\.horizontalSizeClass) var horizontalSizeClass
@Environment(\.verticalSizeClass) var verticalSizeClass

var isIPad: Bool {
    horizontalSizeClass == .regular && verticalSizeClass == .compact
}

var isPortraitPhone: Bool {
    horizontalSizeClass == .compact && verticalSizeClass == .regular
}
```

| Device / Orientation | Layout |
|----------------------|--------|
| iPhone Portrait | Standard vertical layout |
| iPhone Landscape | `LandscapeTipCalculatorView` |
| iPad | Larger fonts, increased button spacing |

---

## 🌍 Localization

The app supports **multiple languages** via `Localizable` string files:

- All user-facing strings are externalized for easy translation
- A dedicated `Test Localization View` was built to verify string rendering across languages
- Fonts and layout adapt to different text lengths

---

## 🌊 Animated Background

A custom animated sine wave background built from scratch using SwiftUI:

| Component | Description |
|-----------|-------------|
| `SinePathView` | Draws a sine wave as a SwiftUI `Shape` using `CGPath` |
| `SineWaveView` | Animates the sine wave with a phase offset |
| `BackgroundView` | Composes multiple wave layers for a layered visual effect |

---

## 📊 App Flow

```
MainView
  └── TipCalculatorView
        ├── EnterTotalView       → User enters bill amount
        ├── ChooseTipView        → User selects tip % (or custom)
        │     └── CustomTipView  → Manual % input
        ├── SplitView            → Number of people
        └── PaymentSummaryView   → Final breakdown per person
```

---

## 📚 What I Learned

- 📐 **Size classes** — detecting iPad vs iPhone and portrait vs landscape with `horizontalSizeClass` / `verticalSizeClass`
- 🔄 **Adaptive layouts** — building separate landscape and iPad-optimized views
- 🌍 **Localization** — externalizing strings with `Localizable.strings` for multi-language support
- 🌊 **Custom animations** — drawing and animating a sine wave using `Shape` and `CGPath`
- 🎨 **Design testing** — using dedicated `Test Colors View` and `Test Localization View` during development
- 🔢 **Enum-driven UI** — using `TipPercentage` enum to drive tip selection buttons cleanly

---

## 🚀 Getting Started

### Requirements

- Xcode 15+
- iOS 17+ / iPadOS 17+
- Swift 5.9+

### Run

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/TipCalculator.git
   ```
2. Open `Tip Calculator.xcodeproj` in Xcode.
3. Select any simulator — iPhone or iPad — and press **Run** (`⌘R`).

> No API keys or external dependencies required.

---

## 👤 Author

**Emirhan Gökçe**
