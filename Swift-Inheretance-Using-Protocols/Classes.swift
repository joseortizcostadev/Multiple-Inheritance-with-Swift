//***********************************************************************************
///- File:        Classes.swift
///- Project:     Swift-Inheretance-Using-Protocols
///- Author:      Jose Ortiz Costa
///- Date:        on 9/8/16.
///- Copyright:   © 2016 Jose Ortiz. All rights reserved.
///- Description: This file contains the classes Lectures and GraduateStudent
///               which implement both protocols ( Faculty and Graduate )
///- Important:   Note that GraduateStudent class uses multiple inheritance with
///               protocols.
///
//***********************************************************************************

import Foundation

///----------------------------------------------------------------------------------
/// This class represents a lectures that inherit its properties and methods from
/// the protocol faculty
///- Note: this class only implements the properties of the protocol Faculty since
///        its methods are already implemented in the protocol extension
///----------------------------------------------------------------------------------
class Lecturer : NSObject, Faculty
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

///----------------------------------------------------------------------------------
/// This class represents a GraduateStudent that inherit its properties and methods from
/// the protocols Faculty and Graduate since it needs methods from both protocols
///- Note: This is an example of multiple inheritance where this class in inhereting
///        from the protocols Faculty and Graduate. Note that NSObject is a class 
///        and not a protocol. It is not needed by this class, but I just put it there
///        to show more clearly how multiple inheritance can work mixing classes and 
///        protocols
///
///----------------------------------------------------------------------------------
class GraduateStudent : NSObject, Faculty, Graduate {
    
    var id : String
    var name : String
    var salary: Double
    var courses : [Course]
    var coursesAsStudent: [Course]
    
    init (withId id : String,  name : String, salary : Double)
    {
        self.id = id
        self.name = name
        self.salary = salary
        self.courses = [Course]()
        self.coursesAsStudent = [Course]()
        
    }
}
