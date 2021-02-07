import UIKit

public struct ConstraintBuilder: LayoutComponent {
    
    let first: AnyObject
    let firstAttribute: Constraint.Attribute
    var second: AnyObject? = nil
    var secondAttribute: Constraint.Attribute = .noAttribute
    var constant: CGFloat = 0
    var multiple: CGFloat = 0
    var relationShip: Constraint.Relation
    var priority: Float = 1000
    
    func makeConstraint() -> Constraint {
        .init(
            first: first,
            firstAttribute: firstAttribute,
            second: second,
            secondAttribute: secondAttribute,
            constant: constant,
            multiple: multiple,
            relationShip: relationShip, 
            priority: priority)
    }
    
    public func priority(_ priority: Float) -> Self {
        var new = self
        new.priority = priority
        return new
    }
    
    public func offset(_ offset: CGFloat) -> Self {
        var new = self
        new.constant = offset
        return new
    }
    
    public func multiply(by multiple: CGFloat) -> Self {
        var new = self
        new.multiple = multiple
        return new
    }
    
    public var constraints: [Constraint] {
        [makeConstraint()]
    }
}

