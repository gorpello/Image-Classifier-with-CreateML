# Image Classifier

**Image Classifier** is a SwiftUI application that integrates a custom image classification model trained using **Create ML**. Depending on your chosen use case, the app can identify pet breeds, detect plant diseases, or recognize different currencies directly from images.  

In my implementation I chose: 💵 **Currency Recognition**

## The Purpose

Learn how to build, train, and integrate a Core ML model into a SwiftUI app. This project will give you hands-on experience with machine learning workflows, Core ML integration, and user interaction with classification results.  

## Features

- Train an image classification model in **Create ML**.  
- Achieve at least **80% accuracy** with proper training and testing datasets.  
- Export the final `.mlmodel` file and embed it in your SwiftUI project.  
- Import images into the app and classify them in real time.  
- Display classification results directly in the user interface.  

## Exercise

Your task is to create a new iOS project that uses a **custom image classification model** trained with Create ML.  

You must choose **one** of the following use cases:  
- 🐶 Pet Breed Identification  
- 🌱 Plant Disease Detection  
- 💵 Currency Recognition  

This will require you to:  
- Train and test your dataset in Create ML, ensuring accuracy > 80%.  
- Export and integrate the Core ML model into your SwiftUI project.  
- Build a SwiftUI interface that loads an image and displays the predicted classification.  

### Requirements

- The project type is a SwiftUI application with at least one main `View` and shall run on the simulator.  
- The app shall let the user import an image (from the photo library or camera) and display it prominently.  
- The project shall use your custom Core ML model to classify the image and show the result clearly in the UI.  
- The app shall run without crashing.  

*Note: If your app requires a physical device (e.g., camera input), you must highlight this in the README or provide a runtime check and message to the user.*  

### For extra credit:  
- Add **enhanced features** such as confidence levels, multiple predictions, or improved UI.  
- Use a **ShareLink** to let users share results.  
- Record **extra video clips** demonstrating additional functionality.  

## How to Use

1. **Run the app** in Xcode on a supported Apple platform (macOS or iOS*).  
2. **Import an image** into the app (camera or photo library).  
3. Tap **Classify Image**.  
4. View the classification result displayed in the UI.  

## Requirements

- Xcode 15 or newer  
- Swift 5.9 or newer  
- SwiftUI  
- Core ML framework  
- Create ML (for training your model)  
- iOS 17+ or macOS 14+ (depending on your deployment target)  

## Getting Started

1. Train your image classifier in **Create ML**.  
2. Export the `.mlmodel` file.  
3. Add the model to your Xcode project.  
4. Build the SwiftUI app that uses the model for image classification.  
5. Run the app on a simulator or device.  

## Credits

Created by Gianluca Orpello.  
Uses Apple's **Core ML** and **Create ML** frameworks.  

## License

MIT License. See [LICENSE](LICENSE) for details.  

---

*Make sure to grant the app access to your Photos library or Camera when prompted.*  
