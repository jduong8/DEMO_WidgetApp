//
//  NetworkingError.swift
//  DEMO_WidgetApp
//
//  Created by Jonathan Duong on 23/11/2023.
//

import Foundation

extension DataParser {
    public enum APIError: Error {
        case invalidPath
        case decoding
    }
}
