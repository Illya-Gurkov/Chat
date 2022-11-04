//
//  UsersViewController.swift
//  Chat
//
//  Created by Illya Gurkov on 1.11.22.
//

import UIKit

class UsersViewController: UIViewController {

    var users = [CurentUser]()
    let servicec = Service.shared
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "UserCellTableViewCell", bundle: nil), forCellReuseIdentifier: UserCellTableViewCell.reuseId)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        getUsers()
        
    }
    
    func getUsers() {
        servicec.getAllUsers { users in
            self.users = users
            self.tableView.reloadData()
        }
    }
   

}
extension UsersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCellTableViewCell.reuseId, for: indexPath) as! UserCellTableViewCell
        cell.selectionStyle = .none
        let cellName = users[indexPath.row]
        cell.configCell(cellName.email)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userId = users[indexPath.row].id
        let vc = ChatViewController()
        vc.otherId = userId
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
