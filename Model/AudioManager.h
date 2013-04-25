//
//  AudioManager.h
//  ChildrenBook
//
//  Created by wirkle on 13/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>

// FIX record
//@class RecordViewController;

/*
 Class Name: AudioManager
 Features  : This class is responsible for recording custom audio entered by the user through in built microphone
             of iPhone device as well as playing the recorded or default audio at the time phrase reading by the user
 */
@interface AudioManager : NSObject <AVAudioPlayerDelegate>
{
	AVAudioPlayer *player;
	AVAudioRecorder *recorder;
		
	NSURL *soundFileURL;
	
	Boolean playing;
	Boolean recording;
	
	SystemSoundID objSound;	
	NSString *sndpath;
}

@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) AVAudioRecorder *recorder;
@property (nonatomic, retain) NSURL *soundFileURL;
@property (nonatomic, readwrite) Boolean playing;
@property (nonatomic, readwrite) Boolean recording;

+(AudioManager*)sharedAudioManager;
// FIX record
//-(void)configureRecorder:(NSString*)soundFilePath sessionDelegate:(RecordViewController*)sessionDelegate;
//-(void)startRecording:(RecordViewController*)recorderDelegate; 
//-(void)stopRecording;
//-(void)configurePlayer:(NSString*)soundFilePath;  // ad:AVAudioPlayerDelegate)audioDelegate;
-(void)configurePlayerForSounds:(NSString*)soundFilePath;
-(void)startPlaying;
-(void)stopPlaying;
-(void)playFirstMenuBtn;
-(void)playSecondMenuBtn;
-(void)playThirdMenuBtn;
-(void)playFourthMenuBtn;
-(void)playFifthMenuBtn;
-(void)playSixthMenuBtn;
-(void)play1Note_Off;
-(void)play1NoteGeneral;
-(void)play3NoteDescending;
-(void)play3NoteMarimba;
-(void)playBack_2NoteDescending;
-(void)playNext_2NoteAscending;
-(void)playSinglePercussiveNote;
-(void)playTransitional_2PartAscending;
-(void)playTransitional_2PartDescending;
-(void)playZoom;

@end
