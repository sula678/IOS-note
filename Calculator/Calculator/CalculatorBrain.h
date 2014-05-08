//
//  CalculatorBrain.h
//  Calculator
//
//  Created by neil on 2014/4/28.
//
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
@end
