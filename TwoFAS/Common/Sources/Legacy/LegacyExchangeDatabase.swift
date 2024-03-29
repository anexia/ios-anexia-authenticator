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

// swiftlint:disable all
public final class LegacyExchangeDatabase {
    private struct ExchangeEntry {
        let externalString: String
        // type assigned while importing files
        let importType: ServiceType
        // types for which external string is being used in final file
        let exportTypes: [ServiceType]
    }
    
    private let entries: [ExchangeEntry]
    public init() {
        entries = [
            ExchangeEntry(externalString: "Amazon", importType: .amazon, exportTypes: [.amazon]),
            ExchangeEntry(externalString: "Tibia", importType: .tibia, exportTypes: [.tibia]),
            ExchangeEntry(externalString: "Vk", importType: .vk, exportTypes: [.vk]),
            ExchangeEntry(externalString: "Wordpress", importType: .wordpress, exportTypes: [.wordpress]),
            ExchangeEntry(externalString: "Ifttt", importType: .ifttt, exportTypes: [.ifttt]),
            ExchangeEntry(externalString: "Ovh", importType: .ovh, exportTypes: [.ovh]),
            ExchangeEntry(externalString: "Zoho", importType: .zoho, exportTypes: [.zoho]),
            ExchangeEntry(externalString: "DigitalOcean", importType: .digitalOcean, exportTypes: [.digitalOcean]),
            ExchangeEntry(externalString: "Zendesk", importType: .zendesk, exportTypes: [.zendesk]),
            ExchangeEntry(externalString: "TeamViewer", importType: .teamViewer, exportTypes: [.teamViewer]),
            ExchangeEntry(externalString: "Stripe", importType: .stripe, exportTypes: [.stripe]),
            ExchangeEntry(externalString: "Sourceforge", importType: .sourceForge, exportTypes: [.sourceForge]),
            ExchangeEntry(externalString: "Hootsuite", importType: .hootsuite, exportTypes: [.hootsuite]),
            ExchangeEntry(externalString: "Slack", importType: .slack, exportTypes: [.slack]),
            ExchangeEntry(externalString: "Braintree", importType: .braintree, exportTypes: [.braintree]),
            ExchangeEntry(externalString: "Bitpay", importType: .bitpay, exportTypes: [.bitpay]),
            ExchangeEntry(externalString: "Google", importType: .google, exportTypes: [.google]),
            ExchangeEntry(externalString: "TwoFas", importType: .TwoFASSecret, exportTypes: [.TwoFASSecret]),
            ExchangeEntry(externalString: "TwoFasMobileSecret", importType: .TwoFASMobileSecret, exportTypes: [.TwoFASMobileSecret]),
            ExchangeEntry(externalString: "ElectronicArts", importType: .ea, exportTypes: [.ea]),
            ExchangeEntry(externalString: "Blockchain", importType: .blockchain, exportTypes: [.blockchain]),
            ExchangeEntry(externalString: "Buffer", importType: .buffer, exportTypes: [.buffer]),
            ExchangeEntry(externalString: "Cloudflare", importType: .cloudflare, exportTypes: [.cloudflare]),
            ExchangeEntry(externalString: "MailChimp", importType: .mailChimp, exportTypes: [.mailChimp]),
            ExchangeEntry(externalString: "Qnap", importType: .qnap, exportTypes: [.qnap]),
            ExchangeEntry(externalString: "DnsMadeEasy", importType: .dnsMadeEasy, exportTypes: [.dnsMadeEasy]),
            ExchangeEntry(externalString: "Gitlab", importType: .gitlab, exportTypes: [.gitlab]),
            ExchangeEntry(externalString: "Github", importType: .github, exportTypes: [.github]),
            ExchangeEntry(externalString: "Evernote", importType: .evernote, exportTypes: [.evernote]),
            ExchangeEntry(externalString: "GoDaddy", importType: .goDaddy, exportTypes: [.goDaddy]),
            ExchangeEntry(externalString: "Kickstarter", importType: .kickstarter, exportTypes: [.kickstarter]),
            ExchangeEntry(externalString: "Dropbox", importType: .dropbox, exportTypes: [.dropbox]),
            ExchangeEntry(externalString: "Heroku", importType: .heroku, exportTypes: [.heroku]),
            ExchangeEntry(externalString: "LastPass", importType: .lastPass, exportTypes: [.lastPass]),
            ExchangeEntry(externalString: "Hetzner", importType: .hetzner, exportTypes: [.hetzner]),
            ExchangeEntry(externalString: "Minergate", importType: .minergate, exportTypes: [.minergate]),
            ExchangeEntry(externalString: "Poloniex", importType: .poloniex, exportTypes: [.poloniex]),
            ExchangeEntry(externalString: "Bittrex", importType: .bittrex, exportTypes: [.bittrex]),
            ExchangeEntry(externalString: "Bitbucket", importType: .bitbucket, exportTypes: [.bitbucket]),
            ExchangeEntry(externalString: "BeamPro", importType: .beamPro, exportTypes: [.beamPro]),
            ExchangeEntry(externalString: "Facebook", importType: .facebook, exportTypes: [.facebook]),
            ExchangeEntry(externalString: "AngelList", importType: .angelList, exportTypes: [.angelList]),
            ExchangeEntry(externalString: "Microsoft", importType: .microsoft, exportTypes: [.microsoft]),
            ExchangeEntry(externalString: "Skrill", importType: .skrill, exportTypes: [.skrill]),
            ExchangeEntry(externalString: "Sentry", importType: .sentry, exportTypes: [.sentry]),
            ExchangeEntry(externalString: "OpSkins", importType: .opskins, exportTypes: [.opskins]),
            ExchangeEntry(externalString: "Binance", importType: .binance, exportTypes: [.binance]),
            ExchangeEntry(externalString: "BitBay", importType: .bitbay, exportTypes: [.bitbay]),
            ExchangeEntry(externalString: "BitSkins", importType: .bitskins, exportTypes: [.bitskins]),
            ExchangeEntry(externalString: "BtcMarkets", importType: .btcMarkets, exportTypes: [.btcMarkets]),
            ExchangeEntry(externalString: "Coinbase", importType: .coinbase, exportTypes: [.coinbase]),
            ExchangeEntry(externalString: "CryptoMkt", importType: .cryptoMKT, exportTypes: [.cryptoMKT]),
            ExchangeEntry(externalString: "Discord", importType: .discord, exportTypes: [.discord]),
            ExchangeEntry(externalString: "NiceHashBuying", importType: .niceHashBuying, exportTypes: [.niceHashBuying]),
            ExchangeEntry(externalString: "NiceHashLogin", importType: .niceHashLogin, exportTypes: [.niceHashLogin]),
            ExchangeEntry(externalString: "NiceHashWithdraw", importType: .niceHashWithdraw, exportTypes: [.niceHashWithdraw]),
            ExchangeEntry(externalString: "ManuallyAdded", importType: .manual, exportTypes: [.manual]),
            ExchangeEntry(externalString: "Unknown", importType: .unknown, exportTypes: [.unknown]),
            ExchangeEntry(externalString: "EpicGames", importType: .epicGames, exportTypes: [.epicGames]),
            ExchangeEntry(externalString: "Xero", importType: .xero, exportTypes: [.xero]),
            ExchangeEntry(externalString: "Ubisoft", importType: .ubisoft, exportTypes: [.ubisoft]),
            ExchangeEntry(externalString: "Mega", importType: .mega, exportTypes: [.mega]),
            ExchangeEntry(externalString: "Snapchat", importType: .snapchat, exportTypes: [.snapchat]),
            ExchangeEntry(externalString: "Instagram", importType: .instagram, exportTypes: [.instagram]),
            ExchangeEntry(externalString: "Netsuite", importType: .netSuite, exportTypes: [.netSuite]),
            ExchangeEntry(externalString: "HumbleBundle", importType: .humbleBundle, exportTypes: [.humbleBundle]),
            ExchangeEntry(externalString: "Firefox", importType: .firefox, exportTypes: [.firefox]),
            ExchangeEntry(externalString: "NintendoAccount", importType: .nintendo, exportTypes: [.nintendo]),
            ExchangeEntry(externalString: "KuCoin", importType: .kuCoin, exportTypes: [.kuCoin]),
            ExchangeEntry(externalString: "Myob", importType: .myob, exportTypes: [.myob]),
            ExchangeEntry(externalString: "Litebit", importType: .litebit_eu, exportTypes: [.litebit_eu]),
            ExchangeEntry(externalString: "Twitter", importType: .twitter, exportTypes: [.twitter]),
            ExchangeEntry(externalString: "Bitcoinmeester", importType: .bitcoinMeester, exportTypes: [.bitcoinMeester]),
            ExchangeEntry(externalString: "Atlantiss", importType: .atlantiss, exportTypes: [.atlantiss]),
            ExchangeEntry(externalString: "Autodesk", importType: .autodesk, exportTypes: [.autodesk]),
            ExchangeEntry(externalString: "Bitfinex", importType: .bitfinex, exportTypes: [.bitfinex, .bitfinex_fromName]),
            ExchangeEntry(externalString: "Preceda", importType: .preceda, exportTypes: [.preceda, .preceda_fromName]),
            ExchangeEntry(externalString: "JuraElektroapparateAg", importType: .jura, exportTypes: [.jura, .jura_fromName]),
            ExchangeEntry(externalString: "BlockchainsLlc", importType: .blockchains, exportTypes: [.blockchains, .blockchains_fromName]),
            ExchangeEntry(externalString: "Coinsquare", importType: .coinsquare_io, exportTypes: [.coinsquare_io, .coinsquare_io_fromName]),
            ExchangeEntry(externalString: "Bitvavo", importType: .bitvavo, exportTypes: [.bitvavo, .bitvavo_fromName]),
            ExchangeEntry(externalString: "Coindeal", importType: .coindeal_io, exportTypes: [.coindeal_io, .coindeal_io_fromName]),
            ExchangeEntry(externalString: "BraveRewards", importType: .brave, exportTypes: [.brave, .brave_fromName]),
            ExchangeEntry(externalString: "Onelogin", importType: .onelogin, exportTypes: [.onelogin, .onelogin_fromName]),
            ExchangeEntry(externalString: "Sofi", importType: .sofi, exportTypes: [.sofi]),
            ExchangeEntry(externalString: "Trello", importType: .trello, exportTypes: [.trello]),
            ExchangeEntry(externalString: "Uphold", importType: .uphold, exportTypes: [.uphold]),
            ExchangeEntry(externalString: "Fintegri", importType: .fintegri, exportTypes: [.fintegri]),
            ExchangeEntry(externalString: "Wordfence", importType: .wordfence, exportTypes: [.wordfence]),
            ExchangeEntry(externalString: "Jagex", importType: .jagex, exportTypes: [.jagex]),
            ExchangeEntry(externalString: "PayPal", importType: .payPal, exportTypes: [.payPal]),
            ExchangeEntry(externalString: "Karatbit", importType: .karatbit, exportTypes: [.karatbit]),
            ExchangeEntry(externalString: "Gamdom", importType: .gamdom, exportTypes: [.gamdom]),
            ExchangeEntry(externalString: "Devex", importType: .devexMail, exportTypes: [.devexMail]),
            ExchangeEntry(externalString: "Reddit", importType: .reddit, exportTypes: [.reddit]),
            ExchangeEntry(externalString: "Logingov", importType: .logingov, exportTypes: [.logingov]),
            ExchangeEntry(externalString: "Uscis", importType: .uscis, exportTypes: [.uscis]),
            ExchangeEntry(externalString: "Onet", importType: .okonto, exportTypes: [.okonto]),
            ExchangeEntry(externalString: "FreshDesk", importType: .freshDesk, exportTypes: [.freshDesk]),
            ExchangeEntry(externalString: "HubSpot", importType: .hubSpot, exportTypes: [.hubSpot]),
            ExchangeEntry(externalString: "Chargebee", importType: .chargebee, exportTypes: [.chargebee]),
            ExchangeEntry(externalString: "Discourse", importType: .discourse, exportTypes: [.discourse]),
            ExchangeEntry(externalString: "LinkedIn", importType: .linkedIn, exportTypes: [.linkedIn]),
            ExchangeEntry(externalString: "OnePassword", importType: .onePassword, exportTypes: [.onePassword]),
            ExchangeEntry(externalString: "Namecheap", importType: .namecheap, exportTypes: [.namecheap]),
            ExchangeEntry(externalString: "Shopify", importType: .shopify, exportTypes: [.shopify]),
            ExchangeEntry(externalString: "JamfNow", importType: .jamfNow, exportTypes: [.jamfNow]),
            ExchangeEntry(externalString: "Kraken", importType: .kraken, exportTypes: [.kraken]),
            ExchangeEntry(externalString: "BitMax", importType: .bitMax, exportTypes: [.bitMax]),
            ExchangeEntry(externalString: "GateIo", importType: .gateIo, exportTypes: [.gateIo]),
            ExchangeEntry(externalString: "Upwork", importType: .upwork, exportTypes: [.upwork]),
            ExchangeEntry(externalString: "ProtonMail", importType: .protonMail, exportTypes: [.protonMail]),
            ExchangeEntry(externalString: "BitriseIo", importType: .bitriseIo, exportTypes: [.bitriseIo]),
            ExchangeEntry(externalString: "CosmicPvp", importType: .cosmicPvP_fromName, exportTypes: [.cosmicPvP_fromName]),
            ExchangeEntry(externalString: "Drupal", importType: .drupal_fromName, exportTypes: [.drupal_fromName]),
            ExchangeEntry(externalString: "Hmrc", importType: .hmrc_fromName, exportTypes: [.hmrc_fromName]),
            ExchangeEntry(externalString: "Adobe", importType: .adobe, exportTypes: [.adobe]),
            ExchangeEntry(externalString: "Nvidia", importType: .nvidia, exportTypes: [.nvidia]),
            ExchangeEntry(externalString: "Synology", importType: .synology, exportTypes: [.synology]),
            ExchangeEntry(externalString: "Twitch", importType: .twitch, exportTypes: [.twitch]),
            ExchangeEntry(externalString: "Bitwarden", importType: .bitwarden, exportTypes: [.bitwarden]),
            ExchangeEntry(externalString: "Samsung", importType: .samsung, exportTypes: [.samsung]),
            ExchangeEntry(externalString: "Uber", importType: .uber, exportTypes: [.uber]),
            ExchangeEntry(externalString: "Zoom", importType: .zoom, exportTypes: [.zoom]),
            ExchangeEntry(externalString: "Activision", importType: .activision, exportTypes: [.activision]),
            ExchangeEntry(externalString: "HomeAssistant", importType: .homeAssistant, exportTypes: [.homeAssistant]),
            ExchangeEntry(externalString: "NordAccount", importType: .nordAccount, exportTypes: [.nordAccount]),
            ExchangeEntry(externalString: "TwentyI", importType: .twentyI, exportTypes: [.twentyI]),
            ExchangeEntry(externalString: "AscendEx", importType: .ascendEx, exportTypes: [.ascendEx]),
            ExchangeEntry(externalString: "Backblaze", importType: .backBlaze, exportTypes: [.backBlaze]),
            ExchangeEntry(externalString: "Bitpanda", importType: .bitpanda, exportTypes: [.bitpanda]),
            ExchangeEntry(externalString: "Gmx", importType: .gmx, exportTypes: [.gmx]),
            ExchangeEntry(externalString: "JetBrains", importType: .jetBrains, exportTypes: [.jetBrains]),
            ExchangeEntry(externalString: "Nextcloud", importType: .nextcloud, exportTypes: [.nextcloud]),
            ExchangeEntry(externalString: "Opera", importType: .opera, exportTypes: [.opera]),
            ExchangeEntry(externalString: "Tumblr", importType: .tumblr, exportTypes: [.tumblr]),
            ExchangeEntry(externalString: "Unity", importType: .unity, exportTypes: [.unity]),
            ExchangeEntry(externalString: "Xing", importType: .xing, exportTypes: [.xing]),
            ExchangeEntry(externalString: "Telderi", importType: .telderi, exportTypes: [.telderi]),
            ExchangeEntry(externalString: "Tastyworks", importType: .tastyworks, exportTypes: [.tastyworks]),
            ExchangeEntry(externalString: "Joomla", importType: .joomla, exportTypes: [.joomla]),
            ExchangeEntry(externalString: "Tebex", importType: .tebex, exportTypes: [.tebex]),
            ExchangeEntry(externalString: "Parsec", importType: .parsec, exportTypes: [.parsec]),
            ExchangeEntry(externalString: "Pulseway", importType: .pulseway, exportTypes: [.pulseway]),
            ExchangeEntry(externalString: "UptimeRobot", importType: .uptimeRobot, exportTypes: [.uptimeRobot]),
            ExchangeEntry(externalString: "Oracle", importType: .oracle, exportTypes: [.oracle]),
            ExchangeEntry(externalString: "RoboForm", importType: .roboForm, exportTypes: [.roboForm]),
            ExchangeEntry(externalString: "Razer", importType: .razer, exportTypes: [.razer]),
            ExchangeEntry(externalString: "AdGuard", importType: .adGuard, exportTypes: [.adGuard]),
            ExchangeEntry(externalString: "Ubiquiti", importType: .ubiquiti, exportTypes: [.ubiquiti]),
            ExchangeEntry(externalString: "HurricaneElectric", importType: .hurricaneElectric, exportTypes: [.hurricaneElectric]),
            ExchangeEntry(externalString: "Box", importType: .box, exportTypes: [.box]),
            ExchangeEntry(externalString: "Gitea", importType: .gitea, exportTypes: [.gitea]),
            ExchangeEntry(externalString: "Gogs", importType: .gogs, exportTypes: [.gogs]),
            ExchangeEntry(externalString: "Wikijs", importType: .wikijs, exportTypes: [.wikijs]),
            ExchangeEntry(externalString: "Intuit", importType: .intuit, exportTypes: [.intuit]),
            ExchangeEntry(externalString: "Sony", importType: .sony, exportTypes: [.sony]),
            ExchangeEntry(externalString: "Robinhood", importType: .robinhood, exportTypes: [.robinhood]),
            ExchangeEntry(externalString: "Drupal", importType: .drupal, exportTypes: [.drupal]),
            ExchangeEntry(externalString: "Bybit", importType: .bybit, exportTypes: [.bybit]),
            ExchangeEntry(externalString: "Docker", importType: .docker, exportTypes: [.docker]),
            ExchangeEntry(externalString: "Choice", importType: .choice, exportTypes: [.choice]),
            ExchangeEntry(externalString: "Wyze", importType: .wyze, exportTypes: [.wyze]),
            ExchangeEntry(externalString: "Fritzbox", importType: .fritzbox, exportTypes: [.fritzbox]),
            ExchangeEntry(externalString: "Kayako", importType: .kayako, exportTypes: [.kayako]),
            ExchangeEntry(externalString: "CryptoCom", importType: .cryptoCom, exportTypes: [.cryptoCom]),
            ExchangeEntry(externalString: "CoinList", importType: .coinList, exportTypes: [.coinList]),
            ExchangeEntry(externalString: "Plex", importType: .plex, exportTypes: [.plex]),
            ExchangeEntry(externalString: "HackTheBox", importType: .hackTheBox, exportTypes: [.hackTheBox]),
            ExchangeEntry(externalString: "SquareEnix", importType: .squareEnix, exportTypes: [.squareEnix]),
            ExchangeEntry(externalString: "ArenaNet", importType: .arenaNet, exportTypes: [.arenaNet]),
            ExchangeEntry(externalString: "FSecure", importType: .fSecure, exportTypes: [.fSecure]),
            ExchangeEntry(externalString: "PhpMyAdmin", importType: .phpMyAdmin, exportTypes: [.phpMyAdmin]),
            ExchangeEntry(externalString: "Ring", importType: .ring, exportTypes: [.ring]),
            ExchangeEntry(externalString: "Trimble", importType: .trimble, exportTypes: [.trimble]),
            ExchangeEntry(externalString: "RockstarGames", importType: .rockstarGames, exportTypes: [.rockstarGames]),
            ExchangeEntry(externalString: "SalesForce", importType: .salesForce, exportTypes: [.salesForce]),
            ExchangeEntry(externalString: "FTXUS", importType: .ftxUS, exportTypes: [.ftxUS]),
            ExchangeEntry(externalString: "SophosSFOS", importType: .sophosSFOS, exportTypes: [.sophosSFOS]),
            ExchangeEntry(externalString: "SynologyDSM", importType: .synologyDSM, exportTypes: [.synologyDSM]),
            ExchangeEntry(externalString: "Arbeitsagentur", importType: .arbeitsagentur, exportTypes: [.arbeitsagentur]),
            ExchangeEntry(externalString: "Aws", importType: .aws, exportTypes: [.aws]),
            ExchangeEntry(externalString: "EnZona", importType: .enZona, exportTypes: [.enZona]),
            ExchangeEntry(externalString: "Paxful", importType: .paxful, exportTypes: [.paxful]),
            ExchangeEntry(externalString: "Questrade", importType: .questrade, exportTypes: [.questrade]),
            ExchangeEntry(externalString: "Tmobile", importType: .tMobile, exportTypes: [.tMobile]),
            ExchangeEntry(externalString: "Tesla", importType: .tesla, exportTypes: [.tesla]),
            ExchangeEntry(externalString: "Windscribe", importType: .windscribe, exportTypes: [.windscribe]),
            ExchangeEntry(externalString: "Yahoo", importType: .yahoo, exportTypes: [.yahoo]),
            ExchangeEntry(externalString: "FTX", importType: .ftx, exportTypes: [.ftx]),
            ExchangeEntry(externalString: "BinanceUS", importType: .binanceUS, exportTypes: [.binanceUS]),
            ExchangeEntry(externalString: "Patreon", importType: .patreon, exportTypes: [.patreon]),
            ExchangeEntry(externalString: "Bitkub", importType: .bitkub, exportTypes: [.bitkub]),
            ExchangeEntry(externalString: "CoinDCX", importType: .coinDCX, exportTypes: [.coinDCX]),
            ExchangeEntry(externalString: "CoinSpot", importType: .coinSpot, exportTypes: [.coinSpot]),
            ExchangeEntry(externalString: "Roblox", importType: .roblox, exportTypes: [.roblox]),
            ExchangeEntry(externalString: "WazirX", importType: .wazirX, exportTypes: [.wazirX]),
            ExchangeEntry(externalString: "MongoDB", importType: .mongoDB, exportTypes: [.mongoDB]),
            ExchangeEntry(externalString: "GovernmentGateway", importType: .governmentGateway, exportTypes: [.governmentGateway]),
            ExchangeEntry(externalString: "WhiteBIT", importType: .whiteBIT, exportTypes: [.whiteBIT]),
            ExchangeEntry(externalString: "Grammarly", importType: .grammarly, exportTypes: [.grammarly]),
            ExchangeEntry(externalString: "Proton", importType: .proton, exportTypes: [.proton]),
            ExchangeEntry(externalString: "Steam", importType: .steam, exportTypes: [.steam]),
            ExchangeEntry(externalString: "TikTok", importType: .tikTok, exportTypes: [.tikTok]),
            ExchangeEntry(externalString: "Vimeo", importType: .vimeo, exportTypes: [.vimeo]),
            ExchangeEntry(externalString: "IDme", importType: .idme, exportTypes: [.idme]),
            ExchangeEntry(externalString: "Norton", importType: .norton, exportTypes: [.norton]),
            ExchangeEntry(externalString: "Surfshark", importType: .surfshark, exportTypes: [.surfshark]),
            ExchangeEntry(externalString: "NextDNS", importType: .nextDNS, exportTypes: [.nextDNS]),
            ExchangeEntry(externalString: "PCloud", importType: .pCloud, exportTypes: [.pCloud]),
            ExchangeEntry(externalString: "TrueNAS", importType: .trueNAS, exportTypes: [.trueNAS]),
            ExchangeEntry(externalString: "OpenVPN", importType: .openVPN, exportTypes: [.openVPN]),
            ExchangeEntry(externalString: "AnyDesk", importType: .anyDesk, exportTypes: [.anyDesk]),
            ExchangeEntry(externalString: "Proxmox", importType: .proxmox, exportTypes: [.proxmox]),
            ExchangeEntry(externalString: "Kaspersky", importType: .kaspersky, exportTypes: [.kaspersky]),
            ExchangeEntry(externalString: "Ionos", importType: .ionos, exportTypes: [.ionos]),
            ExchangeEntry(externalString: "PyPI", importType: .pyPI, exportTypes: [.pyPI]),
            ExchangeEntry(externalString: "TradingView", importType: .tradingView, exportTypes: [.tradingView]),
            ExchangeEntry(externalString: "Coursera", importType: .coursera, exportTypes: [.coursera]),
            ExchangeEntry(externalString: "Figma", importType: .figma, exportTypes: [.figma]),
            ExchangeEntry(externalString: "Avast", importType: .avast, exportTypes: [.avast]),
            ExchangeEntry(externalString: "Okx", importType: .okx, exportTypes: [.okx]),
            ExchangeEntry(externalString: "Nexo", importType: .nexo, exportTypes: [.nexo]),
            ExchangeEntry(externalString: "LinusTechTips", importType: .linusTechTips, exportTypes: [.linusTechTips]),
            ExchangeEntry(externalString: "NoIP", importType: .noIP, exportTypes: [.noIP]),
            ExchangeEntry(externalString: "TrendMicro", importType: .trendMicro, exportTypes: [.trendMicro]),
            ExchangeEntry(externalString: "Xda", importType: .xda, exportTypes: [.xda]),
            ExchangeEntry(externalString: "WebDE", importType: .webDE, exportTypes: [.webDE]),
            ExchangeEntry(externalString: "Atlassian", importType: .atlassian, exportTypes: [.atlassian]),
            ExchangeEntry(externalString: "Cisco", importType: .cisco, exportTypes: [.cisco]),
            ExchangeEntry(externalString: "Wargaming", importType: .wargaming, exportTypes: [.wargaming]),
            ExchangeEntry(externalString: "Allegro", importType: .allegro, exportTypes: [.allegro]),
            ExchangeEntry(externalString: "Faceit", importType: .faceit, exportTypes: [.faceit]),
            ExchangeEntry(externalString: "Etsy", importType: .etsy, exportTypes: [.etsy]),
            ExchangeEntry(externalString: "CashApp", importType: .cashApp, exportTypes: [.cashApp]),
            ExchangeEntry(externalString: "MercadoLibre", importType: .mercadoLibre, exportTypes: [.mercadoLibre]),
            ExchangeEntry(externalString: "MercadoLivre", importType: .mercadoLivre, exportTypes: [.mercadoLivre])
        ]
    }
    
    public func importType(for externalString: String?) -> ServiceType? {
        guard
            let str = externalString, let entry = entries.first(where: { $0.externalString == str } )
        else { return nil }

        return entry.importType
    }
    
    public func looselyCheckImportType(for externalString: String?) -> ServiceType? {
        guard let str = externalString?.lowercased(),
              let entry = entries.first(where: { $0.externalString.lowercased() == str } )
        else { return nil }

        return entry.importType
    }
}
// swiftlint:enable all
