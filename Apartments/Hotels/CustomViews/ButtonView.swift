//
//  ButtonView.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class ButtonView: UIView {
//MARK: - UIView
    private var intermediateView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "gray")
        return view
    }()
    private var secondInterView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "gray")
        return view
    }()
//MARK: - UIButton
    private var firstButtonView: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "backgroundGray")
        return button
    }()
    private var secondButtonView: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "backgroundGray")
        return button
    }()
    private var threeButtonView: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "backgroundGray")
        return button
    }()
//MARK: - UILabel
    private var firstTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.Text.firstTitle
        label.textColor = .black
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
        return label
    }()
    private var firstSubtitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_14),
                                   weight: .regular)
        label.text = Constants.Text.firstSubtitle
        return label
    }()
    private var secondTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.Text.secondTitle
        label.textColor = .black
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
        return label
    }()
    private var secondSubtitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.Text.firstSubtitle
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_14),
                                   weight: .regular)
        return label
    }()
    private var threeTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_16),
                                   weight: .regular)
        label.text = Constants.Text.threeTitle
        return label
    }()
    private var threeSubtitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.Text.threeSubtitle
        label.textColor = UIColor(named: "textGrey")
        label.font = .sFProDisplay(ofSize: CGFloat(Integers.FontSize.size_14),
                                   weight: .regular)
        return label
    }()
//MARK: - UIImageView
    private var firstButtonImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "arrow3")
        return image
    }()
    private var firstImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "emoji-happy")
        return image
    }()
    private var secondButtonImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "arrow3")
        return image
    }()
    private var secondImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "tick-square")
        return image
    }()
    private var threeButtonImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "arrow3")
        return image
    }()
    private var threeImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "close-square")
        return image
    }()
//MARK: - init
    init() {
        super.init(frame: .zero)
        initialization()
        setupeConstraint()
        setupeButton()
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(Integers.CornerRadius.size_12)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - setupeButton
    private func setupeButton() {
        firstButtonView.addTarget(self,
                                  action: #selector(firstTarget),
                                  for: .touchUpInside)
        secondButtonView.addTarget(self,
                                   action: #selector(secondTarget),
                                   for: .touchUpInside)
        threeButtonView.addTarget(self,
                                  action: #selector(thirdTarget),
                                  for: .touchUpInside)
    }
    @objc func firstTarget() {
        clickAnimation(view: firstButtonView)
        print("firstButtonView")
    }
    @objc func secondTarget() {
        clickAnimation(view: secondButtonView)
        print("secondButtonView")
    }
    @objc func thirdTarget() {
        clickAnimation(view: threeButtonView)
        print("threeButtonView")
    }
//MARK: - clickAnimation
    func clickAnimation(view: UIView) {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            view.transform = CGAffineTransform(scaleX: 0.70,
                                                 y: 0.70)
            view.layer.cornerRadius = 10
        }, completion: nil)
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            view.transform = CGAffineTransform(scaleX: 1,
                                                 y: 1)
        }, completion: nil)
    }
}
//MARK: - extension
private extension ButtonView {
    func initialization() {
        self.addSubview(intermediateView)
        self.addSubview(firstButtonView)
        self.addSubview(secondInterView)
        firstButtonView.addSubview(firstImage)
        firstButtonView.addSubview(firstTitle)
        firstButtonView.addSubview(firstSubtitle)
        firstButtonView.addSubview(firstButtonImage)
        self.addSubview(secondButtonView)
        secondButtonView.addSubview(secondImage)
        secondButtonView.addSubview(secondTitle)
        secondButtonView.addSubview(secondSubtitle)
        secondButtonView.addSubview(secondButtonImage)
        self.addSubview(threeButtonView)
        threeButtonView.addSubview(threeImage)
        threeButtonView.addSubview(threeTitle)
        threeButtonView.addSubview(threeSubtitle)
        threeButtonView.addSubview(threeButtonImage)
    }
    //MARK: - setupeConstraint
    func setupeConstraint() {
        firstButtonView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(18)
            make.height.equalTo(38)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        firstImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
            make.left.equalTo(18)
        }
        firstTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(60)
            make.height.equalTo(19)
        }
        firstSubtitle.snp.makeConstraints { make in
            make.top.equalTo(firstTitle.snp.bottom)
            make.left.equalTo(60)
            make.height.equalTo(17)
        }
        firstButtonImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
            make.right.equalTo(-18)
        }
        intermediateView.snp.makeConstraints { make in
            make.top.equalTo(firstButtonView.snp.bottom).inset(-8)
            make.width.equalTo(310)
            make.height.equalTo(0.5)
            make.trailing.equalToSuperview().inset(18)
        }
        secondInterView.snp.makeConstraints { make in
            make.top.equalTo(secondButtonView.snp.bottom).inset(-8)
            make.width.equalTo(310)
            make.height.equalTo(0.5)
            make.trailing.equalToSuperview().inset(18)
        }
        secondButtonView.snp.makeConstraints { make in
            make.top.equalTo(firstButtonView.snp.bottom).inset(-18)
            make.height.equalTo(38)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        secondImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
            make.left.equalTo(18)
        }
        secondTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(60)
            make.height.equalTo(19)
        }
        secondSubtitle.snp.makeConstraints { make in
            make.top.equalTo(secondTitle.snp.bottom)
            make.left.equalTo(60)
            make.height.equalTo(17)
        }
        secondButtonImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
            make.right.equalTo(-18)
        }
        threeButtonView.snp.makeConstraints { make in
            make.top.equalTo(secondButtonView.snp.bottom).inset(-18)
            make.height.equalTo(38)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        threeImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
            make.left.equalTo(18)
        }
        threeTitle.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(60)
            make.height.equalTo(19)
        }
        threeSubtitle.snp.makeConstraints { make in
            make.top.equalTo(threeTitle.snp.bottom)
            make.left.equalTo(60)
            make.height.equalTo(17)
        }
        threeButtonImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
            make.right.equalTo(-18)
        }
    }
}
