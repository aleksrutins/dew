//
//  Gateway.swift
//  Dew
//
//  Created by Aleks Rutins on 03/07/2022.
//

import Foundation

enum GatewayError: Error {
    case invalidURL
}

class Gateway : ObservableObject {
    let url = URL(string: "https://dev.to/api/")!
    func sendRequest<R: Codable>(path: String) async throws -> R {
        guard let fullURL = URL(string: path, relativeTo: url) else {
            throw GatewayError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: fullURL)
        
        return try JSONDecoder().decode(R.self, from: data)
    }
}
