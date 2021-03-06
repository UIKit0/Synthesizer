//
//  VWWNormalizedSynthesizerTests.m
//  Synthesizer
//
//  Created by Zakk Hoyt on 1/9/14.
//  Copyright (c) 2014 Zakk Hoyt. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "VWWNormalizedSynthesizer.h"

@interface VWWNormalizedSynthesizerTests : XCTestCase

@end

@implementation VWWNormalizedSynthesizerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

-(void)testSynthInitAndRun{

    NSLog(@"Testing Init and Run");
        VWWNormalizedSynthesizer *synth = [[VWWNormalizedSynthesizer alloc]initWithFrequencyLeftMin:30 frequencyLeftMax:2000 frequencyLeftNormalized:0.3
                                                                                  frequencyRightMin:30 frequencyRightMax:2000 frequencyRightNormalized:0.3];
    [synth start];
    usleep(1 * 1000 * 1000);

    
    for(float i = 0.0; i < 1.0; i+=0.01){
        [synth setFrequencyLeftNormalized:i];
        [synth setFrequencyRightNormalized:i];
        usleep(10 * 1000);
    }
    

    [synth stop];
    synth = nil;

    usleep(2 * 1000 * 1000);
}



-(void)testMultipleSynths{
    NSLog(@"Testing Multiple Synthesizers");
//    VWWNormalizedSynthesizer *synth1 = [[VWWNormalizedSynthesizer alloc]initWithFrequencyMin:30 frequencyMax:2000 frequencyNormalized:0.3];
    VWWNormalizedSynthesizer *synth1 = [[VWWNormalizedSynthesizer alloc]initWithFrequencyLeftMin:30 frequencyLeftMax:2000 frequencyLeftNormalized:0.3
                                                                               frequencyRightMin:30 frequencyRightMax:2000 frequencyRightNormalized:0.3];
    [synth1 start];

//    VWWNormalizedSynthesizer *synth2 = [[VWWNormalizedSynthesizer alloc]initWithFrequencyMin:330 frequencyMax:5000 frequencyNormalized:0.3];
        VWWNormalizedSynthesizer *synth2 = [[VWWNormalizedSynthesizer alloc]initWithFrequencyLeftMin:330 frequencyLeftMax:5000 frequencyLeftNormalized:0.3
                                                                                   frequencyRightMin:330 frequencyRightMax:5000 frequencyRightNormalized:0.3];
    [synth2 start];

    usleep(1 * 1000 * 1000);

    [synth1 stop];
    [synth2 stop];

    synth1 = nil;
    synth2 = nil;
    usleep(2 * 1000 * 1000);
}



//-(void)testSynthFrequency{
//    NSLog(@"Testing frequency");
//
//    VWWNormalizedSynthesizer *synth = [[VWWNormalizedSynthesizer alloc]initWithFrequencyMin:30 frequencyMax:2000 frequencyNormalized:0.3];
//    [synth start];
//
//    usleep(500 * 1000);
//
//
//    synth.frequency = 23;
//    usleep(500 * 1000);
//    synth.frequency = 55;
//    usleep(500 * 1000);
//    synth.frequency = 110;
//    usleep(500 * 1000);
//    synth.frequency = 220;
//    usleep(500 * 1000);
//    synth.frequency = 660;
//    usleep(500 * 1000);
//    synth.frequency = 2309;
//    usleep(500 * 1000);
//    synth.frequency = 4000;
//    usleep(500 * 1000);
//    synth.frequency = 8030;
//    usleep(500 * 1000);
//    synth.frequency = 10000;
//    usleep(500 * 1000);
//    synth.frequency = 12300;
//    usleep(500 * 1000);
//    synth.frequency = 14300;
//    usleep(500 * 1000);
//    synth.frequency = 16300;
//    usleep(500 * 1000);
//    synth.frequency = 18300;
//    usleep(500 * 1000);
//
//    [synth stop];
//    synth = nil;
//    usleep(2 * 1000 * 1000);
//}

-(void)testSynthAmplitude{

    NSLog(@"Testing amplitude");

        VWWNormalizedSynthesizer *synth = [[VWWNormalizedSynthesizer alloc]initWithFrequencyLeftMin:30 frequencyLeftMax:2000 frequencyLeftNormalized:0.3
                                                                                  frequencyRightMin:30 frequencyRightMax:2000 frequencyRightNormalized:0.3];
    [synth start];

    usleep(500 * 1000);

    synth.amplitude = 0.8;
    usleep(500 * 1000);
    synth.amplitude = 0.6;
    usleep(500 * 1000);
    synth.amplitude = 0.4;
    usleep(500 * 1000);
    synth.amplitude = 0.2;
    usleep(500 * 1000);
    synth.amplitude = 0.0;
    usleep(500 * 1000);
    synth.amplitude = 1.0;
    usleep(500 * 1000);

    [synth stop];
    synth = nil;
    usleep(2 * 1000 * 1000);
}


