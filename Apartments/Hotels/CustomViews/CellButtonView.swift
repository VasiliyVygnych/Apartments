//
//  CellButtonView.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 30.01.2024.
//

import UIKit
import SnapKit

class CellButtonView: UIView {
    
    var presenter: HotelPresenterProtocol?
    var model: HotelModel?
    
//MARK: - UIView
    private var conteinerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
//MARK: - UIButton
    var button: UIButton = {
      let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Text.nextScreenRoom,
                        for: .normal)
        button.setTitleColor(.white,
                             for: .normal)
        button.backgroundColor = UIColor(named: "primaryButtons")
        button.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_15)
       return button
   }()
//MARK: - init
    init() {
        super.init(frame: .zero)
        initialization()
        setupeConstraint()
        setupeButton()
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_12)
        self.clipsToBounds = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - setupeButton
    func setupeButton() {
        button.addTarget(self,
                             action: #selector(hotelRoom),
                             for: .touchUpInside)
    }
//MARK: - @objc func hotelRoom
    @objc func hotelRoom(sender: UIButton) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            self.button.transform = CGAffineTransform(scaleX: 0.75,
                                                          y: 0.75)
        }, completion: { finished in
            guard let model = self.model else { return }
            self.presenter?.goHotrlRoomViews(model: model)
        })
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            self.button.transform = CGAffineTransform(scaleX: 1,
                                                          y: 1)
        }, completion: nil)
    }
}
//MARK: - extension
private extension CellButtonView {
    func initialization() {
        self.addSubview(conteinerView)
        conteinerView.addSubview(button)
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        conteinerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.width.equalToSuperview().inset(Integers.Constraints.sideMargins)
            make.left.equalTo(Integers.Constraints.sideMargins)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
        }
    }
}
