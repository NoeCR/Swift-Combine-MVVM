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
            case Status.none:
                // TODO Main view
                Text("None...")
            case Status.loading:
                Text("Loading...")
            case Status.loaded:
                // TODO Home
                Text("Home...")
            case Status.error(error: let errorString):
                Text("Error: \(errorString)")
            default:
                Text("Default")
        }
    }
}
