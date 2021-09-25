//
//  RootViewModel.swift
//  Swift-Combine-MVVM
//
//  Created by Noe Cruz Rodriguez on 25/09/2021.
//

import Foundation
import Combine

class RootViewModel: ObservableObject {
    @Published var status = Status.main
    @Published var isLoading: Bool = false
}
