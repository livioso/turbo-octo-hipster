//
//  Subjects.swift
//  Turbo Octo Hipster
//
//  Created by Livio Bieri on 25/06/14.
//  Copyright (c) 2014 Livio Bieri. All rights reserved.
//

import Foundation

protocol SubjectProtocol {
    
    var abbreviation: String {set get}
    var directory: String {set get}
    
    init(abbreviation: String, directory: String)
}

class Subject: SubjectProtocol {
    
    var abbreviation: String
    var directory: String
    
    init(abbreviation: String, directory: String) {
        self.abbreviation = abbreviation
        self.directory = directory
    }
}