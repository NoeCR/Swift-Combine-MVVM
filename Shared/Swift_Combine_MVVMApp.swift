//
//  Swift_Combine_MVVMApp.swift
//  Shared
//
//  Created by Noe Cruz Rodriguez on 25/09/2021.
//

import SwiftUI

@main
struct Swift_Combine_MVVMApp: App {
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            // TODO: Add main view
            RootView().environmentObject(rootViewModel)
        }
    }
}
