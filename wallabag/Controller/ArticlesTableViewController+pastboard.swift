//
//  ArticlesTableViewController+pastboard.swift
//  wallabag
//

import Foundation
import wallabagCommon

extension ArticlesTableViewController {
    @objc func pasteBoardAction() {
        guard let pasteBoardUrl = UIPasteboard.general.url,
            pasteBoardUrl.absoluteString != setting.get(for: .previousPasteBoardUrl) else {
                return
        }
        setting.set(pasteBoardUrl.absoluteString, for: .previousPasteBoardUrl)

        let alertController = UIAlertController(title: "PasteBoard", message: pasteBoardUrl.absoluteString, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Add", style: .default) { _ in
            WallabagSession.shared.add(pasteBoardUrl)
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        present(alertController, animated: true)
    }
}
