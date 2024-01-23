//
//  InfoView.swift
//  Apartments
//
//  Created by maryana Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class InfoView: UIView {
    
//MARK: - UILabel
    private var labelFrom: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
        label.text = Constants.Text.labelFrom
        return label
    }()
    private var labelIn: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
        label.text = Constants.Text.labelIn
        return label
    }()
    private var labelData: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
        label.text = Constants.Text.labelData
        return label
    }()
    private var numberOfNights: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
        label.text = Constants.Text.numberOfNights
        return label
    }()
    private var hotelLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
        label.text = Constants.Text.hotelLabel
        return label
    }()
     var roomLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
         label.text = Constants.Text.roomLabel
        return label
    }()
    private var foodLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
        label.text = Constants.Text.foodLabel
        return label
    }()
    var countrylabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
     return label
    }()
    var countryAndCity: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .sFProDisplay(ofSize: 16,
                                    weight: .regular)
     return label
    }()
    var datesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
     return label
    }()
    var nightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
     return label
    }()
    var hotelNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
     return label
    }()
    var roomsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
     return label
    }()
    var foodsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .regular)
     return label
    }()
//MARK: - init
    init() {
        super.init(frame: .zero)
        initialization()
        setupeConstraint()
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - configures
    func configures(model: BookimgModel,
                    room: Room) {
        countrylabel.text = model.departure
        countryAndCity.text = model.arrivalCountry
        datesLabel.text = "\(model.tourDateStart) - \(model.tourDateStop)"
        nightLabel.text = String(model.numberOfNights)
        hotelNameLabel.text = model.hotelName
        roomsLabel.text = room.name
        foodsLabel.text = model.nutrition
    }
}
//MARK: - extension
private extension InfoView {
    func initialization() {
        self.addSubview(labelFrom)
        self.addSubview(labelIn)
        self.addSubview(labelData)
        self.addSubview(numberOfNights)
        self.addSubview(hotelLabel)
        self.addSubview(roomLabel)
        self.addSubview(foodLabel)
        self.addSubview(countrylabel)
        self.addSubview(countryAndCity)
        self.addSubview(datesLabel)
        self.addSubview(nightLabel)
        self.addSubview(hotelNameLabel)
        self.addSubview(roomsLabel)
        self.addSubview(foodsLabel)
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        labelFrom.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.height.equalTo(19)
            make.width.equalTo(110)
            make.left.equalTo(16)
        }
        labelIn.snp.makeConstraints { make in
            make.top.equalTo(51)
            make.height.equalTo(19)
            make.width.equalTo(150)
            make.left.equalTo(16)
        }
        labelData.snp.makeConstraints { make in
            make.top.equalTo(86)
            make.height.equalTo(19)
            make.width.equalTo(100)
            make.left.equalTo(16)
        }
        numberOfNights.snp.makeConstraints { make in
            make.top.equalTo(121)
            make.height.equalTo(19)
            make.width.equalTo(150)
            make.left.equalTo(16)
        }
        hotelLabel.snp.makeConstraints { make in
            make.top.equalTo(156)
            make.height.equalTo(19)
            make.width.equalTo(100)
            make.left.equalTo(16)
        }
        roomLabel.snp.makeConstraints { make in
            make.top.equalTo(191)
            make.height.equalTo(19)
            make.width.equalTo(100)
            make.left.equalTo(16)
        }
        foodLabel.snp.makeConstraints { make in
            make.top.equalTo(245)
            make.height.equalTo(19)
            make.width.equalTo(100)
            make.left.equalTo(16)
        }
        countrylabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.height.equalTo(19)
            make.width.equalTo(203)
            make.left.equalTo(156)
        }
        countryAndCity.snp.makeConstraints { make in
            make.top.equalTo(51)
            make.height.equalTo(19)
            make.width.equalTo(203)
            make.left.equalTo(156)
        }
        datesLabel.snp.makeConstraints { make in
            make.top.equalTo(86)
            make.height.equalTo(19)
            make.width.equalTo(203)
            make.left.equalTo(156)
        }
        nightLabel.snp.makeConstraints { make in
            make.top.equalTo(121)
            make.height.equalTo(19)
            make.width.equalTo(203)
            make.left.equalTo(156)
        }
        hotelNameLabel.snp.makeConstraints { make in
            make.top.equalTo(150)
            make.height.equalTo(40)
            make.width.equalTo(203)
            make.left.equalTo(156)
        }
        roomsLabel.snp.makeConstraints { make in
            make.top.equalTo(191)
            make.height.equalTo(50)
            make.width.equalTo(203)
            make.left.equalTo(156)
        }
        foodsLabel.snp.makeConstraints { make in
            make.top.equalTo(245)
            make.height.equalTo(19)
            make.width.equalTo(203)
            make.left.equalTo(156)
        }
    }
}
