//
//  ResetButton.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class ResetButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle("초기화", for: .normal)
        self.setTitleColor(.systemRed, for: .normal)
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
    }
}
