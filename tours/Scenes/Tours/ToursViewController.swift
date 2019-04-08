//
//  ToursViewController.swift
//  tours
//
//  Created by Ross Gibson on 08/04/2019.
//  Copyright © 2019 Ross Gibson. All rights reserved.
//

import UIKit

class ToursViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let service = KomootAPIService(authToken: "")
        let parser = KomootAPIServiceParser()
        let client = KomootAPIClient(service: service, parser: parser)
        let user = ""

        client.getTours(for: user, completion: { tours in
            print(tours)
        }, failure: { error in
            print(error)
        })
    }

}
