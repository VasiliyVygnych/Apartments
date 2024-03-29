//
//  ImageCollectionView.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class ImageCollectionView: UICollectionViewCell {
//MARK: - UIImageView
    var imageView: UIImageView = {
        let image = UIImageView(frame: CGRect.zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_15)
        image.backgroundColor = . gray
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
//MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
        self.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_7)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - extension
private extension ImageCollectionView {
    func initialization() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
