//
//  MainNewsVC.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 8/1/2565 BE.
//

import UIKit


extension MainNewsVC: NewsVCDelegate {
    func newVCRemoveButtonDidClick(_ vc: NewsVC) { //why needs to send self or vc?
        if let index = news.firstIndex(where: { $0.detail.title == vc.news?.detail.title }) {
            news.remove(at: index)
            tableView.reloadData()
        }
    }
}
class MainNewsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var news = [News]() {
        didSet {
            tableView.reloadData()
        }
    }
    lazy var loadingView: UIView  = {
        let view = UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
        view.backgroundColor = .clear
        view.center = self.view.center
        return view
    }()
    
    @IBOutlet weak var tableView: UITableView!
    var fetcher = NewsFetcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchData()
    }
    
    func fetchData() {
        view.addSubview(loadingView)
        view.bringSubviewToFront(loadingView)
//        fetcher.exe { [weak self] result in
//            print("fetchData completed.")
//            self?.news = result
//            self?.loadingView.removeFromSuperview()
//        }
        
        
        Task { [weak self] in
            //main.async thread always
            let xxx = await NewsFetcherAwait().task.result
            switch(xxx) {
            case .success(let data):
                print("fetchData completed.")
                self?.news = data
            case .failure(_):
                print("error")
            }
            self?.loadingView.removeFromSuperview()
        }
    }
    
    @IBAction func refreshButtonDidClick(_ sender: Any) {
        fetchData()
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
        
        let newsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsVC") as! NewsVC
        newsVC.news = news[indexPath.row]
//        newsVC.delegate = self
        newsVC.onRemovedButtonDidClick = {[weak self] (selectedNews:News) -> () in //why weak self? and it is use same technique as self.present(...)
            if let index = self?.news.firstIndex(where: { $0.detail.title == selectedNews.detail.title }) {
                self?.news.remove(at: index)
                tableView.reloadData()
            }
        }
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
        cell.titleLabel.text = news[indexPath.row].detail.title
        cell.typeBadge.tintColor = news[indexPath.row].detail.status.color
        cell.typeBadge.setTitle(news[indexPath.row].detail.status.rawValue, for: .normal)
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

//MARK: - Segue example
extension MainNewsVC  {
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "MySegueId" {
//            if let nextViewController = segue.destination as? NextViewController {
//                    nextViewController.valueOfxyz = "XYZ" //Or pass any values
//                    nextViewController.valueOf123 = 123
//            }
//        }
//    }
}