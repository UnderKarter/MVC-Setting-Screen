//
//  NotificationViewCell.swift
//  MVP Setting Screen
//
//  Created by temp user on 12.07.2022.
//

import UIKit

class NotificationViewCell: UITableViewCell {
    
    static let identifier = "NotificationViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = Metrics.labelNumberOfLines
        return label
    }()
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = Metrics.containerCornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let number: UILabel = {
        let label = UILabel()
        label.numberOfLines = Metrics.notificNumberOfLines
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: Metrics.notificFontSize)
        return label
    }()
    
    private let backgroundNotification: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = Metrics.notificBackgroundCornerRadius
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(backgroundNotification)
        contentView.addSubview(number)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height - Metrics.sizeHeight
        
        iconContainer.frame = CGRect(
            x: Metrics.iconContainerFrameX,
            y: Metrics.iconContainerFrameY,
            width: size,
            height: size
        )
        
        let imageSize: CGFloat = size
        
        iconImageView.frame = CGRect(
            x: (size-imageSize) / Metrics.iconImageViewFrameX,
            y: (size-imageSize) / Metrics.iconImageViewFrameX,
            width: imageSize,
            height: imageSize
        )
        
        label.frame = CGRect(
            x: Metrics.labelFrameX + iconContainer.frame.size.width,
            y: Metrics.labelFrameY,
            width: contentView.frame.size.width - Metrics.labelFrameWidth - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
        
        backgroundNotification.frame = CGRect(
            x: contentView.frame.width - Metrics.notificBackgroundFrameX,
            y: Metrics.notificBackgroundFrameY,
            width: size,
            height: size
        )
        
        number.frame = CGRect(
            x: contentView.frame.width - Metrics.numberFrameX,
            y: Metrics.numberFrameY,
            width: size,
            height: size
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        number.text = nil
        backgroundNotification.backgroundColor = nil
    }
    
    public func configure(with model: NotificationOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        number.text = String(model.number)
        backgroundNotification.backgroundColor = model.backgroundNotificaton
    }
    
    private struct Metrics {
        
        static let labelNumberOfLines = 1
        
        static let containerCornerRadius: CGFloat = 8
        
        static let notificNumberOfLines = 1
        static let notificFontSize: CGFloat = 18
        static let notificBackgroundCornerRadius: CGFloat = 15
        static let notificBackgroundFrameX: CGFloat = 45
        static let notificBackgroundFrameY: CGFloat = 7
        
        static let sizeHeight: CGFloat = 12
        
        static let labelFrameX: CGFloat = 25
        static let labelFrameY: CGFloat = 0
        static let labelFrameWidth: CGFloat = 15
        
        static let iconImageViewFrameX: CGFloat = 2
        static let iconImageViewFrameY: CGFloat = 2
        
        static let iconContainerFrameX: CGFloat = 15
        static let iconContainerFrameY: CGFloat = 8
        
        static let numberFrameX: CGFloat = 35
        static let numberFrameY: CGFloat = 7
    }
}
