//
//  MessageListViewController.swift
//  Chat
//
//  Created by Illya Gurkov on 2.11.22.
//

import UIKit
import MessageKit



class MessageListViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
       
        
      
    }
    

    
}
extension MessageListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Dima"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatViewController()
        vc.chatID = "firsChatId"
        vc.otherId = "MhjxvFi9ntRmBpyVmVvj50CUdv43"
        
        navigationController?.pushViewController(vc, animated: true)
    
    }
    
}

