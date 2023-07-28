//
//  SlideListTableViewCell.swift
//  MyKeynote
//
//  Created by KoJeongMin  on 2023/07/27.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    let label = UILabel()
    let imageViewRight = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initSubviews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
        layout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        layer.borderWidth = selected == true ? 4.0 : 0.0
        layer.borderColor = UIColor.blue.cgColor
    }
    
    func initSubviews() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        imageViewRight.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        contentView.addSubview(imageViewRight)
        
    }
    
    func layout() {
        label.widthAnchor.constraint(equalToConstant: 30).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        imageViewRight.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageViewRight.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageViewRight.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75).isActive = true
        imageViewRight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        
    }
}
