//
//  Subclassing implementation.swift
//  whywontyoucompile
//
//  Created by Owain Brown on 07/06/2018.
//  Copyright © 2018 bythecshore. All rights reserved.
//

import Foundation


protocol Virtual {
    func exampleMethod()
}

protocol InheritedProtocol: Virtual {
    var extraString: String  { get set }
}

struct Concrete: InheritedProtocol {
    var extraString: String
    
    func exampleMethod() {
        
    }
}

class ViewControllerWithVirtual: UIViewController {
    var virtual: Virtual!
}

class Subclass: ViewControllerWithVirtual {
    var virtual: InheritedProtocol!
}


