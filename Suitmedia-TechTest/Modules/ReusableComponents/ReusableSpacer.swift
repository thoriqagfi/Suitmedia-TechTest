//
//  ReusableSpacer.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import UIKit

final class ReusableSpacer: UIView {
    init() {
        super.init(frame: .zero)
        self.setContentHuggingPriority(.defaultLow, for: .vertical)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: UIView.noIntrinsicMetric, height: 8)
    }
}
