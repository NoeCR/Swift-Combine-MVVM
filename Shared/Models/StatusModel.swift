//
//  StatusModel.swift
//  Swift-Combine-MVVM
//
//  Created by Noe Cruz Rodriguez on 25/09/2021.
//

import Foundation

enum Status {
    case main, loading, loaded, error(error:String)
}
