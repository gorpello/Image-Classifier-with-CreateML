//
//  Created by Gianluca Orpello.
//  Copyright © 2025 Unicorn Donkeys. All rights reserved.
//


import SwiftUI
import Combine

class CurrencyDetectionViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var currency: String?
    @Published var accuracy: String?
    
    private let classifier = CurrencyImageClassifier()
    
    func classifyImage() {
        if let image = self.image {
            // Resize the image before classification
            let resizedImage = resizeImage(image)
            DispatchQueue.global(qos: .userInteractive).async {
                self.classifier.classify(image: resizedImage ?? image) { [weak self] currency, confidence in
                    // Update the published properties on the main thread
                    DispatchQueue.main.async {
                        self?.currency = currency ?? "Unknown"
                        self?.accuracy = String(format: "%.2f%%", (confidence ?? 0) * 100.0)
                    }
                }
            }
        }
    }
    
    func reset() {
        DispatchQueue.main.async {
            self.image = nil
            self.currency = nil
            self.accuracy = nil
        }
    }
    
    private func resizeImage(_ image: UIImage) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: 224, height: 224))
        image.draw(in: CGRect(x: 0, y: 0, width: 224, height: 224))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

