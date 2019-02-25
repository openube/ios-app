//
//  Black.swift
//  wallabag
//

import UIKit

class Black: ThemeProtocol {
    var name: String = "black"
    var color: UIColor = UIColor.init(red: 100.rgb, green: 100.rgb, blue: 100.rgb, alpha: 1)
    var tintColor: UIColor = UIColor.init(red: 100.rgb, green: 100.rgb, blue: 100.rgb, alpha: 1)
    var barStyle: UIBarStyle = .black
    var backgroundColor: UIColor = UIColor.init(red: 0.rgb, green: 0.rgb, blue: 0.rgb, alpha: 1)
    var navigationBarBackground: UIImage? = #imageLiteral(resourceName: "navBackgroundNight")
    var backgroundSelectedColor: UIColor = UIColor.init(red: 10.rgb, green: 10.rgb, blue: 10.rgb, alpha: 1)
}
