//
//  File.swift
//  contacts
//
//  Created by Aditi Bansal on 8/26/25.
//

import UIKit

class ListCell: UITableViewCell {
    let photo = UIImageView()
    let name = UILabel()
    let role = UILabel()
    let country = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            
            // Make circular now that the frame is set
            photo.layer.cornerRadius = photo.frame.size.width / 2
            photo.clipsToBounds = true
            photo.contentMode = .scaleAspectFill
            
            country.layer.cornerRadius = country.frame.size.width / 2
            country.clipsToBounds = true
            country.contentMode = .scaleAspectFill
        }
    
    func setupViews() {
        selectionStyle = .default
        
        photo.translatesAutoresizingMaskIntoConstraints = false
            
        // Name
        name.font = .boldSystemFont(ofSize: 17)
        name.translatesAutoresizingMaskIntoConstraints = false
            
        // Role (with capsule background)
        role.font = .systemFont(ofSize: 11)
        role.textColor = .white
        role.backgroundColor = .systemTeal
        role.layer.cornerRadius = 5
        role.clipsToBounds = true
        role.textAlignment = .center
        role.translatesAutoresizingMaskIntoConstraints = false
            
        // Flag
        country.translatesAutoresizingMaskIntoConstraints = false
            
        contentView.addSubview(photo)
        contentView.addSubview(name)
        contentView.addSubview(role)
        contentView.addSubview(country)
        
        NSLayoutConstraint.activate([
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photo.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photo.widthAnchor.constraint(equalToConstant: 70),
            photo.heightAnchor.constraint(equalToConstant: 70),
            
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            name.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 12),
            
            role.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
            role.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 12),
            role.heightAnchor.constraint(equalToConstant: 20),
            
            country.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            country.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            country.widthAnchor.constraint(equalToConstant: 26),
            country.heightAnchor.constraint(equalToConstant: 26),
            ])
        
    }
    
    func contactData(_ contact: Contact) {
        name.text = contact.name
        role.text = contact.role
        
        photo.image = UIImage(named: contact.photo!)
        country.image = UIImage(named: contact.country!)
    }
}
