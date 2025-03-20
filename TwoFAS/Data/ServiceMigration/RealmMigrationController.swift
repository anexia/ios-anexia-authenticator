//
//  This file is part of the 2FAS iOS app (https://github.com/twofas/2fas-ios)
//  Copyright © 2025 Two Factor Authentication Service, Inc.
//  Contributed by Bettina Kelhar. All rights reserved.
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

import RealmSwift
import Foundation
import Common
import Storage

class RealmMigrationController {
    private let migrationKey = "RealmMigrationController"
    private let storageRepository: StorageRepository
    var isAddServiceEnabled = false
    
    public init(storageRepository: StorageRepository) {
        self.storageRepository = storageRepository
    }
    
    public func migrateIfNeeded() {
        guard
            let currentVersionString = Bundle.main.appVersion,
            let currentVersion = currentVersionString.splitVersion()
        else { return }
        
        let userDefaults = UserDefaults()
        let savedVersionString = userDefaults.string(forKey: migrationKey)?.splitVersion()
        
        if let sv = savedVersionString {
            if sv < currentVersion {
                #if os(iOS)
                AppEventLog(.appUpdate(currentVersionString))
                #endif
                userDefaults.set(currentVersionString, forKey: migrationKey)
                userDefaults.synchronize()
            } else {
                Log("Realm Db already migrated for this version")
                return
            }
        } else {
            userDefaults.set(currentVersionString, forKey: migrationKey)
            userDefaults.synchronize()
        }

        migrateServicesFromRealmDb()
    }
    
    public func migrateServicesFromRealmDb() {
        
        let config = Realm.Configuration(schemaVersion: 1)
        Realm.Configuration.defaultConfiguration = config
        
        let oldAccounts = getDataFromRealmDb()
        
        for account in oldAccounts {
            var isAddServiceEnabled: ServiceExistenceStatus = storageRepository.serviceExists(for: account.secret)
            if (isAddServiceEnabled == .no) {
                storageRepository.addService(
                    name: account.issuer,
                    secret: account.secret,
                    serviceTypeID: nil,
                    additionalInfo: account.username,
                    rawIssuer: account.issuer,
                    otpAuth: nil,
                    tokenPeriod: Period(rawValue: account.period),
                    tokenLength: Digits(rawValue: account.digits) ?? Digits.defaultValue,
                    badgeColor: nil,
                    iconType: IconType.label,
                    iconTypeID: IconTypeID.default,
                    labelColor: .random,
                    labelTitle: account.issuer.twoLetters,
                    algorithm: Algorithm.SHA1,
                    counter: 0,
                    tokenType: TokenType.totp,
                    source: ServiceSource.manual
                )
            }
        }
        Log("Service successfuly migrated from Realm")
    }
    
    private func getDataFromRealmDb() -> [Account] {
        let accounts = Account.readAllFromRealm()
        let copiedArray = accounts.map {$0.copy(with: nil) as! Account }
        for entry in copiedArray {
            if (entry.issuer == "") {
                entry.issuer = entry.username
                entry.username = ""
            }
        }
        return copiedArray
    }
}

private extension Bundle {
    var appVersion: String? { object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String }
}
