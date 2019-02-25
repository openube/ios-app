//
//  WallabagAuth.swift
//  wallabagKit
//

import Foundation

public enum WallabagAuth {
    case success(WallabagAuthSuccess)
    case error(WallabagAuthError)
    case invalidParameter
    case unexpectedError
}
