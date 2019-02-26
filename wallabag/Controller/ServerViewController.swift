//
//  ServerViewController.swift
//  wallabag
//

import UIKit
import wallabagCommon
import wallabagKit

final class ServerViewController: UIViewController {

    let setting = WallabagSetting()

    @IBOutlet weak var server: UITextField!

    override func viewDidLoad() {
        server.text = setting.get(for: .host)
    }

    @IBAction func nextPressed(_ sender: UIButton) {
        defer {
            sender.isEnabled = true
        }
        sender.isEnabled = false
        self.setting.set(self.server.text!, for: .host)
        validateServer(string: server.text!) { [unowned self] isValid, _ in
            if isValid {
                self.performSegue(withIdentifier: "toClientId", sender: nil)
            } else {
                let alertController = UIAlertController(
                    title: "Error".localized,
                    message: "Whoops looks like something went wrong. Check the url, don't forget http or https".localized,
                    preferredStyle: .alert
                )
                alertController.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }

    private func validateServer(string: String, completion: @escaping (Bool, WallabagVersion?) -> Void ) {
        do {
            let regex = try NSRegularExpression(pattern: "(http|https)://", options: [])
            guard let url = URL(string: string),
                UIApplication.shared.canOpenURL(url),
                1 == regex.matches(in: string, options: [], range: NSRange(location: 0, length: string.count)).count else {
                    completion(false, nil)
                    return
            }
            WallabagKit.getVersion(from: string) { version in
                completion(version.supportedVersion != .unsupported, version)
            }
        } catch {
            completion(false, nil)
        }
    }
}
