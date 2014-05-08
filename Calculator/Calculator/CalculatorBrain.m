//
//  CalculatorBrain.m
//  Calculator
//
//  Created by neil on 2014/4/28.
//
//

#import "CalculatorBrain.h"
@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack
{
    if (_operandStack == nil)
        _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}
-(void) setOperandStack:(NSMutableArray *)operandStack
{
    _operandStack = operandStack;
}

- (void)pushOperand:(double)operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(double)popOperand
{
    NSNumber * operandObject = [self.operandStack lastObject];
    if (operandObject!= nil)
        [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

- (double)performOperation:(NSString *)operation
{
    double result = 0;
    //calculate result
    if ([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    } else if ([@"*" isEqualToString:operation]){
        result = [self popOperand] * [self popOperand];
    } else if ([@"/" isEqualToString:operation]){
        result = [self popOperand] / [self popOperand];
    } else if ([@"-" isEqualToString:operation]){
        result = [self popOperand] - [self popOperand];
    }
    
    [self pushOperand:result];
                
    return result;
}
@end
