//
//  BlogPost.m
//
//  Created by Boris Buegling on 18.05.11.
//

#import "BlogPost.h"

@implementation BlogPost

@synthesize text, title;

-(id)initWithTitle:(NSString*)title_ {
    self = [super init];
    self.title = title_;
    return self;
}

@end