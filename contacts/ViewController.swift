//
//  ViewController.swift
//  contacts
//
//  Created by Aditi Bansal on 8/26/25.
//

import UIKit

struct Contact {
    var photo: String?
    var name: String?
    var role: String?
    var country: String?
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    let headerView = UIView()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 79
        return tv
    }()
    
    let searchBar: UISearchBar = {
        let sB = UISearchBar()
        sB.translatesAutoresizingMaskIntoConstraints = false
        return sB
    }()
    
    var contactList: [Contact] = []
    
    var filteredContactList: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayout()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        tableView.register(ListCell.self, forCellReuseIdentifier: "ListCell")
        // Do any additional setup after loading the view.
        
    let objContact1 = Contact(photo: "person", name: "Mohammad Hussain", role: "SEO Specialist", country: "Belgium")
    let objContact2 = Contact(photo: "person", name: "John Young", role: "Interactive Designer", country: "Belgium")
    let objContact3 = Contact(photo: "person", name: "Tamilarasi Mohan", role: "Architect", country: "Belgium")
    let objContact4 = Contact(photo: "person", name: "Kim Yu", role: "Economist", country: "Belgium")
    let objContact5 = Contact(photo: "person", name: "Derek Fowler", role: "Web Strategist", country: "Belgium")
    let objContact6 = Contact(photo: "person", name: "Shreya Nithin", role: "Product Designer", country: "Belgium")
    let objContact7 = Contact(photo: "person", name: "Emily Adams", role: "Editor", country: "Belgium")
        contactList.append(objContact1)
        contactList.append(objContact2)
        contactList.append(objContact3)
        contactList.append(objContact4)
        contactList.append(objContact5)
        contactList.append(objContact6)
        contactList.append(objContact7)
        
        filteredContactList = contactList
    }
    
    func setUpLayout() {
        view.addSubview(headerView)
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        setUpHeader()
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60),
            
            searchBar.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 56), // standard height
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        print("hello")
    }
    
    func setUpHeader() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = UIColor.systemCyan
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Contacts"
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredContactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let contact: Contact = filteredContactList[indexPath.row]
        cell.name.text = contact.name
        cell.role.text = contact.role
        
//        if let imageName = contact.photo { // assuming your Contact has a photoName String
//            cell.photo.image = UIImage(named: imageName)
//        }
//        if let imageName = contact.country { // assuming your Contact has a photoName String
//            cell.country.image = UIImage(named: country)
//        }
        cell.photo.image = UIImage(systemName: "person.circle")
        cell.country.image = UIImage(systemName: "person.circle")
        
        
        print(indexPath.row)
        print(contactList[indexPath.row].name)
        return cell
    }
    
    // MARK: - UISearchBar Delegate
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            if searchText.isEmpty {
                // If search text is empty, show all data
                filteredContactList = contactList
            } else {
                // Otherwise, filter results
                filteredContactList = contactList.filter { $0.name!.lowercased().contains(searchText.lowercased()) }
            }
            
            tableView.reloadData()
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder() // dismiss keyboard
        }
    



}

