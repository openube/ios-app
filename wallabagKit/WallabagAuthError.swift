//
//  WallabagAuthError.swift
//  wallabagKit
//

import Foundation

public struct WallabagAuthError: Codable {
    public let error: String
    public let description: String
    enum CodingKeys: String, CodingKey {
        case error
        case description = "error_description"
    }
}
