//
//  LWTextField.swift
//  CustomMenu
//
//  Created by Dong Hoang on 3/5/17.
//  Copyright © 2017 Dong Hoang. All rights reserved.
//

import UIKit

class LocalizedTextField: UITextField {
    
    let copyItem = UIMenuItem(title: "copyMe", action: #selector(copyMe))
    let cutItem = UIMenuItem(title: "cutMe", action: #selector(cutMe))
    let pasteItem = UIMenuItem(title: "pasteMe", action: #selector(pasteMe))
    let selectItem = UIMenuItem(title: "selectMe", action: #selector(selectMe))
    let selectAllItem = UIMenuItem(title: "selectAllMe", action: #selector(selectAllMe))
    let deleteItem = UIMenuItem(title: "deleteMe", action: #selector(deleteMe))

    func reloadMenuTitles() {
        copyItem.title = LocalizedManager.shared.localizedString(forKey: "MENU_COPY")!
        cutItem.title = LocalizedManager.shared.localizedString(forKey: "MENU_CUT")!
        pasteItem.title = LocalizedManager.shared.localizedString(forKey: "MENU_PASTE")!
        selectItem.title = LocalizedManager.shared.localizedString(forKey: "MENU_SELECT")!
        selectAllItem.title = LocalizedManager.shared.localizedString(forKey: "MENU_SELECT_ALL")!
        deleteItem.title = LocalizedManager.shared.localizedString(forKey: "MENU_DELETE")!
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        UIMenuController.shared.menuItems = [copyItem, cutItem, pasteItem, selectItem, selectAllItem, deleteItem]
        
        self.reloadMenuTitles();
        
        // Add observer language changed
        NotificationCenter.default.addObserver(self, selector: #selector(reloadMenuTitles),
                                               name: NSNotification.Name(rawValue: LANGUAGE_CHANGED_NOTIFICATION),
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func copyMe(sender: Any?) {
        self.copy(sender)
    }
    
    func cutMe(sender: Any?) {
        self.cut(sender)
    }
    func pasteMe(sender: Any?) {
        self.paste(sender)
    }
    func selectMe(sender: Any?) {
        self.select(sender)
    }
    func selectAllMe(sender: Any?) {
        self.selectAll(sender)
    }
    func deleteMe(sender: Any?) {
        self.delete(sender)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        if (action == #selector(copyMe))
        {
            return super.canPerformAction(#selector(UITextField.copy), withSender: sender)
        }
        if (action == #selector(cutMe))
        {
            return super.canPerformAction(#selector(UITextField.cut), withSender: sender)
        }
        if (action == #selector(pasteMe))
        {
            return super.canPerformAction(#selector(UITextField.paste), withSender: sender)
        }
        if (action == #selector(selectMe))
        {
            return super.canPerformAction(#selector(UITextField.select), withSender: sender)
        }
        if (action == #selector(selectAllMe))
        {
            return super.canPerformAction(#selector(UITextField.selectAll), withSender: sender)
        }
        if (action == #selector(deleteMe))
        {
            return super.canPerformAction(#selector(UITextField.delete), withSender: sender)
        }
        
        return false
    }
}
