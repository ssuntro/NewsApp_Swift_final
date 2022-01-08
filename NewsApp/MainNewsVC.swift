//
//  MainNewsVC.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 8/1/2565 BE.
//

import UIKit

let highLightNews = [NewsSection(count: 3, color: UIColor.lightGray),
                   NewsSection(count: 2, color: UIColor.darkGray)]


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
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as UITableViewCell
        cell.backgroundColor = highLightNews[indexPath.section].color
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
