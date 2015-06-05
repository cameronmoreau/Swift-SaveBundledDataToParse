//
//  User.swift
//  SaveBundledDataToParse
//
//  Created by Cameron Moreau on 6/4/15.
//  Copyright (c) 2015 Cameron Moreau. All rights reserved.
//


class User {
    var name: String
    var email: String
    var phone: String
    
    init() {
        self.name = "Random Name"
        self.email = "randomemail@gmail.com"
        self.phone = "(972) 922 9093"
    }
    
    init(name: String, email: String, phone: String) {
        self.name = name
        self.email = email
        self.phone = phone
    }
}
