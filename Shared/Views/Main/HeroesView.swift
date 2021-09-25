//
//  HeroesView.swift
//  Swift-Combine-MVVM
//
//  Created by Noe Cruz Rodriguez on 25/09/2021.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var viewModel: HeroesViewModel

    var body: some View {
        // TODO: wrap in Navigation Link
        List {
            if let heroes = viewModel.marvelHeroes?.data.heroes {
                ForEach(heroes) { data in
                    // NavigationLink(destination: Text("\(data.name)"), label: Text("\(data.name)"))
                }
            }
            else {
                print("The Heroes collection could not be accessed")
            }
        }
    }
}

struct HeroesView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesView(viewModel: HeroesViewModel(testing: true))
    }
}
