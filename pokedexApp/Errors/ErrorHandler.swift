//
//  ErrorHandler.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/9/21.
//

import Foundation


enum ErrorHandler: Error, LocalizedError {
    case invalidUrl
    case errorCatch
    case unknown
    
    
    var messageError: String{
        switch self {
        case .invalidUrl:
            return NSLocalizedString("Invalid URL", comment: "")
        case .errorCatch:
            return NSLocalizedString("Failed to catch pokemons", comment: "")
        case .unknown:
            return NSLocalizedString("Unknow", comment: "")
        }
    }
    
}


struct ErrorMessage: Identifiable{
    let id = UUID()
    let message: ErrorHandler
}
