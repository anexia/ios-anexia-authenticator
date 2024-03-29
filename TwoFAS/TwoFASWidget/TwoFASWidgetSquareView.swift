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
import SwiftUI
import Common

struct TwoFASWidgetSquareView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private let spacing: CGFloat = 8
    
    let entry: CodeEntry.Entry
    
    @ViewBuilder
    var body: some View {
        let entryData = entry.data
        let kind = entry.kind
        
        let reason: RedactionReasons = {
            switch kind {
            case .placeholder: return .placeholder
            default: return []
            }
        }()
        
        let codeReason: RedactionReason = {
            switch kind {
            case .placeholder: return .codePlaceholder
            default: return .noPlaceholder
            }
        }()
        
        VStack(alignment: .leading, spacing: nil) {
            Spacer()
            HStack(alignment: .center, spacing: nil) {
                IconRenderer(entry: entry)
                    .redacted(reason: reason)
                Spacer()
                counterText(for: entryData.countdownTo)
                    .multilineTextAlignment(.trailing)
                    .font(Font.body.monospacedDigit())
                    .lineLimit(1)
                    .redacted(reason: reason)
            }
            Spacer(minLength: spacing * 3)
            VStack(alignment: .leading, spacing: 3) {
                Text(entryData.name)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .redacted(reason: reason)
                    .accessibility(label: Text("widget_service_name \(entryData.name)"))
                GeometryReader { _ in
                    let tokenVO = (entryData.code.components(separatedBy: "")).joined(separator: " ")
                    Text(entryData.code)
                        .font(Font.system(.title).weight(.light).monospacedDigit())
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.2)
                        .redacted(reason: codeReason)
                        .accessibility(label: Text("widget_token \(tokenVO)"))
                }
                let info = entryData.info ?? ""
                Text(info)
                    .lineLimit(1)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .redacted(reason: reason)
            }
            Spacer()
        }.padding(spacing)
            .accessibility(hidden: codeReason == .codePlaceholder)
    }
    
    private func counterText(for date: Date?) -> Text {
        if let countdownTo = date {
            return Text(countdownTo, style: .timer)
        }
        return Text("0:00")
    }
}
