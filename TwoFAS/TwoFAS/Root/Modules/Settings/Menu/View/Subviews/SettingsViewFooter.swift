//
//  This file is part of the 2FAS iOS app (https://github.com/twofas/2fas-ios)
//  Copyright © 2023 Two Factor Authentication Service, Inc.
//  Contributed by Zbigniew Cisiński. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program. If not, see <https://www.gnu.org/licenses/>
//

import UIKit
import Data

final class SettingsViewFooter: UIView {
    let height: CGFloat = 80
    
    private let stackViewWidth: CGFloat = 160
    private let spacing: CGFloat = 50
    
    var openURL: ((SocialChannel) -> Void)?
    
    private var facebookButton: UIButton = {
        let button = UIButton()
        button.setImage(Asset.socialLargeFacebook.image, for: .normal)
        button.accessibilityLabel = T.Social.facebook
        return button
    }()
    
    private var twitterButton: UIButton = {
        let button = UIButton()
        button.setImage(Asset.socialLargeTwitter.image, for: .normal)
        button.accessibilityLabel = T.Social.twitter
        return button
    }()
    
    private var youtubeButton: UIButton = {
        let button = UIButton()
        button.setImage(Asset.socialLargeYoutube.image, for: .normal)
        button.accessibilityLabel = T.Social.youtube
        return button
    }()
    
    private var instagramButton: UIButton = {
        let button = UIButton()
        button.setImage(Asset.socialLargeInstagram.image, for: .normal)
        button.accessibilityLabel = T.Social.instagram
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 50
        stackView.distribution = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(origin: .zero, size: .init(width: stackViewWidth, height: height)))
        
        commonInit()
    }
    
    private var constraint: NSLayoutConstraint?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        preservesSuperviewLayoutMargins = false
        addSubview(stackView, with: [
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.heightAnchor.constraint(equalToConstant: height)
        ])
        
        constraint = stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        constraint?.isActive = true
        
        stackView.addArrangedSubviews([facebookButton, youtubeButton, twitterButton, instagramButton])
        
        facebookButton.addTarget(self, action: #selector(facebookAction), for: .touchUpInside)
        youtubeButton.addTarget(self, action: #selector(youtubeAction), for: .touchUpInside)
        twitterButton.addTarget(self, action: #selector(twitterAction), for: .touchUpInside)
        instagramButton.addTarget(self, action: #selector(instagramAction), for: .touchUpInside)
    }
    
    override func layoutMarginsDidChange() {
        super.layoutMarginsDidChange()
        let leftMargin = layoutMargins.left
        let rightMargin = layoutMargins.right
        constraint?.constant = round((leftMargin - rightMargin) / 2.0)
    }
    
    @objc
    private func facebookAction() {
        openURL?(.facebook)
    }

    @objc
    private func youtubeAction() {
        openURL?(.youtube)
    }
    
    @objc
    private func twitterAction() {
        openURL?(.twitter)
    }
    
    @objc
    private func instagramAction() {
        openURL?(.instagram)
    }
}
