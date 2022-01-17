//
//  AvatarImageView.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 21/05/1443 AH.
//

import UIKit

@IBDesignable

class AvatarImageView: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
        configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        backgroundColor = .systemGray3
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width/2
    }
    
    override func prepareForInterfaceBuilder() {
        configureView()
    }
}
