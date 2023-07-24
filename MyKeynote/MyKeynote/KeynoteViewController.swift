//
//  ViewController.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/17.
//

import UIKit

class KeynoteViewController: UIViewController {

    private var keynoteView : KeynoteView?
    private var slideManager = SlideManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        slideManager.delegate = keynoteView
        keynoteView?.slideDataSource = slideManager
        attribute()
        update()
        
    }
    
    func layout(){
        keynoteView = KeynoteView()
        
        guard let keynoteView = keynoteView else { return }
        self.view.addSubview(keynoteView)
        keynoteView.translatesAutoresizingMaskIntoConstraints = false
        keynoteView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        keynoteView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        keynoteView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        keynoteView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        keynoteView.layout()
        keynoteView.attribute()
    }
    
    func attribute(){
        
    }
    
    func update(){
        
        
        slideManager.addSlide()
        slideManager.addCompnent()
        keynoteView?.slideDataSource = slideManager
        keynoteView?.update()
       
    }


}

