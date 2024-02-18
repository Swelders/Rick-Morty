//
//  EpisodeView.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import SwiftUI

struct EpisodeCellView: View {
    @ObservedObject var viewModel: EpisodeCellViewModel
    
    var body: some View {
        Text(viewModel.episodeName)
            .padding()
    }
}
