//
//  SlideManager.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/19.
//

import Foundation

struct SlideManager{
    private let factory = SlideFactory()
    var slideArray : [Slide]
    //슬라이드 전체 개수를 알려주는 메소드 (또는 computed property)가 있다.
    var slideCount : Int {
        return slideArray.count
    }
    //Subscrit로 index를 넘기면 해당 슬라이드 모델을 return한다.
    subscript(index: Int) -> Slide? {
        return (index >= 0 && index < slideArray.count) ? slideArray[index] : nil
    }
    
    //새로운 슬라이드를 생성하고 나면 내부에 추가한다.
    mutating func addSlide(){
        let newSlide = factory.createRandomSlide()
        slideArray.append(newSlide)
    }
    
    //현재 선택된 슬라이드?
}

