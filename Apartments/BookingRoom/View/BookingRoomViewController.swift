//
//  BookingRoomViewController.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 10.01.2024.
//

import UIKit
import SnapKit

class BookingRoomViewController: UIViewController {
    
    var presenter: BookingPresenterProtocol?
    private var roomModel: Room?
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width,
               height: view.frame.height)
    }
//MARK: - UIScrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .white
        scrollView.contentSize = contentSize
        return scrollView
    }()
//MARK: - UIStackView
    private var stackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.layer.cornerRadius = 15
        stack.backgroundColor = UIColor(named: "gray")
        return stack
    }()
//MARK: - UIView
    private var infoView: InfoView = {
        let view = InfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var infoHotelView: InfoHotelView = {
        let view = InfoHotelView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var infoBuyerView: InfoBuyerView = {
        let view = InfoBuyerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var resultView: ResultView = {
        let view = ResultView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var addTouristView: NewTourustView = {
        let view = NewTourustView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "gray")
        return view
    }()
    private var conteinerButton: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private var addButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    private var touristView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .blue
        return view
    }()
//MARK: - UILabel
    private var buttonLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .sFProDisplay(ofSize: 18,
                                   weight: .regular)
        return label
    }()
    private var labelAddTourist: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = Constants.Text.labelAddTourist
        label.font = .sFProDisplay(ofSize: 22,
                                   weight: .regular)
        return label
    }()
//MARK: - button
    private var paymentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white,
                             for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(named: "primaryButtons3")
        button.isUserInteractionEnabled = false
        return button
    }()
    private var addNewTouristButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "plus"),
                                  for: .normal)
        button.backgroundColor = UIColor(named: "primaryButtons")
        button.layer.cornerRadius = 6
        return button
    }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Text.navTitleBooking
        presenter?.viewDidLoad()
        setupeView()
        setupeConstraint()
        setupeButton()
        setupeBackButoon()
        setPresenter()
        buttonIsActiveted()
        let tapGesture = UITapGestureRecognizer(target: view,
                                                action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tapGesture)
    }
//MARK: - buttonIsActiveted
    private func buttonIsActiveted() {
        presenter?.showButton = {
            self.paymentButton.backgroundColor = UIColor(named: "primaryButtons")
            self.paymentButton.isUserInteractionEnabled = true
        }
        presenter?.hiddenButton = {
            self.paymentButton.backgroundColor = UIColor(named: "primaryButtons3")
            self.paymentButton.isUserInteractionEnabled = false
        }
    }
//MARK: - set presenter for custom views
    private func setPresenter() {
        self.infoBuyerView.presenter = presenter
        self.addTouristView.presenter = presenter
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
        paymentButton.addTarget(self,
                                   action: #selector(nextScreen),
                                   for: .touchUpInside)
        addNewTouristButton.addTarget(self,
                                action: #selector(addNewTourist),
                                      for: .touchUpInside)
    }
//MARK: - nextScreen
    @objc func nextScreen() {
        presenter?.goPaymentScreenView()
    }
//MARK: - addNewTourist
    @objc func addNewTourist(sender: UIButton) {
        sender.tag += 1
        let stack = NewTourustView()
        let conteinerView = UIView()
        conteinerView.addSubview(stack)
        stackView.addArrangedSubview(conteinerView)
        conteinerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        stack.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        switch sender.tag {
        case 1: if sender.tag == 1 {
            stack.touristLabel.text = Constants.Text.secondTourist
        }
        case 2: if sender.tag == 2 {
            stack.touristLabel.text = Constants.Text.thirdTourist
        }
        case 3: if sender.tag == 3 {
            stack.touristLabel.text = Constants.Text.fourthtTourist
        }
        case 4: if sender.tag == 4 {
            stack.touristLabel.text = Constants.Text.fifthtTourist
            addNewTouristButton.isHidden = true
            labelAddTourist.text = Constants.Text.maxTourist
            labelAddTourist.textColor = .red
        }
        default:
            break
        }
    }
//MARK: - setupeView
    private func setupeView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(infoBuyerView)
        contentView.addSubview(conteinerButton)
        contentView.addSubview(resultView)
        contentView.addSubview(infoHotelView)
        contentView.addSubview(infoView)
        contentView.addSubview(addButtonView)
        contentView.addSubview(stackView)
        addButtonView.addSubview(labelAddTourist)
        addButtonView.addSubview(addNewTouristButton)
        conteinerButton.addSubview(paymentButton)
        paymentButton.addSubview(buttonLabel)
        stackView.addArrangedSubview(addTouristView)
    }
//MARK: - setupeConstraint
    private func setupeConstraint() {
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.width.equalToSuperview()
            make.bottom.equalTo(scrollView.snp.bottom)
        }
        infoHotelView.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.height.equalTo(140)
            make.width.equalToSuperview()
        }
        infoView.snp.makeConstraints { make in
            make.top.equalTo(infoHotelView.snp.bottom).inset(-5)
            make.width.equalToSuperview()
            make.height.equalTo(280)
        }
        infoBuyerView.snp.makeConstraints { make in
            make.top.equalTo(infoView.snp.bottom).inset(-5)
            make.width.equalToSuperview()
            make.height.equalTo(232)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(infoBuyerView.snp.bottom).inset(-5)
            make.width.equalToSuperview()
        }
        addButtonView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(stackView.snp.bottom).inset(-5)
            make.width.equalToSuperview()
            make.height.equalTo(58)
            make.bottom.equalTo(resultView.snp.top).inset(-5)
        }
        addTouristView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
        }
        resultView.snp.makeConstraints { make in
            make.top.equalTo(addButtonView.snp.bottom).inset(-5)
            make.width.equalToSuperview()
            make.height.equalTo(156)
            make.bottom.equalTo(conteinerButton.snp.top).inset(-5)
        }
        conteinerButton.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(70)
            make.bottom.equalTo(scrollView.snp.bottom)
        }
        paymentButton.snp.makeConstraints { make in
            make.width.equalTo(385)
            make.height.equalTo(48)
            make.bottom.equalTo(-5)
            make.centerX.equalToSuperview()
        }
        buttonLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        labelAddTourist.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
            make.width.equalTo(380)
        }
        addNewTouristButton.snp.makeConstraints { make in
            make.top.equalTo(13)
            make.right.equalTo(-16)
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
    }
}
//MARK: - extension BookingViewProtocol
extension BookingRoomViewController: BookingViewProtocol {
    func dataSet(model: BookimgModel) {
        guard let roomModel = self.roomModel else { return }
        let tourPrice = roomModel.price
        let fuelCharge = model.fuelCharge
        let serviceCharge = model.serviceCharge
        let totalCost = (tourPrice + fuelCharge + serviceCharge)
        self.buttonLabel.text = "\(Constants.Text.paymentLabel) \(totalCost)"
        self.infoHotelView.configures(model: model)
        self.infoView.configures(model: model,
                                 room: roomModel)
        self.resultView.configures(model: model,
                                   room: roomModel)
    }
    func giveDataToView(model: Room) {
        self.roomModel = model
    }
}
