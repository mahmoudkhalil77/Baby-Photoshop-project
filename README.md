# 🎨 Baby Photoshop — GYYM Studio

[![C++17](https://img.shields.io/badge/C%2B%2B-17-00599C?style=for-the-badge&logo=c%2B%2B&logoColor=white)](https://en.cppreference.com/w/cpp/17)
[![Qt](https://img.shields.io/badge/Qt-5%20%7C%206-41CD52?style=for-the-badge&logo=qt&logoColor=white)](https://www.qt.io/)
[![CMake](https://img.shields.io/badge/CMake-3.16+-064F8C?style=for-the-badge&logo=cmake&logoColor=white)](https://cmake.org/)
[![Platform](https://img.shields.io/badge/Platform-macOS%20%7C%20Linux%20%7C%20Windows-lightgrey?style=for-the-badge)](https://github.com)
[![Academic](https://img.shields.io/badge/Faculty-FCAI%20Cairo%20University-blue?style=for-the-badge)](http://fci.cu.edu.eg/)

> **A powerful, modern desktop & CLI image processing studio built with C++17, Qt, and pure algorithmic pixel manipulation.**
> 
> Developed as part of the **Object-Oriented Programming (OOP)** course at the **Faculty of Computers and Artificial Intelligence, Cairo University (FCAI-CU)**.

---

## 🌟 Overview

**Baby Photoshop (GYYM Studio)** is a comprehensive image editing suite offering both an intuitive **Modern Dark GUI (Qt)** and a robust **Command-Line Interface (CLI)**. Engineered with clean Object-Oriented Architecture, it demonstrates advanced design patterns (Strategy, Registry, Service Layer, MVC/Layered Architecture) alongside high-performance pixel-level transformations with **no heavy external image libraries** (powered by lightweight `stb_image`).

---

## ✨ Key Features

### 🖥️ 1. Modern Desktop GUI (GYYM Studio)
* **Sleek Dark Theme:** Curated dark UI designed for creators with responsive panels and intuitive controls.
* **Real-time Live Preview:** Interactive sliders for adjustments (Brightness, Contrast, Saturation, Hue, Free Rotate) with dynamic preview before committing.
* **Undo / Redo History:** Multi-level history stack to freely step backwards and forwards through operations.
* **Layer & Sticker System:** Add image stickers/overlays with center rotation, scaling, z-order reordering (Move Up / Down), and individual layer filtering.
* **Precision Region Filtering:** Apply filters exclusively to specific areas using **Rectangle**, **Ellipse**, or **Magic Wand** selection tools (supports inside/outside masking).
* **Interactive Free Crop:** Visual crop bounding box tool with draggable anchors.
* **Asset Explorer:** Quick file browsing panel with drag-and-drop workspace support.
* **Smooth Zoom & Pan:** Viewport controls supporting fine-grained zooming and canvas translation.

### 💻 2. Command-Line Interface (CLI)
* Interactive console menu supporting all 21 core image transformations.
* Automatic preview popup via native system viewers (`open` on macOS, `ShellExecute` on Windows, `xdg-open` on Linux).
* Lightweight, single-binary compilation with zero heavy dependencies.

---

## 🛠️ Complete Filters & Processing Tools (21 Algorithms)

| # | Filter / Tool | Category | Description |
|---|---|---|---|
| **1** | **Black & White** | Filter | Converts image to binary black & white using luminance thresholding. |
| **2** | **Grayscale** | Filter | Standard ITU-R BT.601 / BT.709 perceptual luma grayscale conversion. |
| **3** | **Invert Colors** | Filter | Negative color inversion ($255 - pixel$). |
| **4** | **Brightness** | Adjustment | Dynamically lightens or darkens pixel values with clamping. |
| **5** | **Contrast** | Adjustment | Enhances or diminishes dynamic range and tonal separation. |
| **6** | **Saturation** | Adjustment | Modulates color vibrancy using RGB $\leftrightarrow$ HSV color space conversions. |
| **7** | **Hue** | Adjustment | Shifts color spectrum around the HSV color wheel. |
| **8** | **Blur** | Effect | Spatial averaging / box-blur convolution kernel. |
| **9** | **Detect Edges** | Effect | Sobel/gradient edge detection highlighting high-frequency boundaries. |
| **10** | **TV Scanlines** | Effect | Retro CRT monitor aesthetic with alternating scanline attenuation. |
| **11** | **Infrared** | Effect | High-contrast thermal infrared filter emphasizing whites and deep reds. |
| **12** | **Purple Tone (Wano Purple)** | Effect | Cinematic anime-inspired aesthetic grading in violet-purple palettes. |
| **13** | **Warm Tone (Wanw)** | Effect | Golden-hour sunlight warmth filter enhancing red/amber channels. |
| **14** | **Oil Painting** | Effect | Kuwahara artistic filter computing local quadrant intensity variance. |
| **15** | **Rotate (90° / 180° / 270° / Free)** | Tool | Orthogonal matrix transpose rotations and arbitrary angle rotation. |
| **16** | **Flip (Horizontal / Vertical)** | Tool | Mirror reflections across the horizontal or vertical axes. |
| **17** | **Crop (Fixed & Free)** | Tool | Crops image to user-defined region coordinates $(x, y, w, h)$. |
| **18** | **Resize** | Tool | Scales dimensions using bilinear interpolation / nearest-neighbor mapping. |
| **19** | **Merge / Blend** | Tool | Blends two loaded images together with dimension handling. |
| **20** | **Border / Frame** | Effect | Adds customizable single, double, or ornate frame borders. |
| **21** | **Skew** | Tool | Affine shear transformation along horizontal or vertical axes. |

---

## 🏗️ Software Architecture & Design Patterns

The codebase strictly adheres to clean OOP principles and separation of concerns:

```
TeamWork/
├── Application/                   # Core business logic & image engine (Backend)
│   ├── ApplicationLayer/          # High-level controllers (ImageAppController)
│   ├── ImageProcessing/
│   │   ├── Filters/               # Concrete filter implementations (21 filters)
│   │   ├── ImageFilter.h/.cpp     # Filter base utilities
│   ├── Infrastructure/            # File I/O, helpers, system utilities
│   ├── Interfaces/                # Pure abstract contracts (IImageFilter.h)
│   └── Models/                    # Image entity class, stb_image, stb_image_write
│
├── PresentationLayer/             # Modern Qt GUI application (Frontend)
│   ├── mainwindow.h/.cpp          # Main workspace window & UI orchestrator
│   ├── FilterRegistry.h           # Registry pattern for extensible filter metadata
│   ├── ImageEditorService.h/.cpp  # Bridge service connecting GUI to backend algorithms
│   ├── SelectionTool.h/.cpp       # Rectangle, Ellipse, Magic Wand ROI masking
│   ├── StickerItem.h/.cpp         # Layer item with transformation anchors & Z-order
│   ├── ImageViewWidget.h/.cpp     # Interactive graphics canvas (Zoom, Pan, Crop)
│   ├── ThemeManager.h/.cpp        # Persistent dark theme styling
│   └── CMakeLists.txt             # Qt build configuration
│
├── PresentationCLILayer/          # Interactive CLI terminal interface
│   └── Image_Filter_Implementation.cpp
│
├── build.sh                       # Unified macOS/Linux build script (GUI + CLI)
├── run_gui.sh                     # Launch Qt GUI application
└── build.ps1                      # Windows PowerShell build script
```

### Applied Design Patterns:
* **Strategy Pattern:** Every filter implements `IImageFilter::apply(Image& image)`, allowing dynamic, interchangeable algorithm execution.
* **Registry Pattern (`FilterRegistry`):** Filters are registered once dynamically with metadata (name, category, badge color). Adding a new filter requires **zero changes** to UI layout code.
* **Service Layer (`ImageEditorService`):** Mediates between presentation widgets and core image transformations, maintaining undo/redo stacks.
* **Open/Closed Principle:** New filters can be added seamlessly by implementing `IImageFilter` without modifying existing filters.

---

## 🖼️ Supported Image Formats

Powered by `stb_image` and `stb_image_write`:
* **PNG** (`.png`) — with full 32-bit RGBA channel support
* **JPEG / JPG** (`.jpg`, `.jpeg`)
* **Bitmap** (`.bmp`)
* **Truevision TGA** (`.tga`)

---

## 🚀 Getting Started

### 📋 Prerequisites

| Tool | Recommended Version | Note |
|---|---|---|
| **C++ Compiler** | Clang 14+ / GCC 10+ / MSVC 2019+ | Must support **C++17** |
| **CMake** | 3.16 or higher | For building Qt GUI |
| **Qt** | Qt 6 or Qt 5 | Required components: `Widgets` |

#### Installing Qt:
* **macOS (Homebrew):**
  ```bash
  brew install qt cmake
  ```
* **Ubuntu / Debian:**
  ```bash
  sudo apt-get update
  sudo apt-get install -y build-essential cmake qt6-base-dev qt6-tools-dev
  # Or Qt 5:
  # sudo apt-get install -y qtbase5-dev qttools5-dev-tools
  ```
* **Windows:**
  Install Qt via the official [Qt Online Installer](https://www.qt.io/download) or `vcpkg install qtbase`.

---

### 🔨 Building & Running

#### 🍎 macOS & 🐧 Linux

1. **Clone the repository:**
   ```bash
   git clone git@github.com:mahmoudkhalil77/Baby-Photoshop-project.git
   cd Baby-Photoshop-project
   ```

2. **One-Command Build (Builds both GUI and CLI):**
   ```bash
   chmod +x build.sh run_gui.sh
   ./build.sh
   ```

3. **Run the GUI:**
   ```bash
   ./run_gui.sh
   # Or directly:
   # open PresentationLayer/build/PresentationLayer.app   (on macOS)
   # ./PresentationLayer/build/PresentationLayer          (on Linux)
   ```

4. **Run the CLI:**
   ```bash
   ./ImageFilterCLI
   ```

---

#### 🪟 Windows

1. **Building CLI via PowerShell (MinGW):**
   ```powershell
   .\build.ps1
   .\ImageFilter.exe
   ```

2. **Building Qt GUI via CMake:**
   ```powershell
   cmake -B PresentationLayer/build -S PresentationLayer
   cmake --build PresentationLayer/build --config Release
   .\PresentationLayer\build\Release\PresentationLayer.exe
   ```
   *(Or open `PresentationLayer/CMakeLists.txt` directly in **Qt Creator** or **Visual Studio** and click Run).*

---

## 👥 Authors & Academic Credits

* **Faculty:** Faculty of Computers and Artificial Intelligence, Cairo University (FCAI-CU)
* **Course:** Object-Oriented Programming (CS213 / OOP)
* **Under the Supervision of:** Dr. Mohamed El-Ramly
* **Team Members / Contributors:**
  * **Mahmoud Khalil** ([@mahmoudkhalil77](https://github.com/mahmoudkhalil77))
  * **Mohamed Mahmoud Khalifa**
  * **Shehab Diab**
  * **Youssef Mohamed**
  * **Nada Ahmed**

---

## 📄 License

This project is created for educational and academic purposes under FCAI Cairo University guidelines.
Third-party libraries used:
* [stb](https://github.com/nothings/stb) by Sean Barrett (Public Domain / MIT license).
