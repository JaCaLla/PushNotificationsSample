
# MVVM-C iOS Sample tampalte
This repository contains a sample MVVM-C template for SwiftUI. 

This repository serves as the foundational code for the accompanying blog post.[The MVVM-C Blueprint for iOS Apps](https://javios.eu/swift/harnessing-nfc-technology-in-your-ios-app/) 

# Navigation flows
- First Tab Flow
```mermaid
graph TD;
    A[Tab1Flow] --> B1[Secondary View 1];
    A[Tab1Flow] --> B2[Secondary View 2];
    B1 --> C[Tertiany View];
    C --> A;
```
- Second Tab Flow
```mermaid
graph TD;
    A[Tab2Flow] --> B[Secondary View];
    B --> C[Modal View];
```


## 🎥 Demo Video

### Check out the app in action!  
![CombineAPIRrest Sample App review](media/review.gif)  

## Requirements

- **Xcode 15.0 or later**
- **iOS 16.0 or later**
- **Swift 6.0**

