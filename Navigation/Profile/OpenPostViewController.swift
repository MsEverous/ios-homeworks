//
//  OpenPostViewController.swift
//  Navigation
//
//  Created by Лариса Терегулова on 10.02.2023.
//

import UIKit

class OpenPostViewController: UIViewController, UITableViewDataSource {
   
    var postIndex = 0
    var flag = true
    
    private let tableView = UITableView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemGray6
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(exitPostVC))
        tableView.dataSource = self
    }

    @objc func exitPostVC() {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostTableViewCell()
        cell.setupPost(postIndex, flag)
        return cell
    }
}
