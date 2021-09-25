//
//  RootView.swift
//  Swift-Combine-MVVM
//
//  Created by Noe Cruz Rodriguez on 25/09/2021.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch rootViewModel.status {
            case Status.main:
                HeroesView(viewModel: HeroesViewModel())
            case Status.loading:
                Text("Loading...")
            case Status.loaded:
                Text("Loaded...")
            case Status.error(error: let errorString):
                Text("Error: \(errorString)")
            default:
                Text("Default")
        }
    }
}
