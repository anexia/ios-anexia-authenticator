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

enum Theme {
    static func applyAppearance() {

        let bgImage = Asset.barsBackground.image
            .resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        let shadowLine = Asset.shadowLine.image
            .resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .tile)

        let navibarAppearance = UINavigationBar.appearance()
        navibarAppearance.isTranslucent = false
        navibarAppearance.setBackgroundImage(bgImage, for: .any, barMetrics: .default)
        navibarAppearance.shadowImage = shadowLine
        navibarAppearance.backgroundColor = Theme.Colors.Fill.background
        navibarAppearance.tintColor = Theme.Colors.Fill.theme
        navibarAppearance.barTintColor = Theme.Colors.Fill.theme

        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = Theme.Colors.Fill.theme
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = Theme.Colors.Fill.background
        tabBarAppearance.tintColor = Colors.Controls.active
        tabBarAppearance.unselectedItemTintColor = Colors.Controls.inactive
        tabBarAppearance.shadowImage = shadowLine
        tabBarAppearance.backgroundImage = bgImage
        tabBarAppearance.isTranslucent = true
    }
    
    enum Colors {
        static let decoratedContainerButton = ThemeColor.decoratedContainerButton
        static let decoratedContainerButtonInverted = ThemeColor.decoratedContainerButtonInverted
        static let cameraOverlay = ThemeColor.cameraOverlay
        static let decoratedContainer = ThemeColor.decoratedContainer
        static let inactiveInverted = ThemeColor.inactiveInverted
        static let inactiveMoreContrast = ThemeColor.inactiveMoreContrast
        static let overlay = ThemeColor.overlay
        
        static let notificationsBackground = UIColor { trait in
            if trait.userInterfaceStyle == .dark {
                return Theme.Colors.Fill.background
            }
            return Theme.Colors.Fill.System.second
        }
        
        enum Controls {
            static let active = ThemeColor.theme
            static let highlighed = ThemeColor.highlighed
            static let inactive = ThemeColor.inactive
            static let empty = ThemeColor.background
            static let light = ThemeColor.light
            static let inverted = ThemeColor.quaternary
            static let pageIndicator = ThemeColor.pageIndicator
        }
        
        enum Form {
            static let title = ThemeColor.secondary
            static let rowTitle = ThemeColor.secondary
            static let requried = ThemeColor.theme
            static let rowInput = ThemeColor.primary
            static let rowInputInactive = ThemeColor.inactive
            static let error = ThemeColor.theme
        }
        
        enum Text {
            static let main = ThemeColor.primary
            static let mainHighlighted = ThemeColor.secondary
            static let subtitle = ThemeColor.secondary
            static let onBackground = ThemeColor.quaternary
            static let light = ThemeColor.light
            static let dark = ThemeColor.dark
            static let theme = ThemeColor.theme
            static let themeSecondary = ThemeColor.themeSecondary
            static let themeHighlighted = ThemeColor.highlighed
            static let error = ThemeColor.theme
            static let inactive = ThemeColor.inactive
            static let warning = ThemeColor.warningColor
        }
        
        enum Icon {
            static let background = ThemeColor.backgroundLight
            static let more = ThemeColor.secondary
            static let theme = ThemeColor.theme
            static let normal = ThemeColor.secondary
            static let inactive = ThemeColor.inactive
        }
        
        enum Line {
            static let primaryLine = ThemeColor.primary
            static let primaryLineDisabled = ThemeColor.inactive
            static let secondaryLine = ThemeColor.divider
            static let theme = ThemeColor.theme
            static let themeSecondary = ThemeColor.themeSecondary
            static let separator = ThemeColor.tableSeparator
            static let systemSeparator = UIColor.separator
            static let secondarySeparator = ThemeColor.secondarySeparator
            static let active = ThemeColor.activeLine
            static let selectionBorder = ThemeColor.selectionBorder
            static let secondaryDivider = ThemeColor.secondaryDivider
            static let warning = ThemeColor.warningColor
        }
        
        enum Grid {
            static let background = ThemeColor.divider
        }
        
        enum Table {
            static let background = ThemeColor.tableBackground
        }
        
        enum SettingsCell {
            static let background = ThemeColor.settingsCellBackground
            static let iconBorder = ThemeColor.tertiary
            static let separator = ThemeColor.tableSeparator
        }
        
        enum CloseButton {
            static let background = ThemeColor.buttonCloseBackground
            static let foreground = ThemeColor.buttonCloseForeground
        }

        enum Fill {
            enum System {
                static let first = UIColor.systemBackground
                static let second = UIColor.secondarySystemBackground
                static let third = UIColor.tertiarySystemBackground
                static let forth = UIColor.quaternarySystemFill
            }
            static let theme = ThemeColor.theme
            static let themeLight = ThemeColor.highlighed
            static let notification = ThemeColor.quaternary
            static let background = ThemeColor.background
            static let backgroundLight = ThemeColor.backgroundLight
            static let placeholder = ThemeColor.divider
        }
    }
    
    enum Fonts {
        private static let syncCounter = UIFont(name: "FiraSans-Thin", size: 60) ?? UIFont.systemFont(ofSize: 60, weight: .thin)
        private static let counter = UIFont(name: "FiraSans-Regular", size: 12) ?? UIFont.monospacedDigitSystemFont(ofSize: 12, weight: .regular)
        private static let privateKey = UIFont(name: "FiraSans-Thin", size: 50) ?? UIFont.monospacedDigitSystemFont(ofSize: 50, weight: .thin)
        private static let privateKeyMask = UIFont(name: "FiraSans-Regular", size: 43) ?? UIFont.monospacedSystemFont(ofSize: 43, weight: .regular)
        private static let title = UIFont(name: "FiraSans-Light", size: 32) ?? UIFont.systemFont(ofSize: 32, weight: .light)
        private static let boldTitle = UIFont(name: "FiraSans-SemiBold", size: 32) ?? UIFont.systemFont(ofSize: 32, weight: .semibold)
        private static let header = UIFont(name: "FiraSans-SemiBold", size: 17) ?? UIFont.systemFont(ofSize: 17, weight: .semibold)
        private static let content = UIFont(name: "FiraSans-Regular", size: 17) ?? UIFont.systemFont(ofSize: 17, weight: .regular)
        private static let description = UIFont(name: "FiraSans-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
        private static let info = UIFont(name: "FiraSans-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13, weight: .medium)
        private static let note = UIFont(name: "FiraSans-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)
        private static let uuidInput = UIFont(name: "FiraSans-Medium", size: 16) ?? UIFont.monospacedSystemFont(ofSize: 16, weight: .medium)
        
        enum Form {
            static let title = Fonts.description
            static let rowTitle = Fonts.content
            static let rowInput = Fonts.content
            static let error = Fonts.note
            static let uuidInput = Fonts.uuidInput
        }
        
        enum Text {
            static let title = Fonts.title
            static let boldTitle = Fonts.boldTitle
            static let content = Fonts.content
            static let boldContent = Fonts.header
            static let description = Fonts.description
            static let info = Fonts.info
            static let note = Fonts.note
        }
        
        enum Controls {
            static let naviButton = Fonts.content
            static let title = header
            static let PINPad = Fonts.title
            static let smallTitle = Fonts.note
            static let counter = Fonts.counter
        }
        
        enum Counter {
            
            static let syncCounter = Fonts.syncCounter
        }
        
        enum TokenCell {
            static let privateKeyMask = Fonts.privateKeyMask
            static let privateKey = Fonts.privateKey
            static let description = Fonts.note
        }
        
        enum SettingsCell {
            
            static let title = Fonts.content
            static let state = Fonts.description
        }
        
        static let warning = UIFont(name: "FiraSans-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13, weight: .medium)
        static let iconLabel = UIFont(name: "FiraSans-Bold", size: 13) ?? UIFont.systemFont(ofSize: 13, weight: .bold)
        static let iconLabelSmall = UIFont(name: "FiraSans-Bold", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .bold)
        static let sectionHeader = UIFont(name: "FiraSans-Regular", size: 13) ?? UIFont.systemFont(ofSize: 13, weight: .regular)
        static let iconLabelInputTitle = UIFont(name: "FiraSans-Light", size: 22) ?? UIFont.systemFont(ofSize: 22, weight: .light)
        static let tabBar = UIFont(name: "FiraSans-SemiBold", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .semibold)
        static let introTitle = UIFont(name: "FiraSans-Bold", size: 24) ?? UIFont.systemFont(ofSize: 24, weight: .bold)
        static let introContentSmall = UIFont(name: "FiraSans-Regular", size: 13) ?? UIFont.systemFont(ofSize: 13, weight: .regular)
        static let orderTitle = UIFont(name: "FiraSans-Bold", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .bold)
    }
    
    enum Alpha {
        
        static let disabledElement: CGFloat = 0.5
    }
    
    enum Animations {
        enum Timing {
            static let show: TimeInterval = 0.1
            static let quick: TimeInterval = 0.2
            static let hide: TimeInterval = 0.15
            static let rootNextScreen: TimeInterval = 0.3
            static let displayNotification: TimeInterval = 2
        }
        
        enum Curve {
            static let show: UIView.AnimationOptions = .curveEaseOut
            static let hide: UIView.AnimationOptions = .curveEaseOut
            static let rootNextScreen: UIView.AnimationOptions = .curveEaseInOut
            static let PINPush: UIView.AnimationOptions = .curveEaseOut
            static let PINPop: UIView.AnimationOptions = .curveEaseIn
        }
    }
    
    enum Metrics {
        
        /// 2
        static let quaterSpacing: CGFloat = 2
        /// 5
        static let halfSpacing: CGFloat = 5
        static let standardSpacing: CGFloat = ThemeMetrics.spacing
        static let mediumSpacing: CGFloat = 15
        static let doubleSpacing: CGFloat = 2 * standardSpacing
        
        /// 8
        static let standardMargin: CGFloat = ThemeMetrics.margin
        /// 12
        static let mediumMargin: CGFloat = (3 * ThemeMetrics.margin) / 2
        /// 16
        static let doubleMargin: CGFloat = 2 * ThemeMetrics.margin
        
        static let lineWidth: CGFloat = ThemeMetrics.lineWidth
        static let separatorHeight: CGFloat = 0.5
        /// 6
        static let cornerRadius: CGFloat = 6
        /// 14
        static let modalCornerRadius: CGFloat = 14
        static let notificationMargin: CGFloat = 8
        
        static let PINDotBorderWidth: CGFloat = 0.5
        
        static let serviceIconSize: CGFloat = 40
        
        static let settingsTableViewCellHeight: CGFloat = 44
        static let settingsTableViewHeaderHeight: CGFloat = 54
        static let settingsIconSize: CGFloat = 30
        static let servicesCellHeight: CGFloat = 120
        
        static let cameraTopGradientHeigth: CGFloat = 150
        static let cameraBottomGradientHeigth: CGFloat = 180
        static let cameraActiveAreaSize: CGFloat = 230
        static let cameraActiveAreaYOffset: CGFloat = 20
        
        static let PINButtonDimensionLarge: CGFloat = 70
        static let PINDotDimension: CGFloat = 13
        
        static let warningHeight: CGFloat = 50
        static let warningSpacing: CGFloat = 1
        
        static let buttonHeight: CGFloat = 50
        
        /// 288
        static let componentWidth: CGFloat = 288
        /// 280
        static let compactCellWidth: CGFloat = 280
        /// 310
        static let defaultCellWidth: CGFloat = pageWidth
        /// 310
        static let pageWidth: CGFloat = 310
        
        static let settingsSmallIconSize: CGSize = .init(width: 24, height: 24)
    }
    
    enum Consts {
        static let maxFieldLength: Int = 1024
    }
}

// Helper function inserted by Swift 4.2 migrator.
private func convertToNSAttributedStringKeyDictionary(_ input: [String: Any]) -> [NSAttributedString.Key: Any] {
    Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value) })
}
