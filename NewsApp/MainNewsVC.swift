//
//  MainNewsVC.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 8/1/2565 BE.
//

import UIKit

let highLightNews = [NewsSection(name: "Animal", count: 3, color: UIColor.systemTeal),
                   NewsSection(name: "Global warming", count: 2, color: UIColor.systemRed),
                     NewsSection(name: "Finance", count: 3, color: UIColor.systemGreen)]


class MainNewsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

//MARK: - UITableViewDataSource
extension MainNewsVC  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        highLightNews[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        highLightNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.typeBallon.tintColor = highLightNews[indexPath.section].color
        cell.typeBallon.setTitle(highLightNews[indexPath.section].name, for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
