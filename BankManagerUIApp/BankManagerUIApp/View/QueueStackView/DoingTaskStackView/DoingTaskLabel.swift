//
//  DoingTaskLabel.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/14.
//

import UIKit

final class DoingTaskLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setContentCompressionResistancePriority(.required, for: .vertical)
        self.setContentHuggingPriority(.required, for: .vertical)
        self.textAlignment = .center
        self.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        self.text = "업무중"
        self.textColor = .white
        self.backgroundColor = .systemIndigo
    }
}
