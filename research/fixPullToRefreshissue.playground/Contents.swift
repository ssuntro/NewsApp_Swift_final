import UIKit

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

// MARK: - Demo
import PlaygroundSupport

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(ViewController.fetchData), for: UIControl.Event.valueChanged)
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DUMMY")
    }
    
    @objc func fetchData() {
        print(#function)
        Task { [weak self] in
            guard let self = self else { return }
            print("call API")
            self.tableView.endRefreshing()
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DUMMY", for: indexPath)
        cell.textLabel?.text = "title"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
        self.tableView.beginRefreshing()
        fetchData()
        //TODO: self.tableView.endRefreshing() expect to be moved here after fix the code smell
    }
}

let viewController = ViewController()

PlaygroundPage.current.liveView = viewController


