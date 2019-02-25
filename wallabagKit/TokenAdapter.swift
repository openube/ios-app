//
//  TokenAdapter.swift
//  wallabagKit
//

import Foundation
import Alamofire

class TokenAdapter: RequestAdapter {
    let accessToken: String

    init(accessToken: String) {
        self.accessToken = accessToken
    }

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}
