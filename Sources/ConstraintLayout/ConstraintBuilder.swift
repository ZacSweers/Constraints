import UIKit

public struct ConstraintBuilder: LayoutComponent {
        
    let first: AnyObject
    let firstAttribute: Constraint.Attribute
    var second: Constraint.SecondItem? = nil
    var secondAttribute: Constraint.Attribute = .noAttribute
    var constant: CGFloat = 0
    var multiple: CGFloat = 1
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
            priority: priority
        )
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

public struct EdgesConstraintBuilder: LayoutComponent {
    
    let first: AnyObject
    var second: Constraint.SecondItem? = nil
    var constant: CGFloat = 0
    var multiple: CGFloat = 1
    var relationShip: Constraint.Relation
    var priority: Float = 1000
    
    public var constraints: [Constraint] {
        [
            (Constraint.Attribute.leading, constant),
            (Constraint.Attribute.top, constant),
            (Constraint.Attribute.trailing, -constant),
            (Constraint.Attribute.bottom, -constant),
        ].map { attribute, constant in
            Constraint(first: first,
                       firstAttribute: attribute,
                       second: second!, // TODO
                       secondAttribute: attribute,
                       constant: constant,
                       multiple: multiple,
                       relationShip: relationShip,
                       priority: priority)
        }
    }
    



}
