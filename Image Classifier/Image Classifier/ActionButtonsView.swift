//
//  Created by Gianluca Orpello.
//  Copyright © 2025 Unicorn Donkeys. All rights reserved.
//


import SwiftUI

struct ActionButtonsView: View {
    
    @Binding var image: UIImage?
    
    var classifyImage: () -> Void
    var reset: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            if image != nil {
                Button(action: classifyImage) {
                    Text("Detect Currency")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Button(action: reset) {
                    Text("Upload Another Image")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ActionButtonsView(
        image: .constant(UIImage(systemName: "photo")),
        classifyImage: {},
        reset: {}
    )
}
