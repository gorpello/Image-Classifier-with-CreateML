//
//  Created by Gianluca Orpello.
//  Copyright © 2025 Unicorn Donkeys. All rights reserved.
//


import SwiftUI

struct CurrencyResultView: View {
    
    let emotion: String
    let accuracy: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Detected Currency: \(emotion)")
                .font(.title2)
                .padding(.bottom)
            Text("Accuracy: \(accuracy)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

#Preview {
    CurrencyResultView(emotion: "US Dollars", accuracy: "100%")
}
