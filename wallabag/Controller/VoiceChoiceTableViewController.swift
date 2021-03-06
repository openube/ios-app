//
//  VoiceChoiceTableViewController.swift
//  wallabag
//
//  Created by maxime marinel on 24/07/2017.
//  Copyright © 2017 maxime marinel. All rights reserved.
//

import AVFoundation
import UIKit
import WallabagCommon

final class VoiceChoiceTableViewController: UITableViewController {
    var setting: WallabagSetting!
    var analytics: AnalyticsManager!
    let voices: [AVSpeechSynthesisVoice] = AVSpeechSynthesisVoice.speechVoices()

    override func viewDidLoad() {
        analytics.sendScreenViewed(.voiceChoiseView)
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return voices.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let voice: AVSpeechSynthesisVoice = voices[indexPath.row]

        cell.textLabel?.text = "\(voice.name) (\(voice.language))"

        if voice.identifier == setting.getSpeechVoice()?.identifier {
            cell.accessoryType = .checkmark
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for row in 0 ... tableView.numberOfRows(inSection: indexPath.section) {
            tableView.cellForRow(at: IndexPath(row: row, section: indexPath.section))?.accessoryType = .none
        }
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.deselectRow(at: indexPath, animated: true)

        setting.set(voices[indexPath.row].identifier, for: .speechVoice)
        _ = navigationController?.popViewController(animated: true)
    }
}
