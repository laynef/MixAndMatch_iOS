//
//  MatchImages.swift
//  MixAndMatch
//
//  Created by Layne Faler on 5/2/16.
//  Copyright © 2016 Layne Faler. All rights reserved.
//

import Foundation
import UIKit

extension CollectionType {
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    mutating func shuffleInPlace() {
        if count < 2 { return }
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

enum matchImageType: String {
    case Cat
    case Robot
    case Dog
    case Adventurer
    case Pumpkid
    case Default
}

struct matchImage {
    let name: matchImageType
    var image: String
    var backColor: UIColor?
}

let matchImageArray: [matchImage] = [
    matchImage(name: .Cat, image: "CatIdle", backColor: UIColor(red: 11/255.0, green: 205/255.0, blue: 255/255.0, alpha: 1.0)),
    matchImage(name: .Cat, image: "CatJump", backColor: UIColor(red: 177/255.0, green: 152/255.0, blue: 151/255.0, alpha: 1.0)),
    matchImage(name: .Cat, image: "CatSlide", backColor: UIColor(red: 177/255.0, green: 153/255.0, blue: 114/255.0, alpha: 1.0)),
    matchImage(name: .Robot, image: "RobotIdle", backColor: UIColor(red: 164/255.0, green: 116/255.0, blue: 255/255.0, alpha: 1.0)),
    matchImage(name: .Robot, image: "RobotJump", backColor: UIColor(red: 167/255.0, green: 221/255.0, blue: 108/255.0, alpha: 1.0)),
    matchImage(name: .Robot, image: "RobotJumpMelee", backColor: UIColor(red: 177/255.0, green: 120/255.0, blue: 85/255.0, alpha: 1.0)),
    matchImage(name: .Robot, image: "RobotRunShoot", backColor: UIColor(red: 86/255.0, green: 68/255.0, blue: 76/255.0, alpha: 1.0)),
    matchImage(name: .Pumpkid, image: "PumpkidIdle", backColor: UIColor(red: 0/255.0, green: 150/255.0, blue: 93/255.0, alpha: 1.0)),
    matchImage(name: .Pumpkid, image: "PumpkidWalk", backColor: UIColor(red: 132/255.0, green: 177/255.0, blue: 49/255.0, alpha: 1.0)),
    matchImage(name: .Pumpkid, image: "PumpkidSlide", backColor: UIColor(red: 47/255.0, green: 92/255.0, blue: 177/255.0, alpha: 1.0)),
    matchImage(name: .Dog, image: "DogIdle", backColor: UIColor(red: 255/255.0, green: 155/255.0, blue: 177/255.0, alpha: 1.0)),
    matchImage(name: .Dog, image: "DogJump", backColor: UIColor(red: 133/255.0, green: 177/255.0, blue: 147/255.0, alpha: 1.0)),
    matchImage(name: .Dog, image: "DogSlide", backColor: UIColor(red: 172/255.0, green: 144/255.0, blue: 177/255.0, alpha: 1.0)),
    matchImage(name: .Adventurer, image: "AdventurerIdle", backColor: UIColor(red: 255/255.0, green: 150/255.0, blue: 93/255.0, alpha: 1.0)),
    matchImage(name: .Adventurer, image: "AdventurerShoot", backColor: UIColor(red: 80/255.0, green: 177/255.0, blue: 132/255.0, alpha: 1.0)),
    matchImage(name: .Adventurer, image: "AdventurerRun", backColor: UIColor(red: 177/255.0, green: 73/255.0, blue: 123/255.0, alpha: 1.0)),
    matchImage(name: .Adventurer, image: "AdventurerSlide", backColor: UIColor(red: 105/255.0, green: 133/255.0, blue: 177/255.0, alpha: 1.0)),
    matchImage(name: .Adventurer, image: "AdventurerMelee", backColor: UIColor(red: 177/255.0, green: 68/255.0, blue: 76/255.0, alpha: 1.0))
]

let deadMatchImageDict: [[matchImageType: matchImage]] = [
    [.Adventurer: matchImage(name: .Adventurer, image: "DeadAdventurer", backColor: nil)],
    [.Cat: matchImage(name: .Cat, image: "DeadCat", backColor: nil)],
    [.Dog: matchImage(name: .Dog, image: "DeadDog", backColor: nil)],
    [.Pumpkid: matchImage(name: .Pumpkid, image: "DeadPumpkid", backColor: nil)],
    [.Robot: matchImage(name: .Robot, image: "DeadRobot", backColor: nil)]
                                            
]

let defaultBacks =  matchImage(name: .Default, image: "back", backColor: UIColor(red:105/255.0, green: 155/255.0, blue: 177/255.0, alpha: 1.0))

func randomNumberInArray(number: Int) -> Int {
    let randomNumber = arc4random_uniform(UInt32(number))
    return Int(randomNumber)
}

func randomizedTwoMatches() -> (matchImage) {
    let randomNumber = randomNumberInArray(matchImageArray.count)
    return matchImageArray[randomNumber]
}

func assignOutlets(array ofOutlets:[AnyObject]) -> [matchImage] {
    var newOutlets: [matchImage] = []
    var i = 0
    while (i < ofOutlets.count) {
        let match = randomizedTwoMatches()
        newOutlets[i] = match
        i += 1
        newOutlets[i] = match
        i += 1
    }
    newOutlets.shuffleInPlace()
    return newOutlets
}
