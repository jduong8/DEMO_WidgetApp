//
//  NetworkingError.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 23/11/2023.
//

import Foundation

enum APIError: Error {
    case invalidPath
    case decoding
}

extension APIError {
    var localizedDescription: String {
        switch self {
        case .invalidPath:
            return "Invalid path"
        case .decoding:
           return  "There was an error decoding the type"
        }
    }
}
