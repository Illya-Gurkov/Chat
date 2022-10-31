//
//  SliderSlides.swift
//  Chat
//
//  Created by Illya Gurkov on 29.10.22.
//

import Foundation
import UIKit

class SliderSlides{
    func getSlides() -> [Slides]{
        var slides: [Slides] = []
        let slide1 = Slides(id: 1, text: "text1", img: UIImage(imageLiteralResourceName: "images-1"))
        let slide2 = Slides(id: 2, text: "text2", img: UIImage(imageLiteralResourceName: "Unknown-1"))
        let slide3 = Slides(id: 3, text: "text3", img: UIImage(imageLiteralResourceName: "Unknown"))
        
        slides.append(slide1)
        slides.append(slide2)
        slides.append(slide3)
        return slides
    }
}
