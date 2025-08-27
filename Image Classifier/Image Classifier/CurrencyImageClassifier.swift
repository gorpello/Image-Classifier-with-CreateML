//
//  Created by Gianluca Orpello.
//  Copyright © 2025 Unicorn Donkeys. All rights reserved.
//


import SwiftUI
import Vision
import CoreML

class CurrencyImageClassifier {
    
    private let model: VNCoreMLModel
    
    init() {
        // 1. Load the Core ML model
        let configuration = MLModelConfiguration()
        guard let mlModel = try? CurrencyClassifier(configuration: configuration).model else {
            fatalError("Failed to load model")
        }
        self.model = try! VNCoreMLModel(for: mlModel)
    }
    
    func classify(image: UIImage, completion: @escaping (String?, Float?) -> Void) {
        // 2. Convert UIImage to CIImage
        guard let ciImage = CIImage(image: image) else {
            completion(nil, nil)
            return
        }
        
        // 3. Create a VNCoreMLRequest with the model
        let request = VNCoreMLRequest(model: model) { request, error in
            if let error = error {
                print("Error during classification: \(error.localizedDescription)")
                completion(nil, nil)
                return
            }
            
            // 4. Handle the classification results
            guard let results = request.results as? [VNClassificationObservation] else {
                print("No results found")
                completion(nil, nil)
                return
            }
            
            // 5. Find the top result based on confidence
            let topResult = results.max(by: { a, b in a.confidence < b.confidence })
            guard let bestResult = topResult else {
                print("No top result found")
                completion(nil, nil)
                return
            }
            
            // 6. Pass the top result to the completion handler
            completion(bestResult.identifier, bestResult.confidence)
        }
        
        // 7. Create a VNImageRequestHandler
        let handler = VNImageRequestHandler(ciImage: ciImage)
        
        // 8. Perform the request on a background thread
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                try handler.perform([request])
            } catch {
                print("Failed to perform classification: \(error.localizedDescription)")
                completion(nil, nil)
            }
        }
    }
}

