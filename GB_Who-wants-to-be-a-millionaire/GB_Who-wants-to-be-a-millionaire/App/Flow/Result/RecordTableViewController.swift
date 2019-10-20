//
//  RecordTableViewController.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 19.10.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class RecordTableViewController: UITableViewController {
    
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.gameResults.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        let result = Game.shared.gameResults[indexPath.row]
        cell.textLabel?.text = "\(dateFormatter.string(from: result.date)): \(result.percentCorrectAnswers)"
        return cell
    }

}
