//
//  SortButtonView.swift
//  ProgrammaticView
//
//  Created by Lucas Vasconcellos Côrtes on 5/15/26.
//

import UIKit

final class SortButtonView: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupView() {
        
        configuration = UIButton.Configuration.filled()
        configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        tintColor = .white.withAlphaComponent(0.15)
        
        configuration?.cornerStyle = .fixed
        layer.cornerRadius = 6
    
        setTitle("Sort", for: .normal)
        setTitleColor(.white, for: .normal)
        
        titleLabel?.font = UIFontMetrics(forTextStyle: .subheadline)
            .scaledFont(for: UIFont.systemFont(ofSize: 14, weight: .bold))
        titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
    func setupActions() {
            addTarget(
                self,
                action: #selector(didTapButton),
                for: .touchUpInside
            )
        }
    
    @objc func didTapButton() {
        print("Sort tapped")
    }
}
