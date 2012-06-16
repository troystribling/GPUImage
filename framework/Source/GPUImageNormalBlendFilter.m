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
     
      if (textureColor2.a < 1.0) {
          gl_FragColor = vec4(mix(textureColor.rgb, textureColor2.rgb, textureColor2.a), textureColor.a);
      } else {
          gl_FragColor = textureColor2;
      }
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
