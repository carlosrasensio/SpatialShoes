//
//  SplashView.swift
//  SpatialShoes
//
//  Created by Carlos Rodriguez Asensio on 16/9/24.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - Private Properties
    
    @Environment(HomeViewModel.self) private var homeViewModel
    @State private var isActive: Bool = false

    // MARK: - View

    var body: some View {
        if isActive {
            HomeView()
                .environment(homeViewModel)
        } else {
            VStack {
                Image(Constants.splashImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600, height: 400)
                    .cornerRadius(10)
                    .onTapGesture {
                        withAnimation {
                            isActive = true
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

// MARK: - Constants

private extension SplashView {
    enum Constants {
        static let splashImage = "splash"
    }
}
