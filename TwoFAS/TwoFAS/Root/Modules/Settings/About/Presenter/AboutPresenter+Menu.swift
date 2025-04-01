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

import Foundation

extension AboutPresenter {
    func buildMenu() -> [AboutSection] {
        [
            .init(title: T.Settings.general, cells: [
                .init(title: T.Settings.writeAReview, accessory: .external, action: .writeReview),
                .init(title: T.Settings.privacyPolicy, accessory: .external, action: .privacyPolicy),
                .init(title: T.Settings.acknowledgements, accessory: .external, action: .acknowledgements)
            ]),            
            .init(title: T.Social.socialMedia, cells: [
                .init(
                    title: T.Social.instagram,
                    accessory: .external,
                    action: .social(.instagram),
                    icon: Asset.socialInstagram.image
                ),
                .init(
                    title: T.Social.youtube,
                    accessory: .external,
                    action: .social(.youtube),
                    icon: Asset.socialYoutube.image
                ),
                .init(
                    title: T.Social.twitter,
                    accessory: .external,
                    action: .social(.twitter),
                    icon: Asset.socialTwitter.image
                ),
                .init(
                    title: T.Social.linkedin,
                    accessory: .external,
                    action: .social(.linkedin),
                    icon: Asset.socialLinkedin.image
                ),
                .init(
                    title: T.Social.facebook,
                    accessory: .external,
                    action: .social(.facebook),
                    icon: Asset.socialFacebook.image
                )
            ]),
            /*
            .init(
                title: T.Settings.aboutCrashOptoutTitle,
                cells: [
                    .init(
                        title: T.Settings.enableCrashlytics,
                        accessory: .toggle(isOn: !interactor.isCrashlyticsDisabled),
                        action: nil
                    )
                ],
                footer: T.Settings.enableCrashlyticsDescription
            )
             */
        ]
    }
}
