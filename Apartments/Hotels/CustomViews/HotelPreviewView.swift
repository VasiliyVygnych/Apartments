//
//  HotelPreviewView.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class HotelPreviewView: UIView {

//MARK: - UIView
    private var collectionView: CollectionView = {
        let view = CollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private var ratingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "frameRating")
        view.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_5)
        view.layer.shadowOpacity = 0.2
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 1,
                                           height: 1)
        view.layer.shadowColor = UIColor.black.cgColor
        return view
    }()
//MARK: - UILabel
     var nameHotelLabbel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_22),
                                   weight: .regular)
        return label
    }()
     var priseLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_30),
                                   weight: .bold)
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
     var infoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .light)
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
//MARK: - UIButton
    var adressButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(named: "primaryButtons"),
                             for: .normal)
        return button
    }()
//MARK: - init
    init() {
        super.init(frame: .zero)
        initialization()
        setupeConstraint()
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_12)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func dataSet(model: HotelModel) {
        self.nameHotelLabbel.text = model.name
        UserDefaults.standard.set(model.name,
                                  forKey: "hotelName")
        self.hotelAddressLabel.text = model.adress
        self.infoLabel.text = model.priceForIt
        self.raitingNameLabel.text = model.ratingName
        let minimalPrise = "\(Constants.Text.miminalPrise) \(model.minimalPrice) \(Constants.Text.currency)"
        self.priseLabel.text = minimalPrise
        self.raitingLabel.text = String(model.rating)
        self.collectionView.model = model
    }
}
//MARK: - extension
private extension HotelPreviewView {
    func initialization() {
        self.addSubview(topView)
        self.addSubview(collectionView)
        self.addSubview(ratingView)
        ratingView.addSubview(star)
        self.addSubview(nameHotelLabbel)
        self.addSubview(priseLabel)
        self.addSubview(adressButton)
        adressButton.addSubview(hotelAddressLabel)
        self.addSubview(infoLabel)
        ratingView.addSubview(raitingNameLabel)
        ratingView.addSubview(raitingLabel)
        adressButton.addTarget(self,
                               action: #selector(tabAdresButton),
                               for: .touchUpInside)
    }
    @objc func tabAdresButton() {
        print("tap adressButton")
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(10)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.width.equalToSuperview().inset(Integers.Constraints.sideMargins)
            make.left.equalTo(Integers.Constraints.sideMargins)
            make.height.equalTo(257)
        }
        ratingView.snp.makeConstraints { make in
            make.top.equalTo(310)
            make.width.equalTo(149)
            make.height.equalTo(29)
            make.leading.equalTo(Integers.Constraints.sideMargins)
        }
        nameHotelLabbel.snp.makeConstraints { make in
            make.top.equalTo(350)
            make.height.equalTo(60)
            make.width.equalTo(400)
            make.leading.equalTo(Integers.Constraints.sideMargins)
        }
        adressButton.snp.makeConstraints { make in
            make.top.equalTo(nameHotelLabbel.snp.bottom).inset(-5)
            make.height.equalTo(20)
            make.width.equalTo(343)
            make.leading.equalTo(Integers.Constraints.sideMargins)
        }
        priseLabel.snp.makeConstraints { make in
            make.top.equalTo(468)
            make.height.equalTo(36)
            make.leading.equalTo(18)
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(482)
            make.height.equalTo(19)
            make.leading.equalTo(priseLabel.snp.trailing).inset(-10)
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

