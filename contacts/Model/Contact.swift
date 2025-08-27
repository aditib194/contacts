//
//  Contact.swift
//  contacts
//
//  Created by Aditi Bansal on 8/27/25.
//

import Foundation
struct Contact {
    var photo: String?
    var name: String?
    var role: String?
    var country: String?
    
    static func contactList() -> [Contact] {
        return [Contact(photo: "Person1", name: "Mohammad Hussain", role: "SEO Specialist", country: "Belgium"),
                Contact(photo: "Person2", name: "John Young", role: "Interactive Designer", country: "Albania"),
                Contact(photo: "Person3", name: "Tamilarasi Mohan", role: "Architect", country: "Argentina"),
                Contact(photo: "Person4", name: "Kim Yu", role: "Economist", country: "Togo"),
                Contact(photo: "Person5", name: "Derek Fowler", role: "Web Strategist", country: "Transnistria"),
                Contact(photo: "Person6", name: "Shreya Nithin", role: "Product Designer", country: "San Marino"),
                Contact(photo: "Person7", name: "Emily Adams", role: "Editor", country: "Republic of Congo")
        ]
    }
}
