//
//  SubjectsReader.swift
//  Turbo Octo Hipster
//
//  Created by Livio Bieri on 28/06/14.
//  Copyright (c) 2014 Livio Bieri. All rights reserved.
//

import Foundation

protocol SubjectsReaderProtocol {
    func buildSubjectsDictionary(#fromThisFile: String) -> Dictionary<String, String>?
}

class SubjectsReader: SubjectsReaderProtocol {
    func buildSubjectsDictionary(#fromThisFile: String) -> Dictionary<String, String>? {
        
        
        let data = NSData.dataWithContentsOfFile("/Users/livio/Dropbox/FHNW/SyncMe/SyncMe/subjects.json", options: .DataReadingMappedIfSafe, error: nil)
        
        var error: NSError?
        let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as NSDictionary
        
        if let subjects = jsonResult["subjects"] as? NSDictionary[] {
            for subject in subjects {
                // subject is an NSDictionary
                var prefix = subject["prefix"] as String
                var name = subject["name"] as String
                var directory = subject["directory"] as String
                // etc
                
                println(name + directory)
            }
        } else {
            // There was no 'subjects' key in the dictionary
        }
        
        return nil
    }
}