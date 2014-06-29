//
//  Subjects.swift
//  Turbo Octo Hipster
//
//  Created by Livio Bieri on 25/06/14.
//  Copyright (c) 2014 Livio Bieri. All rights reserved.
//

import Foundation

protocol SubjectProtocol {
    
    var directory: String {get}
    var abbreviation: String {get}
    var fullpath: String {get}
    
    init(directory: String, abbreviation: String)
}

class Subject: SubjectProtocol {
    
    var directory: String
    var abbreviation: String
    
    // represents the full path which is 
    // directory + / + abbreviation
    var fullpath: String = ""
    
    init(directory: String, abbreviation: String) {
        
        self.abbreviation = abbreviation
        
        if !directory.hasSuffix("/") {
            self.directory = directory + "/"
        } else {
            self.directory = directory
        }
        
        // now build the full path. please not that 
        // the diretory may have been modified so we just
        // use the class' property instead of the parameters
        self.fullpath = self.directory + self.abbreviation
    }
}