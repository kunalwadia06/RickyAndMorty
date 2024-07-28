//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by kunal wadekar on 27/07/24.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Characters"

        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(model.info.pages)
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
        
    }

}
