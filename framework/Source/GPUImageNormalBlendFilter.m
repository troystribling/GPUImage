//
//  GPUImageNormalBlendFilter.m
//  GPUImage
//
//  Created by Troy Stribling on 6/14/12.
//  Copyright (c) 2012 Brad Larson. All rights reserved.
//

#import "GPUImageNormalBlendFilter.h"

NSString *const kGPUImageNormalBlendFragmentShaderString = SHADER_STRING
(
  varying highp vec2 textureCoordinate;
  varying highp vec2 textureCoordinate2;
 
  uniform sampler2D inputImageTexture;
  uniform sampler2D inputImageTexture2;
 
  uniform lowp float mixturePercent;
 
  void main()
  {
     lowp vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);
     lowp vec4 textureColor2 = texture2D(inputImageTexture2, textureCoordinate2);
     
//     outputColor.r = c1.r + c2.r * c2.a * (1.0 - c1.a);
//     outputColor.g = c1.g + c2.g * c2.a * (1.0 - c1.a);
//     outputColor.b = c1.b + c2.b * c2.a * (1.0 - c1.a);
//     outputColor.a = c1.a + c2.a * (1.0 - c1.a);
     
     lowp float a = c1.a + c2.a * (1.0 - c1.a);
     outputColor.r = (c1.r * c1.a + c2.r * c2.a * (1.0 - c1.a))/a;
     outputColor.g = (c1.g * c1.a + c2.g * c2.a * (1.0 - c1.a))/a;
     outputColor.b = (c1.b * c1.a + c2.b * c2.a * (1.0 - c1.a))/a;
     outputColor.a = a;

     gl_FragColor = outputColor;
 }
 );

@implementation GPUImageNormalBlendFilter


- (id)init;
{
    if (!(self = [super initWithFragmentShaderFromString:kGPUImageNormalBlendFragmentShaderString]))
    {
		return nil;
    }
    
    return self;
}

@end
