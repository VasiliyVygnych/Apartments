//
//  ResultView.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class ResultView: UIView {
    
//MARK: - UILabel
    private var totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
        label.text = Constants.Text.turlLabel
     return label
    }()
    private var fuelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
        label.text = Constants.Text.fuelLabel
     return label
    }()
    private var serviseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
        label.text = Constants.Text.serviseLabel
     return label
    }()
    private var paymentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
        label.text = Constants.Text.paymentLabel
     return label
    }()
    var totalIntLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
     return label
    }()
    var fuelIntLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
     return label
    }()
    var serviseIntLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
     return label
    }()
    var paymentIntLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "primaryButtons")
        label.numberOfLines = 0
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
     return label
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
    func configures(model: BookimgModel,
                    room: Room) {
        let tourPrice = room.price
        let fuelCharge = model.fuelCharge
        let serviceCharge = model.serviceCharge
        let totalCost = (tourPrice + fuelCharge + serviceCharge)
        fuelIntLabel.text = String(fuelCharge)
        serviseIntLabel.text = String(serviceCharge)
        paymentIntLabel.text = String(totalCost)
        totalIntLabel.text = String(room.price)
    }
}
//MARK: - extension
private extension ResultView {
    func initialization() {
        self.addSubview(totalLabel)
        self.addSubview(fuelLabel)
        self.addSubview(serviseLabel)
        self.addSubview(paymentLabel)
        self.addSubview(totalIntLabel)
        self.addSubview(fuelIntLabel)
        self.addSubview(serviseIntLabel)
        self.addSubview(paymentIntLabel)
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.height.equalTo(19)
            make.width.equalTo(35)
            make.left.equalTo(Integers.Constraints.sideMargins)
        }
        fuelLabel.snp.makeConstraints { make in
            make.top.equalTo(51)
            make.height.equalTo(19)
            make.width.equalTo(150)
            make.left.equalTo(Integers.Constraints.sideMargins)
        }
        serviseLabel.snp.makeConstraints { make in
            make.top.equalTo(86)
            make.height.equalTo(19)
            make.width.equalTo(150)
            make.left.equalTo(Integers.Constraints.sideMargins)
        }
        paymentLabel.snp.makeConstraints { make in
            make.top.equalTo(121)
            make.height.equalTo(19)
            make.width.equalTo(100)
            make.left.equalTo(Integers.Constraints.sideMargins)
        }
        totalIntLabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.height.equalTo(19)
            make.width.equalTo(150)
            make.trailing.equalTo(-Integers.Constraints.sideMargins)
        }
        fuelIntLabel.snp.makeConstraints { make in
            make.top.equalTo(51)
            make.height.equalTo(19)
            make.width.equalTo(150)
            make.trailing.equalTo(-Integers.Constraints.sideMargins)
        }
        serviseIntLabel.snp.makeConstraints { make in
            make.top.equalTo(86)
            make.height.equalTo(19)
            make.width.equalTo(150)
            make.trailing.equalTo(-Integers.Constraints.sideMargins)
        }
        paymentIntLabel.snp.makeConstraints { make in
            make.top.equalTo(121)
            make.height.equalTo(19)
            make.width.equalTo(150)
            make.trailing.equalTo(-Integers.Constraints.sideMargins)
        }
    }
}
