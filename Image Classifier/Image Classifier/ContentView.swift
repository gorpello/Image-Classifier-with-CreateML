//
//  Created by Gianluca Orpello.
//  Copyright © 2025 Unicorn Donkeys. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = CurrencyDetectionViewModel()
    
    @State private var isShowingImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showSourceTypeActionSheet = false
    
    var body: some View {
        VStack(spacing: 20) {
            ImageDisplayView(image: $viewModel.image, showSourceTypeActionSheet: $showSourceTypeActionSheet)
            
            if let emotion = viewModel.currency, let accuracy = viewModel.accuracy {
                CurrencyResultView(emotion: emotion, accuracy: accuracy)
            }
            
            ActionButtonsView(image: $viewModel.image, classifyImage: viewModel.classifyImage, reset: viewModel.reset)
        }
        .navigationTitle("Currency Detection")
        .actionSheet(isPresented: $showSourceTypeActionSheet) {
            ActionSheet(title: Text("Select Image Source"), message: nil, buttons: [
                .default(Text("Camera")) {
                    self.sourceType = .camera
                    self.isShowingImagePicker = true
                },
                .default(Text("Photo Library")) {
                    self.sourceType = .photoLibrary
                    self.isShowingImagePicker = true
                },
                .cancel()
            ])
        }
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(image: self.$viewModel.image, sourceType: self.$sourceType)
        }
    }
}

#Preview {
    ContentView()
}
