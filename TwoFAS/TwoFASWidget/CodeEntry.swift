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

import WidgetKit
import UIKit
import Common

struct CodeEntry: TimelineEntry {
    let date: Date
    let entries: [Entry]
    
    enum Kind: String, Identifiable {
        case singleEntry
        case placeholder
        
        var id: String { self.rawValue }
    }
    
    struct Entry: Identifiable, Hashable {
        static func == (lhs: CodeEntry.Entry, rhs: CodeEntry.Entry) -> Bool {
            lhs.kind == rhs.kind && lhs.data == rhs.data
        }
        
        let kind: Kind
        let data: EntryData
        var id: String { data.id }
    }
    
    struct EntryData: Identifiable, Hashable {
        enum IconType: Identifiable, Hashable {
            var id: Self { self }
            
            case brand
            case label
        }
        let id: String
        let name: String
        let info: String?
        let code: String
        let icon: UIImage
        let iconType: IconType
        let labelTitle: String
        let labelColor: TintColor
        let serviceTypeID: ServiceTypeID?
        let countdownTo: Date?
    }
}
