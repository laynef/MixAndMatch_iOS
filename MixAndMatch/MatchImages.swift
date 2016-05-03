//
//  MatchImages.swift
//  MixAndMatch
//
//  Created by Layne Faler on 5/2/16.
//  Copyright © 2016 Layne Faler. All rights reserved.
//

import Foundation
import UIKit

struct matchImage {
    let name: String
    var image: String
    var backColor: UIColor
}

let matchImagesArray = [matchImage(name: "Cat", image: "Cat", backColor: UIColor(red: 11/255.0, green: 205/255.0, blue: 255/255.0, alpha: 1.0)), matchImage(name: "Robot", image: "Robot", backColor: UIColor(red: 164/255.0, green: 116/255.0, blue: 255/255.0, alpha: 1.0)), matchImage(name: "Adventurer", image: "Adventurer", backColor: UIColor(red: 255/255.0, green: 150/255.0, blue: 93/255.0, alpha: 1.0)), matchImage(name: "Pumpkid", image: "PumpkidIdle", backColor: UIColor(red: 0/255.0, green: 150/255.0, blue: 93/255.0, alpha: 1.0)),  matchImage(name: "Dog", image: "Dog", backColor: UIColor(red: 255/255.0, green: 155/255.0, blue: 177/255.0, alpha: 1.0)),  matchImage(name: "Backs", image: "back", backColor: UIColor(red:105/255.0, green: 155/255.0, blue: 177/255.0, alpha: 1.0))]