//
//  PaymentScreenView.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class PaymentScreenView: UIViewController {
    
//MARK: - UIView
    private var contentView: UIView = {
        let UIview = UIView()
        UIview.translatesAutoresizingMaskIntoConstraints = false
        UIview.backgroundColor = .white
        return UIview
    }()
    private var conteinerButton: UIView = {
        let UIview = UIView()
        UIview.translatesAutoresizingMaskIntoConstraints = false
        UIview.backgroundColor = .white
        return UIview
    }()
//MARK: - image
    private var imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "Frame")
        return image
    }()
//MARK: - Label
    private var acceptedLabdel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = .sFProDisplay(ofSize: 25,
                                   weight: .regular)
        label.text = Constants.Text.acceptedLabdel
        return label
    }()
    private var infoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .sFProDisplay(ofSize: 16,
                                   weight: .light)
        label.text = Constants.Text.infoLabel
        return label
    }()
//MARK: - button
    private var nextScreenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Text.nextScreenButton,
                        for: .normal)
        button.setTitleColor(.white,
                             for: .normal)
        button.backgroundColor = UIColor(named: "primaryButtons")
        button.layer.cornerRadius = 15
        return button
    }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = Constants.Text.navTitlePayment
        setupeView()
        setupeConstraint()
        setupeButton()
        setupeBackButoon()
    }
//MARK: - setupeBackButoon
    private func setupeBackButoon() {
        let backButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButton"),
                                                          style: .plain,
                                                          target: self,
                                                          action: #selector(back))
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
//MARK: - setupeButton
    private func setupeButton() {
        nextScreenButton.addTarget(self,
                                   action: #selector(nextScreen),
                                   for: .touchUpInside)
    }
    @objc func nextScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
//MARK: - setupeView
    private func setupeView() {
        view.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(acceptedLabdel)
        contentView.addSubview(infoLabel)
        view.addSubview(conteinerButton)
        conteinerButton.addSubview(nextScreenButton)
    }
//MARK: - setupeConstraint
    private func setupeConstraint() {
        contentView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.width.equalToSuperview()
            make.bottom.equalTo(conteinerButton.snp.top).inset(-1)
        }
        conteinerButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(88)
            make.bottom.equalTo(0)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(223)
            make.width.equalTo(94)
            make.height.equalTo(94)
            make.centerX.equalToSuperview()
        }
        acceptedLabdel.snp.makeConstraints { make in
            make.top.equalTo(349)
            make.height.equalTo(26)
            make.centerX.equalToSuperview()
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(395)
            make.width.equalTo(400)
            make.height.equalTo(95)
            make.centerX.equalToSuperview()
        }
        nextScreenButton.snp.makeConstraints { make in
            make.top.equalTo(conteinerButton.snp.top).inset(10)
            make.width.equalTo(385)
            make.height.equalTo(48)
            make.centerX.equalToSuperview()
        }
    }
}
