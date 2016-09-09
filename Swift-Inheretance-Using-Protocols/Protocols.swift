//***********************************************************************************
///- File:        Protocols.swift
///- Project:     Swift-Inheretance-Using-Protocols
///- Author:      Jose Ortiz Costa
///- Date:        on 9/8/16.
///- Copyright:   © 2016 Jose Ortiz. All rights reserved.
///- Description: This file contains the structure Course, and the protocols Faculty
///               and Graduate. The Course structure represents a structure with basic
///               info about a specific course. The protocols Faculty and Graduate are
///               used to be inhereted from other classes e.g Faculty->Lecturer or
///               Lecturer->Graduate Student as professor assistant. This protocols
///               may provide multiple inheretance for classes that inherit from 
///               them.
///- Important:   Note that Faculty and Graduate protocols implement its signature 
///               methods in their own extensions. The advantages of this technique
///               is that those methods do not need to be implemented by the classes
///               that inherit from them.
///
//***********************************************************************************

import Foundation

///----------------------------------------------------------------------------------
///- Represents a structure with basic info about an specific course
///- Warning: assistantTeacher property may be nil.
///----------------------------------------------------------------------------------
struct Course
{
    var name : String
    var semester : String
    var assistantTeacher : String? // may be nil
    
    ///- Static method that compares two courses structures
    ///- Parameter course1: a Course structure object to be compared against course2
    ///- Parameter course2: a Course structure object to be compared aganist course1
    ///- Returns: true if the two Course structures are equal. Otherwise, returns false.
    static func compare (course1 : Course, course2 : Course) -> Bool
    {
        return course1.name == course2.name && course1.semester == course2.semester
    }
}

///-----------------------------------------------------------------------------------
///- Protocol Faculty represents a protocol that can be inhereted by other classes
///- Important: Classes inhereting this protocol don't need to implement their
///             signature methods since they are already implemented in the protocol
///             extension
///- Example:   Assuming that a class Lecturer inherits from this protocol we can do 
///             the following: let faculty: Faculty = Lecturer(......)
///-----------------------------------------------------------------------------------
protocol Faculty {
    
    /// Signature Properties
    var id : String { get set }
    var name : String { get set }
    var courses : [Course] {get set}
    
    /// Signature methods
    mutating func teaches (course : Course)
    mutating func add (assistant : GraduateStudent, forCourse course : Course)
    func info () -> String
    
}

///- Extension of protocol Faculty
extension Faculty {
    
    ///- Mutating method Adds a Course struct to the array of structs courses 
    ///  meaning that a teacher teaches the course just added.
    ///- Parameter course: represents the Course struct to be added
    mutating func teaches (course : Course)
    {
        courses.append(course)
    }
    
    ///- Mutating methods that adds an assistant teacher to the course 
    ///  provided as parameter
    ///- Parameter assistant: GraduateStudent object representing the graduate 
    ///                       student who will assist to a professor teaching
    ///                       this course
    ///- Parameter course:    Course struct representing the course to be assisted
    ///                       by the graduate student
    mutating func add (assistant : GraduateStudent, forCourse course : Course)
    {
        for i in (0..<courses.count)
        {
            var updateCourse = courses[i] // save a tmp course
            
            if Course.compare(course1: courses[i], course2: course)
            {
                // courses are equal
                updateCourse.assistantTeacher = assistant.name // assign value
                courses[i] = updateCourse // save back updated data
            }
        }
    }
    
    /// This method prints all the basic information about a faculty object
    ///- Returns: a String object representing the basic info or description
    func info () -> String
    {
        var description = "Professor \(name) teaches the following courses: \n"
        for course: Course in courses {
            description += "Title: \(course.name) in semester: \(course.semester) "
            if (course.assistantTeacher != nil)
            {
                description += "with assistant teacher: \(course.assistantTeacher!)\n"
            }
            else
            {
                description += "\n"
            }
        }
        description += "\n\n"
        return description 
    }
    
}

/// Graduate protocol provides a signature method which can only be inherited by
/// a GraduateStudent class
protocol Graduate {
    
    /// Signature method
    func coursesAssisting (withFacultyMember faculty : Faculty) -> [Course]
}

/// Graduate protocol extension that implements its signature methods
extension Graduate where Self: GraduateStudent {
    
    /// Make an array of Course structs representing the courses assisted
    /// by this graduate
    ///- Parameter faculty: a Faculty protocol representing the faculty
    ///                      who is assited by this graduate
    ///- Returns: an array of Course struct representing the courses assisted
    ///           as a teacher assistant by this graduate student
    ///- Note: This method may return an empty list, but it won't return nil
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
