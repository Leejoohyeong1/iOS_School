//
//  main.swift
//  170906_AreaPerimeterVolume
//
//  Created by SIMA on 2017. 9. 14..
//  Copyright © 2017년 SIMA. All rights reserved.
//

import Foundation

let pi: Double = 3.14

////사각형의 넓이와 둘레 계산하는 함수
func rectangle (type: String, width: Int, height: Int) -> Int
{
    var returnValue: Int = 0
    if type == "A" {
        returnValue = width * height
    }else if type == "P" {
        returnValue = 2 * (width + height)
    }else {
        print("type이 틀렸습니다.")
        return 0
    }
    return returnValue
}

////원의 넓이와 둘레, 원기둥 구의 부피를 구하는 함수
func circle (type: String, radius: Int, height: Int) -> Double
{
    var returnValue: Double = 0
    if height == 0 {
        if type == "A"{
            returnValue = pi * Double(radius * radius)
        }else if type == "P" {
            returnValue = 2.0 * pi * Double(radius)
        }else {
            print("type이 틀렸습니다.")
            return 0
        }
    }else if height > 0 {
        if type == "V" {
            returnValue = (4 * pi * Double(radius * radius * radius)) / 3
        }else {
            print("type이 틀렸습니다.")
            return 0
        }
    }
    return returnValue
}

////삼각형의 넓이를 구하는 함수
func triangle (line: Int, height: Int) -> Double
{
    var returnValue: Double = 0
    returnValue = Double(line * height) / 2
    return returnValue
}

////사다리꼴의 넓이 구하는 함수
func trapezoid (lineA: Int, lineB: Int, height: Int) -> Double
{
    var returnValue: Double = 0
    returnValue = Double(height * (lineA + lineB)) / 2
    return returnValue
}

////직(정)육면체 부피 구하는 공식
func solid (lineA: Int, lineB: Int, height: Int) -> Int
{
    var returnValue: Int = 0
    returnValue = lineA * lineB * height
    return returnValue
}

////삼각뿔 부피 구하는 공식
func cone (radius: Int, height: Int) -> Double
{
    var returnValue: Double = 0
    returnValue = (pi * Double(radius * radius * height)) / 3
    return returnValue
}

var rectangleAll: Int = rectangle (type: "A", width: 23, height: 12)
var circleAll: Double = circle(type: "V", radius: 4, height: 3)
var triangleAll: Double = triangle (line: 5, height: 2)
var trapezoidAll: Double = trapezoid(lineA: 5, lineB: 3, height: 2)
var solidAll: Int = solid(lineA: 3, lineB: 3, height: 2)
var coneAll: Double = cone(radius: 4, height: 2)


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
let errMsg: String = "값을 잘못 입력하셨습니다."
let typeMsg: String = "타입을 잘못 입력하셨습니다."
//let pi: Double = 3.14


///넓이 구하는 공식
func area(type: String, lineA: Int, lineB: Int, height: Int) -> Double
{
    var returnValue: Double = 0
    
    if type == "square" {                                           //정사각형일 때
        if lineA > 0 && lineB == 0 && height == 0 {
            returnValue = Double(lineA * lineA)
        }else {
            print(errMsg)
            return 0
        }
    }else if type == "rectangle" {                                  //직사각형일 때
        if lineA > 0 && lineB > 0 && height == 0 {
            returnValue = Double(lineA * lineB)
        }else {
            print(errMsg)
            return 0
        }
    }else if type == "circle" {                                     //원일 때
        if lineA > 0 && lineB == 0 && height == 0 {
            returnValue = pi * Double(lineA * lineA)
        }else {
            print(errMsg)
            return 0
        }
    }else if type == "triangle" {                                   //삼각형일 때
        if lineA > 0 && lineB == 0 && height > 0 {
            returnValue = Double(lineA * height) / 2
        }else {
            print(errMsg)
            return 0
        }
    }else if type == "trapezoid" {                                  //사다리꼴일 때
        if lineA > 0 && lineB > 0 && height > 0 {
            returnValue = Double((lineA + lineB) * height) / 2
        }else {
            print(errMsg)
            return 0
        }
    }else {                                                         //타입 입력이 틀렸을 때
        print(typeMsg)
        return 0
    }
    return returnValue
}

///둘레 구하는 공식
func perimeter(type: String, lineA: Int, lineB: Int) -> Int
{
    var returnValue: Int = 0
    if type == "square" {                                           //정사각형일 때
        if lineA > 0 && lineB == 0 {
            returnValue = 4 * lineA
        }else {
            print(errMsg)
            return 0
        }
    }else if type == "rectangle" {                                  //사각형일 때
        if lineA > 0 && lineB > 0 {
            returnValue = 2 * (lineA + lineB)
        }else {
            print(errMsg)
            return 0
        }
    }else {
        print(typeMsg)
        return 0
    }
    return returnValue
}


///부피를 구하는 공식
//func volume(type: String, lineA: Int, lineB: Int, height: Int) -> Double
//{
//    var returnValue: Double = 0
//    //정육면체일 때
//    if type == "cube" {
//        if lineA > 0 && lineB == 0 && height == 0 {
//            returnValue = Double(lineA * lineA * lineA)
//        }else {
//            print(errMsg)
//            return 0
//        }
//    }else if type == "solid" {                              //직육면체일 때
//        if lineA > 0 && lineB > 0 && height > 0 {
//            returnValue = Double(lineA * lineB * height)
//        }else {
//            print(errMsg)
//            return 0
//        }
//    }else if type == "cylinder" {                           //원기둥일 때
//        if lineA > 0 && lineB == 0 && height > 0 {
//            returnValue = pi * Double(lineA * lineA * height)
//        }else {
//            print(errMsg)
//            return 0
//        }
//    }else if type == "sphere" {                             //구일 때
//        if lineA > 0 && lineB == 0 && height == 0 {
//            returnValue = 4 * pi * Double(lineA * lineA * lineA) / 3
//        }else {
//            print(errMsg)
//            return 0
//        }
//    }else if type == "cone" {                               //원뿔일 때
//        if lineA > 0 && lineB == 0 && height > 0 {
//            returnValue = pi * Double(lineA * lineA * height) / 3
//        }else {
//            print(errMsg)
//            return 0
//        }
//    }else {                                                 //타입 입력이 틀렸을 때
//        print(typeMsg)
//        return 0
//    }
//    return returnValue
//}

//var volumeAll: Double = volume(type: "cone", lineA: 3, lineB: 0, height: 10)
//print(volumeAll)

