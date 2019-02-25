//
//  AboutViewController.swift
//  wallabag
//

import UIKit

final class AboutViewController: UIViewController {

    @IBOutlet weak var versionText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ThemeManager.manager.getBackgroundColor()

        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? "0"
        let build = Bundle.main.infoDictionary!["CFBundleVersion"] as? String ?? "0"

        versionText.text = String(format: "Version %@ build %@".localized, arguments: [version, build])
    }
}
