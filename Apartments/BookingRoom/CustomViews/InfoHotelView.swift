//
//  InfoHotelView.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class InfoHotelView: UIView {
    
//MARK: - UIView
    private var ratingView: UIView = {
        let UIview = UIView()
        UIview.translatesAutoresizingMaskIntoConstraints = false
        UIview.backgroundColor = UIColor(named: "frameRating")
        UIview.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_5)
        UIview.layer.shadowOpacity = 0.2
        UIview.layer.masksToBounds = false
        UIview.layer.shadowOffset = CGSize(width: 1,
                                           height: 1)
        UIview.layer.shadowColor = UIColor.black.cgColor
        return UIview
    }()
//MARK: - UILabel
    var nameHotelLabbel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: CGFloat(Integers.FontSize.size_22),
                                 weight: .regular)
        return label
    }()
    var hotelAddressLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "primaryButtons")
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_14),
                                   weight: .regular)
        return label
    }()
    var raitingNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textRating")
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
        return label
    }()
    var raitingLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textRating")
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
        return label
    }()
//MARK: - UIImageView
    private var star: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "star")
        return image
    }()
//MARK: - init
    init() {
        super.init(frame: .zero)
        initialization()
        setupeConstraint()
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_15)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - configures
    func configures(model: BookimgModel) {
        nameHotelLabbel.text = model.hotelName
        hotelAddressLabel.text = model.hotelAdress
        raitingNameLabel.text = model.ratingName
        raitingLabel.text = String(model.horating)
    }
}
//MARK: - extension
private extension InfoHotelView {
    func initialization() {
        self.addSubview(ratingView)
        ratingView.addSubview(star)
        self.addSubview(nameHotelLabbel)
        self.addSubview(hotelAddressLabel)
        ratingView.addSubview(raitingNameLabel)
        ratingView.addSubview(raitingLabel)
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.height.equalTo(29)
            make.width.equalTo(149)
            make.left.equalTo(Integers.Constraints.sideMargins)
        }
        nameHotelLabbel.snp.makeConstraints { make in
            make.top.equalTo(ratingView.snp.bottom).inset(-10)
            make.height.lessThanOrEqualTo(55)
            make.width.equalTo(400)
            make.left.equalTo(Integers.Constraints.sideMargins)
        }
        hotelAddressLabel.snp.makeConstraints { make in
            make.top.equalTo(nameHotelLabbel.snp.bottom).inset(-10)
            make.height.equalTo(17)
            make.width.equalTo(343)
            make.left.equalTo(Integers.Constraints.sideMargins)
        }
        raitingNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(raitingLabel.snp.right).inset(-5)
        }
        raitingLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(star.snp.right).inset(-5)
        }
        star.snp.makeConstraints { make in
            make.width.height.equalTo(15)
            make.left.equalTo(5)
            make.centerY.equalToSuperview()
        }
    }
}
