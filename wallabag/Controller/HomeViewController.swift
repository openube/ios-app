//
//  HomeViewController.swift
//  wallabag
//
//  Created by maxime marinel on 24/10/2016.
//  Copyright © 2016 maxime marinel. All rights reserved.
//

import UIKit
import WallabagCommon

final class HomeViewController: UIViewController {
    var analytics: AnalyticsManager!
    var setting: WallabagSetting!

    @IBAction func authError(segue _: UIStoryboardSegue) {
        setting.set(false, for: .wallabagIsConfigured)
    }

    override func viewDidLoad() {
        analytics.sendScreenViewed(.homeView)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(resetApp))
        gesture.numberOfTapsRequired = 10
        view.addGestureRecognizer(gesture)
    }

    @objc func resetApp() {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            let alert = UIAlertController(title: "Resetting App", message: "App reset", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))

            present(alert, animated: true, completion: nil)
            delegate.resetApplication()
        }
    }
}
