//
//  Copyright © 2021 Matyushenko Maxim. All rights reserved.
//

import UIKit
import Nivelir

protocol AppScreens {

    var services: AppServices { get }
}

final class ScreenFactory: AppScreens {

    let services: AppServices

    init(services: AppServices) {
        self.services = services
    }
}

extension AppScreens {

    func ratesScreen() -> AnyScreen<UIViewController> {
        RatesScreen(screens: self, services: services)
            .eraseToAnyScreen()
    }

    func currencyRateScreen(rate: CurrencyRate) -> AnyScreen<UIViewController> {
        CurrencyRateScreen(
            currencyRate: rate,
            services: services
        )
        .withPresentationStyle(UIModalPresentationStyle.formSheet)
        .eraseToAnyScreen()
    }
}
