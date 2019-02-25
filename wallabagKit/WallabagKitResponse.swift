//
//  WallabagKitResponse.swift
//  wallabagKit
//

import Foundation

public enum WallabagKitResponse<T: Decodable> {
    case success(T)
    case error(Error)
}
