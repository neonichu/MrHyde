//
//  BlogPost.h
//
//  Created by Boris Buegling on 18.05.11.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject

@property (nonatomic, retain) NSString* text;
@property (nonatomic, retain) NSString* title;

-(id)initWithTitle:(NSString*)title;

@end