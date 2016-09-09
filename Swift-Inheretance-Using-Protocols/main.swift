//
//  main.swift
//  Swift-Inheretance-Using-Protocols
//
//  Created by Master_CS_SE on 9/8/16.
//  Copyright © 2016 Jose Ortiz. All rights reserved.
//

import Foundation

var lecturer1 : Faculty = Lecturer(withId: "913754433", name: "John", salary: 30.00)
var lecturer2 : Faculty = Lecturer(withId: "913752233", name: "Marc", salary: 28.00)
var lecturer3 : Faculty = Lecturer(withId: "913759933", name: "Nando", salary: 34.00)
var graduateStudent1 = GraduateStudent(withId: "913664444", name: "Mario", salary: 12.00)
var graduateStudent2 = GraduateStudent(withId: "913765555", name: "Mike", salary: 11.00)


let dataStructures = Course(name: "Data Structures", semester: "Spring2016", assistantTeacher: nil)
let algorithms = Course(name: "Analysis of algorithms", semester: "Spring2016", assistantTeacher: nil)
let machineLearning = Course(name: "Neural Networks", semester: "Fall 2016", assistantTeacher: nil)


lecturer1.teaches(course: dataStructures)
lecturer1.teaches(course: algorithms)
lecturer2.teaches(course: dataStructures)
lecturer2.teaches(course: machineLearning)
lecturer3.teaches(course: dataStructures)
lecturer3.teaches(course: algorithms)
lecturer3.teaches(course: machineLearning)

lecturer1.add(assistant: graduateStudent1, forCourse: dataStructures)
lecturer2.add(assistant: graduateStudent2, forCourse: machineLearning)
lecturer3.add(assistant: graduateStudent1, forCourse: algorithms)


print(lecturer1.info())
print(lecturer2.info())
print(lecturer3.info())



print(graduateStudent1.coursesAssisting(withFacultyMember: lecturer1))
print(graduateStudent1.coursesAssisting(withFacultyMember: lecturer3))
print(graduateStudent2.coursesAssisting(withFacultyMember: lecturer2))


/*  Output
 
 Professor John teaches the following courses:
 Title: Data Structures in semester: Spring2016 with assistant teacher: Mario
 Title: Analysis of algorithms in semester: Spring2016
 
 
 Professor Marc teaches the following courses:
 Title: Data Structures in semester: Spring2016 Title: Neural Networks in semester: Fall 2016 with assistant teacher: Mike
 
 
 
 Professor Nando teaches the following courses:
 Title: Data Structures in semester: Spring2016 Title: Analysis of algorithms in semester: Spring2016 with assistant teacher: Mario
 Title: Neural Networks in semester: Fall 2016
 
 
 [Swift_Inheretance_Using_Protocols.Course(name: "Data Structures", semester: "Spring2016", assistantTeacher: Optional("Mario"))]
 [Swift_Inheretance_Using_Protocols.Course(name: "Analysis of algorithms", semester: "Spring2016", assistantTeacher: Optional("Mario"))]
 [Swift_Inheretance_Using_Protocols.Course(name: "Neural Networks", semester: "Fall 2016", assistantTeacher: Optional("Mike"))]
 
*/
