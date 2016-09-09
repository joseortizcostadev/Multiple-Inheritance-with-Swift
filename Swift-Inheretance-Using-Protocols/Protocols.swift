//
//  Protocols.swift
//  Swift-Inheretance-Using-Protocols
//
//  Created by Master_CS_SE on 9/8/16.
//  Copyright © 2016 Jose Ortiz. All rights reserved.
//

import Foundation

struct Course {
    
    var name : String
    var semester : String
    var assistantTeacher : String?
    
    static func compare (course1 : Course, course2 : Course) -> Bool
    {
        return course1.name == course2.name && course1.semester == course2.semester
    }
}

protocol Faculty {
    
    var id : String { get set }
    var name : String { get set }
    var courses : [Course] {get set}
    mutating func teaches (course : Course)
    mutating func add (assistant : GraduateStudent, forCourse course : Course)
    func info () -> String
    
}

extension Faculty {
    
    mutating func teaches (course : Course)
    {
        courses.append(course)
    }
    mutating func add (assistant : GraduateStudent, forCourse course : Course)
    {
        for i in (0..<courses.count)
        {
            var updateCourse = courses[i]
            
            if Course.compare(course1: courses[i], course2: course)
            {
                updateCourse.assistantTeacher = assistant.name
                courses[i] = updateCourse
            }
        }
    }
    
    func info () -> String
    {
        var description = "Professor \(name) teaches the following courses: \n"
        for course: Course in courses {
            description += "Title: \(course.name) in semester: \(course.semester) "
            if (course.assistantTeacher != nil)
            {
                description += "with assistant teacher: \(course.assistantTeacher!)\n"
            }
        }
        description += "\n\n"
        return description 
    }
    
}

protocol Graduate {
    
    
    func coursesAssisting (withFacultyMember faculty : Faculty) -> [Course]
    
    
}

extension Graduate where Self: GraduateStudent {
    
    func coursesAssisting (withFacultyMember faculty : Faculty) -> [Course]
    {
        var assisting = [Course]()
        for course : Course in faculty.courses {
           if course.assistantTeacher == name
           {
              assisting.append(course)
           }
        }
        return assisting
    }
    
   
}
