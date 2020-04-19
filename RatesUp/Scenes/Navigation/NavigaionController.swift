//
//  Copyright © 2018 Matyushenko Maxim. All rights reserved.
//

import UIKit
import ReSwift
import RxSwift
import RxCocoa

/// UINavigationController, который умеет обновлять у координатора currentViewController
/// устанавливая туда контроллер, который отображен в его стеке.
/// Например при переходе по кнопке назад либо свайпе назад.
class NavigationController: UINavigationController {
    private let bag = DisposeBag()

    override func viewDidLoad() {
        rx.didShow
            .asDriver()
            .drive(onNext: { controller, _ in
                (UIApplication.shared.delegate as? AppDelegate)?
                    .coordinator
                    .setCurrentViewController(to: controller)
            })
            .disposed(by: bag)
    }
}

extension NavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}