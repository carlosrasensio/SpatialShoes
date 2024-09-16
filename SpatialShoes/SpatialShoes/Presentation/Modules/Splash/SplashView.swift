//
//  SplashView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 16/9/24.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - Private Properties
    
    @State private var isActive: Bool = false

    // MARK: - View

    var body: some View {
        if isActive {
            HomeFactory.make()
        } else {
            VStack {
                Image("splash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 400)
                    .cornerRadius(8)
                    .onTapGesture {
                        withAnimation {
                            isActive = true
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    SplashView()
}
