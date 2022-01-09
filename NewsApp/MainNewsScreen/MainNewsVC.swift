//
//  MainNewsVC.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 8/1/2565 BE.
//

import UIKit

//title, url, body, createdDate
//extension MainNewsVC {
//    func fetchNewsFromAPI() {
//        task = URLSession.shared.dataTask(with: URL(string: "https://petitions.whitehouse.gov/petition/president-trump-needs-remove-and-replace-current-united-states-attorney-general-jeff-sessions")!) { data, response, error in
//            if let data = data,
//               let image = UIImage(data: data) {
//                print("Image!!")
//            }
//        }
//        task?.resume()
//    }
//}

let data = [News(title: "news1", status: .closed, category: .animal),
            News(title: "news2", status: .responded, category: .globalWarming),
            News(title: "news3", status: .pendingResponse, category: .globalWarming),
            News(title: "news4", status: .closed, category: .finance)]


class MainNewsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var task: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
}

//MARK: - UITableViewDataSource
extension MainNewsVC  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.titleLabel.text = data[indexPath.row].title
        cell.typeBadge.tintColor = data[indexPath.row].status.color
        cell.typeBadge.setTitle(data[indexPath.row].status.rawValue, for: .normal)
        cell.thumbnail.image = UIImage(named: data[indexPath.row].category.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
