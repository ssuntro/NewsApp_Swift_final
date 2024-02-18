import UIKit


// MARK: - Demo
import PlaygroundSupport

//        sender.setNeedsLayout()
//        sender.layoutIfNeeded()
//        self.view.layoutSubviews()


//Summary
//1. UI elem  can update by provided function with no need layoutIfNeeded
//2. UItableViewCell only reflect the change when tableview.reloaddata()
//3. when we need layoutIfNeeded. Example1. when custom tableViewCell is introducted and you want to adjust frame sie to expand or minimise the view(streaming app for example). Example2. https://stackoverflow.com/questions/40219271/constraints-not-updating-automatically-in-ios. Example3. given there are 3 layer of view. 2nd layer is expanded so layer inside should be adjust per autolayout contraint then layoutsubview() is needed.

//Ref. https://manishpathak99.medium.com/difference-between-setneedslayout-layoutifneeded-ac098dc03faf
class ViewController: UITableViewController {
    let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DUMMY")
    }
    
    func setupButton() {
        
        button.backgroundColor = .green
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

          self.view.addSubview(button)
    }
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        
        sender.backgroundColor = .black
        sender.setTitle("AAA", for: .normal)
        animateTheView()
    }
    
    func animateTheView() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 0.5) {
            self.button.frame.origin.y = CGFloat(30) //this should not work given contraint is seted by autolayout
            self.button.frame.size = CGSize(width: 10, height: 100) //this should not work given contraint is seted by autolayout
        }
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        let cell = tableView.dequeueReusableCell(withIdentifier: "DUMMY", for: indexPath)
        let title = (cell.textLabel?.text ?? "") + " title"
        cell.textLabel?.text = title
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DUMMY", for: indexPath)
        let title = (cell.textLabel?.text ?? "") + " AAAA"
        cell.textLabel?.text = title
        
        
        print("didSelectRowAt")
        tableView.reloadData()
        
    }
}

let viewController = ViewController()

PlaygroundPage.current.liveView = viewController


