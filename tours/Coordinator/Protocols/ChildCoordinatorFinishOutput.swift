//
//  ChildCoordinatorFinishOutput.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import Foundation

protocol ChildCoordinatorFinishOutput: class {
    var finishFlow: (() -> Void)? { get set }
}
