//
//  WallabagKitCollectionResponse.swift
//  wallabagKit
//

import Foundation

public enum WallabagKitCollectionResponse<T: Decodable> {
    case success(WallabagKitCollection<T>)
    case error(Error)
}
