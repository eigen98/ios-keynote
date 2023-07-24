//
//  CompositionRoot.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/24.
//

import Foundation
enum CompositionRoot{
    static var rootViewController : KeynoteViewController{
        KeynoteViewController(slideManager: slideManager)
    }
    
    private static var slideManager : SlideManager{
        SlideManager(componentFactory: componentFactory as! SlideComponentFactory, slideFactory: slideFactory as! SlideFactory , slideCollection: slideCollection)
    }
    
    private static var componentFactory : SlideComponentFactoryProtocol{
        SlideComponentFactory()
    }
    
    private static var slideFactory : SlideFactoryProtocol{
        SlideFactory()
    }
    
    private static var slideCollection : SlideCollection{
        SlideCollection()
    }
    
    
    
    
    
}
