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
import Common

final class TokensViewEmptyListScreen: UIView {
    var pairNewService: Callback?
    var importFromExternalService: Callback?
    var help: Callback?
    
    private let iconImage: UIImageView = {
        let img = UIImageView(image: Asset.introductionEmptyHeader.image)
        img.contentMode = .scaleAspectFit
        img.setContentCompressionResistancePriority(.defaultLow - 1, for: .vertical)
        return img
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = Theme.Colors.Text.main
        label.font = Theme.Fonts.Text.content
        label.text = T.Introduction.descriptionTitle
        return label
    }()
    
    private let pairNewServiceButton: LoadingContentButton = {
        let button = LoadingContentButton()
        button.apply(MainContainerButtonStyling.filledInDecoratedContainerLightText.value)
        button.update(title: T.Introduction.pairNewService)
        return button
    }()
    
    private let importButton: LoadingContentButton = {
        let button = LoadingContentButton()
        button.apply(MainContainerButtonStyling.textOnly.value)
        button.update(title: T.Introduction.importExternalApp)
        return button
    }()
    
    private let helpButton: LoadingContentButton = {
        let button = LoadingContentButton()
        button.apply(MainContainerButtonStyling.textOnly.value)
        button.update(title: T.Introduction.whatToDo)
        button.configure(Theme.Fonts.Controls.smallTitle)
        return button
    }()
    
    private let buttonsStackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = Theme.Metrics.mediumSpacing
        return sv
    }()
    
    private let headerStackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = Theme.Metrics.mediumSpacing
        return sv
    }()
    
    private let mainStackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 2 * Theme.Metrics.doubleSpacing
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = Theme.Colors.Fill.background
        
        addSubview(mainStackView, with: [
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.widthAnchor.constraint(equalToConstant: Theme.Metrics.componentWidth),
            mainStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainStackView.topAnchor.constraint(
                greaterThanOrEqualTo: safeTopAnchor,
                constant: Theme.Metrics.standardMargin
            )
        ])
        
        mainStackView.addArrangedSubviews([headerStackView, buttonsStackView])
        headerStackView.addArrangedSubviews([iconImage, headerLabel])
        buttonsStackView.addArrangedSubviews([pairNewServiceButton, importButton])
        
        pairNewServiceButton.action = { [weak self] in self?.pairNewService?() }
        importButton.action = { [weak self] in self?.importFromExternalService?() }
        helpButton.action = { [weak self] in self?.help?() }
    }
}