-(void)testSynthMute{

    NSLog(@"Testing mute");

    VWWNormalizedSynthesizer *synth = [[VWWNormalizedSynthesizer alloc]initWithFrequencyLeftMin:30 frequencyLeftMax:2000 frequencyLeftNormalized:0.3
                                                                              frequencyRightMin:30 frequencyRightMax:2000 frequencyRightNormalized:0.3];

    [synth start];

    usleep(500 * 1000);

    synth.muted = YES;
    usleep(500 * 1000);
    synth.muted = NO;
    usleep(500 * 1000);
    synth.muted = YES;
    usleep(500 * 1000);
    synth.muted = NO;
    usleep(500 * 1000);
    synth.muted = YES;
    usleep(500 * 1000);
    synth.muted = NO;
    usleep(500 * 1000);


    [synth stop];
    synth = nil;
    usleep(2 * 1000 * 1000);
}

-(void)testSynthVWWWaveTypeSawtooth{
    NSLog(@"Testing wave type");

    VWWNormalizedSynthesizer *synth = [[VWWNormalizedSynthesizer alloc]initWithFrequencyLeftMin:30 frequencyLeftMax:2000 frequencyLeftNormalized:0.3
                                                                              frequencyRightMin:30 frequencyRightMax:2000 frequencyRightNormalized:0.3];

    [synth start];

    usleep(500 * 1000);

    synth.waveType = VWWWaveTypeSquare;
    usleep(500 * 1000);
    synth.waveType = VWWWaveTypeTriangle;
    usleep(500 * 1000);
    synth.waveType = VWWWaveTypeSawtooth;
    usleep(500 * 1000);

    [synth stop];
    synth = nil;
    usleep(2 * 1000 * 1000);
}


//-(void)testSynthVWWEffectType{
//
//    NSLog(@"Testing effect type");
//
//VWWNormalizedSynthesizer *synth = [[VWWNormalizedSynthesizer alloc]initWithFrequencyLeftMin:30 frequencyLeftMax:2000 frequencyLeftNormalized:0.3
//                                                                          frequencyRightMin:30 frequencyRightMax:2000 frequencyRightNormalized:0.3];
//
//    [synth start];
//
//    // Produces 4 tones
//    usleep(500 * 1000);
//    synth.frequency = 450;
//    usleep(500 * 1000);
//    synth.frequency = 460;
//    usleep(500 * 1000);
//    synth.frequency = 470;
//    usleep(500 * 1000);
//    synth.frequency = 480;
//    usleep(500 * 1000);
//
//
//
//    synth.effectType = VWWEffectTypeAutoTune;
//
//    // Produces only 2 tones as they are mapped to the nearest note
//    usleep(500 * 1000);
//    synth.frequency = 450;
//    usleep(500 * 1000);
//    synth.frequency = 460;
//    usleep(500 * 1000);
//    synth.frequency = 470;
//    usleep(500 * 1000);
//    synth.frequency = 480;
//    usleep(500 * 1000);
//
//    [synth stop];
//    synth = nil;
//    usleep(2 * 1000 * 1000);
//}

//-(void)testSynthIncreasingFrequency{
//    NSLog(@"Testing frequency increase ");
//    NSInteger f = 20;
//    VWWNormalizedSynthesizer *synth = [[VWWNormalizedSynthesizer alloc]initWithFrequencyMin:30 frequencyMax:2000 frequencyNormalized:0.3];
//    [synth start];
//
//    for(NSInteger i = 20; i < 18000; i++){
//        usleep(10 * 1000);
//        f+=20;
//        synth.frequency = f;
//    }
//
//    [synth stop];
//    synth = nil;
//    usleep(2 * 1000 * 1000);
//
//}


-(void)testSynthDictionaryExportImport{
    NSLog(@"Testing dictionary export and import");
    VWWNormalizedSynthesizer *synth1 = [[VWWNormalizedSynthesizer alloc]initWithFrequencyLeftMin:30 frequencyLeftMax:2000 frequencyLeftNormalized:0.3
                                                                              frequencyRightMin:30 frequencyRightMax:2000 frequencyRightNormalized:0.3];

    synth1.waveType = VWWWaveTypeSquare;
    synth1.effectType = VWWEffectTypeAutoTune;
    synth1.amplitude = 0.5;
    [synth1 start];
    usleep(1 * 1000 * 1000);
    [synth1 stop];
    NSLog(@"Exporting sythesizer to dictionary");
    NSDictionary *dictionaryExport = [synth1 dictionaryRepresentation];
    [[NSUserDefaults standardUserDefaults] setObject:dictionaryExport forKey:@"synth"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    synth1 = nil;

    usleep(1 * 1000 * 1000);

    NSLog(@"Creating new synth from dictionary");
    NSDictionary *dictionaryImport = [[NSUserDefaults standardUserDefaults]objectForKey:@"synth"];
    VWWNormalizedSynthesizer *synth2 = [[VWWNormalizedSynthesizer alloc]initWithDictionary:dictionaryImport];
    [synth2 start];
    usleep(1 * 1000 * 1000);
    [synth2 stop];
    synth2 = nil;

}
@end
