//
//  EditViewController.m
//  PhotoRetoucher
//
//  Created by Ray on 2021/11/9.
//

#import "EditViewController.h"



@interface EditViewController ()

@property (nonatomic, strong) UIImage *originImage;
//@property (strong, nonatomic) GPUImagePicture *originPicture;
//@property (strong, nonatomic) GPUImageFilter *smallImageFilter;
//@property (strong, nonatomic) GPUImageEffectFilter *effectFilter;

@property (assign, nonatomic) EffectType currentSelectedEffectType;
@property (strong, nonatomic) NSMutableDictionary<NSNumber *, NSNumber *> *effectAlpha;


@end

@implementation EditViewController

- (instancetype)initWithOriginImage:(UIImage *)originImage {
    if (self = [super init]) {
        _originImage = originImage;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_showView setInputImage:_originImage];
    
    _effectAlpha = [NSMutableDictionary dictionaryWithDictionary: @{
        @(EffectType_Mean) : @(0.0),
    }];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_showView render];
}

- (IBAction)clickSomeEffectButton:(UIButton *)button {
    if ([button isEqual:_currentSelectedButton]) {
        [button setBackgroundColor:UIColor.systemTealColor];
        _currentSelectedButton = nil;
        _effectSlider.hidden = YES;
    } else {
        if ([button.currentTitle isEqualToString:@"磨皮"]) {
            _currentSelectedEffectType = EffectType_Mean;
            _effectSlider.maximumValue = 1.0;
            _effectSlider.minimumValue = 0;
            _effectSlider.value = [_effectAlpha[@(EffectType_Mean)] floatValue];
        }
        _effectSlider.hidden = NO;
        _effectSliderLabel.hidden = NO;
        _effectSliderLabel.text = [NSString stringWithFormat:@"%d", (int)(_effectSlider.value * 100)];
        [_currentSelectedButton setBackgroundColor:UIColor.systemTealColor];
        [button  setBackgroundColor:UIColor.systemOrangeColor];
        _currentSelectedButton = button;
    }
}

- (IBAction)effectSliderChanged:(UISlider *)slider {
    _effectAlpha[@(_currentSelectedEffectType)] = @(slider.value);
    _effectSliderLabel.text = [NSString stringWithFormat:@"%d", (int)(slider.value * 100)];
    [_showView setEffectAlpha:_currentSelectedEffectType alpha:slider.value];
    [_showView render];
}


@end
