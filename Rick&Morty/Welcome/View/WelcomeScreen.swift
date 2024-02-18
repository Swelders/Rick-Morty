//
//  WelcomeScreen.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 18/02/2024.
//

import SwiftUI

struct WelcomeScreen: View {
    @ObservedObject var viewModel:WelcomeScreenViewModel
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .opacity(0.7)
            VStack {
                VStack {
                    Text(viewModel.welcomeTitle)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    Text(viewModel.subtitle)
                        .font(.title3)
                        .foregroundColor(.white)
                    Spacer()
                    Text(viewModel.instructions)
                        .multilineTextAlignment(.center)
                }
                NavigationLink(destination: CharacterListView(viewModel:viewModel.characterListViewModel())) {
                    Text("next")
                        .frame(width: 200)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .font(.title2)
                        .cornerRadius(15)
                }
            }
        }
    }
}

