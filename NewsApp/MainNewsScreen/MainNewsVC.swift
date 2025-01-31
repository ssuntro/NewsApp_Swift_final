//
//  MainNewsVC.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 8/1/2565 BE.
//

import UIKit
import SwiftUI

extension MainNewsVC: NewsVCDelegate {
    func newVCRemoveButtonDidClick(_ vc: NewsVC) { //why needs to send self or vc?
        if let index = news.firstIndex(where: { $0.detail.title == vc.news?.detail.title }) {
            news.remove(at: index)
            tableView.reloadData()
        }
    }
}
class MainNewsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var siwftUIView: UIView!
    var news = [News]() {
        didSet {
            tableView.reloadData()
        }
    }
    @IBOutlet weak var loginButton: UIButton!
//    lazy var loadingView: UIView  = {
//        let view = UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
//        view.backgroundColor = .clear
//        view.center = self.view.center
//        return view
//    }()
    
    @IBOutlet weak var tableView: UITableView!
    var fetcher = NewsFetcher()
    var appIconManager = AppIconManager()
    
    override func viewDidLoad() {
        let socialImpactItem = UIHostingController(rootView: SocialImpactItem()) //loginView(), SocialImpactItem()), Animation1View()
        socialImpactItem.view.translatesAutoresizingMaskIntoConstraints = false
        socialImpactItem.view.frame = siwftUIView.bounds
        // First, add the view of the child to the view of the parent
        siwftUIView.addSubview(socialImpactItem.view)
        // Then, add the child to the parent
//        siwftUIView.addChild(socialImpactItem)
        
        
        
        
        
        super.viewDidLoad()
        loginButton.tintColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: UIControl.Event.valueChanged)
        tableView.refreshControl = refreshControl
        fetchData()
        tableView.register(UINib(nibName: "DummyCell", bundle: nil), forCellReuseIdentifier: "DummyCell")
    }
    
    @objc func fetchData() {
        self.news = [News]()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            
            Task {
                guard let self = self else { return }
                self.news = await NewsFetcherAwait().news
                self.tableView.endRefreshing()
                print("fetchData1 thread: \(Thread.current)")
                print("fetchData1 is main thread: \(Thread.isMainThread)")
            }
            
            print("fetchData2 thread: \(Thread.current)")
            print("fetchData2 is main thread: \(Thread.isMainThread)")
            
        }
        
        self.fetcher.exe { newsList in
            print(newsList)
            print("fetchData3 thread: \(Thread.current)")
            print("fetchData3 is main thread: \(Thread.isMainThread)")
        }
        
    }
    
    @IBAction func refreshButtonDidClick(_ sender: Any) {
        self.tableView.beginRefreshing()
        fetchData()
    }
    
    @IBAction func reoderButtonDidClick(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    @IBAction func loginButtonDidClick(_ sender: Any) {
        let vc = UIHostingController(rootView: LoginView())
        self.present(vc, animated: true, completion: nil)
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
//        performSegue(withIdentifier: "newsSegue", sender: indexPath.row)
        self.present(newsVC, animated: true) {
            print("DidSelect")
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        appIconManager.setIcon(from: indexPath.row)
    }
    
}
//MARK: - UITableViewDataSource
extension MainNewsVC  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return tableView.dequeueReusableCell(withIdentifier: "DummyCell", for: indexPath) as! UITableViewCell
        
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


extension UITableView {
    public func beginRefreshing() {
        let contentOffset = CGPoint(x: 0, y: -(self.refreshControl?.frame.size.height ?? 0))
        self.setContentOffset(contentOffset, animated: true)
        self.refreshControl?.beginRefreshing()
    }
    public func endRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            self?.refreshControl?.endRefreshing()
        }
    }
}
