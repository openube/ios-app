//
//  String.swift
//  wallabag
//

import Foundation

extension String {
    var date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

        return dateFormatter.date(from: self)
    }

    var ucFirst: String {
        let first = String(self.prefix(1))

        return first.uppercased() + String(self.dropFirst())
    }

    var lcFirst: String {
        let first = String(self.prefix(1))

        return first.lowercased() + String(self.dropFirst())
    }

    var withoutHTML: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
