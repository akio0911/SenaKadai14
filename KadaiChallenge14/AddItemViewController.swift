//
//  AddItemViewController.swift
//  KadaiChallenge14
//
//  Created by 澤田世那 on 2022/05/19.
//

import UIKit

class AddItemViewController: UIViewController {

    private var item = (name: "", isCheck: false)
    private var didSave: ((name: String, isCheck: Bool)) -> Void = { _ in }
    private var didCancel: () -> Void = { }

    @IBOutlet weak var itemTextField: UITextField!

    static func instatiate(didSave: @escaping ((name: String, isCheck: Bool)) -> Void,
                           didCancel: @escaping () -> Void) -> AddItemViewController {
        let secondVC = UIStoryboard(name: "AddItem", bundle: nil).instantiateInitialViewController()
        // swiftlint:disable:next force_cast
        as! AddItemViewController

        secondVC.didSave = didSave
        secondVC.didCancel = didCancel

        return secondVC
    }

    @IBAction func saveButton(_ sender: Any) {
        guard let text = itemTextField.text else { return }
        if text.trimmingCharacters(in: .whitespaces).isEmpty == true { return }
        item.name = text
        didSave(item)
    }

    @IBAction func cancelButton(_ sender: Any) {
        didCancel()
    }
}
