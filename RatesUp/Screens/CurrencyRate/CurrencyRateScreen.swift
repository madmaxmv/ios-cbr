//
//  Copyright © 2021 Matyushenko Maxim. All rights reserved.
//

import UIKit
import Nivelir

struct CurrencyRateScreen: Screen {

    let currencyRate: CurrencyRate

    func build(navigator: ScreenNavigator, payload: Any?) -> UIViewController {
        CurrencyRateViewController(
            store: CurrencyRateStore(
                initial: CurrencyRateState(
                    currencyRate: currencyRate
                ),
                reducer: CurrencyRateState.reducer,
                environment: CurrencyRateEnvironment()
            )
        )
    }
}
