//
//  ViewController.swift
//  contacts
//
//  Created by Aditi Bansal on 8/26/25.
//

import UIKit

class ContactsViewController: UIViewController, UISearchBarDelegate {
    let headerView = UIView()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 90
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
        contactList = Contact.contactList()
        
        filteredContactList = contactList
    }
}

// MARK: - UITableView DataSource and UITableViewDelegate
extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredContactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let contact: Contact = filteredContactList[indexPath.row]
        cell.contactData(contact)
        
        return cell
    }
}

// MARK: - UISearchBar Delegate
extension ContactsViewController {
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

// MARK: - UI
extension ContactsViewController {
    
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
}

