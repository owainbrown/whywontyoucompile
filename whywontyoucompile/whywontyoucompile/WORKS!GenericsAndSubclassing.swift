//
//  GenericsAndSubclassing.swift
//  whywontyoucompile
//
//  Created by Owain Brown on 06/06/2018.
//  Copyright © 2018 bythecshore. All rights reserved.
//

import Foundation
import UIKit

/*
 WIN!  This works.  Lesson here is that if you want to use generics, your OBJC methods (like UITableViewDelegate) can't go in extensions.
 */

protocol SomethingGeneric {
    associatedtype Associated

    var property: Associated { get set }
}

protocol VirtualAssociated: SomethingGeneric {
    func exampleMethod()
}

struct ConcreteAssociated: VirtualAssociated {
    typealias Associated = String
    
    func exampleMethod() {
        
    }
    
    var property: String;
}

class Super<U>: UIViewController, SomethingGeneric {
    var property: U
    
    init(_ associated: U) {
        self.property = associated
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Subclass: Super<ConcreteAssociated>, UITableViewDataSource, UITableViewDelegate {
    
    override init(_ associated: ConcreteAssociated) {
       super.init(associated)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.property.exampleMethod()
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

