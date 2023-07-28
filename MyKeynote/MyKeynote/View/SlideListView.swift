//
//  SlideListView.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/19.
//

import Foundation
import UIKit
//좌측 뷰
protocol SlideListViewDelegate: AnyObject {
    func addSlideButtonTapped()
}

class SlideListView : UIView{
    
    enum LayoutConstants{
        static let BUTTON_HEIGHT = 70.0
    }
    weak var delegate: SlideListViewDelegate?
    
    private var tableView : UITableView?
    private var addSlideButton : UIButton?
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layout()
        attribute()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        attribute()
    }
    
    override func layoutSubviews() {
        
        layout()
        attribute()
        tableView?.frame = .init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - LayoutConstants.BUTTON_HEIGHT)
        addSlideButton?.frame = .init(x: 0, y: self.bounds.maxY - LayoutConstants.BUTTON_HEIGHT, width: self.bounds.width, height:  LayoutConstants.BUTTON_HEIGHT)
    }
    
    
    func attribute(){
        tableView?.dragInteractionEnabled = true
        tableView?.backgroundColor = .lightGray
        addSlideButton?.setTitle("(+)", for: .normal)
        addSlideButton?.backgroundColor = .systemCyan
        addSlideButton?.layer.cornerRadius = 10.0
        tableView?.reloadData()
    }
    
    func layout(){
        guard tableView == nil else { return }
        tableView = UITableView()
        tableView?.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView?.frame = .init(x: 0, y: 0, width: self.bounds.width,
                                 height: self.bounds.height - LayoutConstants.BUTTON_HEIGHT)
        
        addSlideButton = UIButton()
        addSlideButton?.frame = .init(x: 0, y: self.bounds.maxY - LayoutConstants.BUTTON_HEIGHT,
                                      width: self.bounds.width, height: LayoutConstants.BUTTON_HEIGHT)
        if let tableView = tableView,
            let button = addSlideButton {
            self.addSubview(tableView)
            self.addSubview(button)
        }
        
        addSlideButton?.addTarget(self, action: #selector(addSlideButtonTapped), for: .touchUpInside)
        
        
    }
    
    @objc func addSlideButtonTapped() {
        delegate?.addSlideButtonTapped()
        self.tableView?.reloadData()
        let lastIndex = (tableView?.numberOfRows(inSection: 0) ?? 0) - 1
        let indexPath = IndexPath(row: lastIndex, section: 0)
        tableView?.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
    }
    
    func setTableViewDataSource<T : UITableViewDataSource>(dataSource : T){
        tableView?.dataSource = dataSource
    }
    func setTableViewDelegate<T : UITableViewDelegate>(delegate : T){
        tableView?.delegate = delegate
    }
    func setSlideListDelegate<T : SlideListViewDelegate>(delegator : T){
        self.delegate = delegator
    }
    
    func setTableViewDragDelegate<T : UITableViewDragDelegate>(delegator : T){
        tableView?.dragDelegate = delegator
    }
    func setTableViewDropDelegate<T : UITableViewDropDelegate>(delegator : T){
        tableView?.dropDelegate = delegator
    }
    
    
    
}
