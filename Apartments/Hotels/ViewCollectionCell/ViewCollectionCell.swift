//
//  ViewCollectionCell.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class ViewCollectionCell: UICollectionViewCell {
    
//MARK: - label
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16,
                                 weight: .light)
        label.textColor = UIColor(named: "textGrey")
        return label
    }()
//MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_5)
        self.layer.shadowOpacity = 0.2
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1,
                                           height: 1)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - extension
private extension ViewCollectionCell {
    func initialization() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
    }
}
