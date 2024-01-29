//
//  Constants.swift
//  Apartments
//
//  Created by Vasiliy Vygnych on 22.01.2024.
//
import Foundation

enum Integers {
    enum Constraints {
        static let sideMargins = 16
    }
    enum FontSize {
        static let size_14 = 14
        static let size_16 = 16
        static let size_22 = 22
        static let size_25 = 25
        static let size_30 = 30
    }
    enum CornerRadius {
        static let size_5 = 5
        static let size_7 = 7
        static let size_10 = 10
        static let size_12 = 12
        static let size_15 = 15
    }
}

enum Constants {
    enum Text {
//MARK: - HotelViewControlle
        static let firstTitle: String = "Удобства".localized()
        static let firstSubtitle: String = "Самое необходимое".localized()
        static let secondTitle: String = "Что включено".localized()
        static let threeTitle: String = "Что не включено".localized()
        static let threeSubtitle: String = "Не самое необходимое".localized()
        static let aboutHotelLabbel: String = "Об отеле".localized()
        static let nextScreenRoom: String = "К выбору номера".localized()
        static let navTitleHotel: String = "Отель".localized()
        static let miminalPrise: String = "От".localized()
        static let currency: String = "₽".localized()
//MARK: - RoomViewController
        static let setupeButtonCell: String = "Выбрать номер".localized()
//MARK: - RoomsCollectionCell
        static let moreButtonLabel: String = "Подробнее о номере".localized()
//MARK: -  BookingViewController
        static let labelAddTourist: String = "Добавить туриста".localized()
        static let navTitleBooking: String = "Бронирование".localized()
//MARK: - InfoView
        static let labelFrom: String = "Вылет из".localized()
        static let labelIn: String = "Страна, город".localized()
        static let labelData: String = "Даты".localized()
        static let numberOfNights: String = "Кол-во ночей".localized()
        static let hotelLabel: String = "Отель".localized()
        static let roomLabel: String = "Номер".localized()
        static let foodLabel: String = "Питание".localized()
//MARK: - InfoBuyerView
        static let infoBuyerLabel: String = "Информация о покупателе".localized()
        static let orderLabel: String = "Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту".localized()
        static let numberTexField: String = "Номер телефона".localized()
        static let emailTexField: String = "Почта".localized()
//MARK: - NewTourustView
        static let firstTourist: String = "Пeрвый турист".localized()
        static let secondTourist: String = "Второй турист".localized()
        static let thirdTourist: String = "Третий турист".localized()
        static let fourthtTourist: String = "Четвертый турист".localized()
        static let fifthtTourist: String = "Пятый турист".localized()
        static let maxTourist: String = "Максимальное количество туристов".localized()
        static let firstName: String = "Имя".localized()
        static let surName: String = "Фамилия".localized()
        static let dateOfBirth: String = "Дата рождения".localized()
        static let citizenship: String = "Гражданство".localized()
        static let passportNumber: String = "Номер загранпаспорта".localized()
        static let validityPeriod: String = "Срок действия загранпаспорта".localized()
//MARK: - ResultView
        static let turlLabel: String = "Тур".localized()
        static let fuelLabel: String = "Топливный сбор".localized()
        static let serviseLabel: String = "Сервисный сбор".localized()
        static let paymentLabel: String = "К оплате".localized()
//MARK: - PaymentScreenView
        static let acceptedLabdel: String = "Ваш заказ принят в работу".localized()
        static let infoLabel: String = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление".localized()
        static let nextScreenButton: String = "Cупер".localized()
        static let navTitlePayment: String = "Заказ оплачен".localized()
    }
}
