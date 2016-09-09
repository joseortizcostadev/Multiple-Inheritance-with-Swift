//
//  Lecturer.swift
//  Swift-Inheretance-Using-Protocols
//
//  Created by Master_CS_SE on 9/8/16.
//  Copyright © 2016 Jose Ortiz. All rights reserved.
//

import Foundation

class Lecturer : Faculty
{
    var id : String
    var name : String
    var salary: Double
    var courses : [Course]
    
    init (withId id : String,  name : String, salary : Double)
    {
        self.id = id
        self.name = name
        self.salary = salary
        self.courses = [Course]()
    }
    

}


class GraduateStudent : Faculty, Graduate {
    
    var id : String
    var name : String
    var salary: Double
    var courses : [Course]
    
    
    init (withId id : String,  name : String, salary : Double)
    {
        self.id = id
        self.name = name
        self.salary = salary
        self.courses = [Course]()
        
    }
    
    
}
