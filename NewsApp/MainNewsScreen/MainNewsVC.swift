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

let dataFromAPI = [News(title: "news1", status: .closed, category: .animal),
            News(title: "news2", status: .responded, category: .globalWarming),
            News(title: "news3", status: .pendingResponse, category: .globalWarming),
            News(title: "news4", status: .closed, category: .finance)]


class MainNewsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var news = [News]()
    @IBOutlet weak var tableView: UITableView!
//    var task: URLSessionDataTask?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        news = dataFromAPI
    }
    
    @IBAction func refreshButtonDidClick(_ sender: Any) {
        news = dataFromAPI
        tableView.reloadData()
    }
    @IBAction func reoderButtonDidClick(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    deinit {
        print("MainNewsVC is deinited")
    }
}

//MARK: - UITableViewDelegate
extension MainNewsVC {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let newsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsVC") as! UIViewController
        newsVC.modalPresentationStyle = .pageSheet
        self.present(newsVC, animated: true) {
            print("DidSelect")
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}
//MARK: - UITableViewDataSource
extension MainNewsVC  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        cell.titleLabel.text = news[indexPath.row].title
        cell.typeBadge.tintColor = news[indexPath.row].status.color
        cell.typeBadge.setTitle(news[indexPath.row].status.rawValue, for: .normal)
        cell.thumbnail.image = UIImage(named: news[indexPath.row].category.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK: - TableViewCellMovable
extension MainNewsVC  {
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let tmp = news[sourceIndexPath.row]
//        news[sourceIndexPath.row] = news[destinationIndexPath.row]
//        news[destinationIndexPath.row] = tmp
        
        
//        news.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        
        
        let elem = news.remove(at: sourceIndexPath.row)
        news.insert(elem, at: destinationIndexPath.row)
    }
}

//MARK: - TableViewCellRemovable
extension MainNewsVC  {
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
//    {
//        if editingStyle == .delete {
//            news.remove(at: indexPath.row)
//            tableView.reloadData()
//        }
//    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
}
