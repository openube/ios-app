//
//  Int.swift
//  wallabag
//

import UIKit

extension Int {
    var readingTime: String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(self * 60))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "mm:ss"

        return dayTimePeriodFormatter.string(from: date as Date)
    }

    var rgb: CGFloat {
        return CGFloat(self) / 255.0
    }
}
