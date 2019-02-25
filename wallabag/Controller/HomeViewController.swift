//
//  HomeViewController.swift
//  wallabag
//

import UIKit
import WallabagCommon

final class HomeViewController: UIViewController {

    let setting = WallabagSetting()

    @IBAction func authError(segue: UIStoryboardSegue) {
        setting.set(false, for: .wallabagIsConfigured)
    }

    override func viewDidLoad() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.resetApp))
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
