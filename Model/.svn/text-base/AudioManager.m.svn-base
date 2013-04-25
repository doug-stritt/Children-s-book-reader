//
//  AudioManager.m
//  ChildrenBook
//
//  Created by wirkle on 13/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AudioManager.h"

// FIX record
//#import "RecordViewController.h"

static AudioManager *sharedInstance=nil;


@implementation AudioManager


@synthesize player; // the player object
@synthesize recorder;
@synthesize soundFileURL;
@synthesize playing, recording;


//**********Code to make audio manager a singleton class**********
+(AudioManager*)sharedAudioManager
{
	@synchronized(self)
	{
		if(sharedInstance==nil)
		{
			[[self alloc] init];
		}
	}
	
	return sharedInstance;
}

+(id)allocWithZone:(NSZone*)zone
{
	@synchronized(self)
	{
		if(sharedInstance==nil)
		{
			sharedInstance=[super allocWithZone:zone];
			
			return sharedInstance;
		}
		
	}
	
	return nil;
	
}

-(id)copyWithZone:(NSZone*)zone
{
	return self;
}

-(id)retain
{
	return self;
}

-(unsigned)retainCount
{
	return UINT_MAX;
}

-(void)release
{
	
}

-(id)autorelease
{
	return self;
}

//*****************************************************************

// FIX record
/*
//Instance method implementations
-(void)configureRecorder:(NSString*)soundFilePath sessionDelegate:(RecordViewController*)sessionDelegate
{
	NSURL *newURL=[[NSURL alloc] initFileURLWithPath:soundFilePath];
	self.soundFileURL=newURL;
	[newURL release];
	
	AVAudioSession *session=[AVAudioSession sharedInstance];
	session.delegate=sessionDelegate;
	[session setActive:YES error:nil];
	
	self.playing=NO;
	self.recording=NO;
	
	
}

-(void)startRecording:(RecordViewController*)recorderDelegate
{
	[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryRecord error:nil];
	
	NSDictionary *recordSettings=[[NSDictionary alloc] initWithObjectsAndKeys:
								  [NSNumber numberWithFloat:44100.0], AVSampleRateKey,
								  [NSNumber numberWithInt:kAudioFormatAppleIMA4], AVFormatIDKey,
								  [NSNumber numberWithInt:1], AVNumberOfChannelsKey,
								  [NSNumber numberWithInt:AVAudioQualityMax], AVEncoderAudioQualityKey,
								  nil];
	
	AVAudioRecorder *newRecorder=[[AVAudioRecorder alloc] initWithURL:self.soundFileURL settings:recordSettings error:nil];
	[recordSettings release];
	self.recorder=newRecorder;
	[newRecorder release];
	
	self.recorder.delegate=recorderDelegate;
	[self.recorder prepareToRecord];
	[self.recorder record];
	
	self.recording=YES;
}

-(void)stopRecording
{
	if(self.recording)
	{
		[self.recorder stop];
		self.recorder=nil;
		self.recording=NO;
		
		[self stopPlaying];
		
		[[AVAudioSession sharedInstance] setActive:NO error:nil];
		
	}
}


//This method plays the audio with the provided source URL.
-(void)configurePlayer:(NSString*)soundFilePath 
{	
	if (soundFilePath) {
		NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
		self.soundFileURL=fileURL;
		[fileURL release];
		
		[[AVAudioSession sharedInstance] setActive:YES error:nil];
		//session.delegate=session;
		//[session setActive:YES error:nil];	
		
		AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.soundFileURL  error: nil];	
		
		self.player = newPlayer;
		[newPlayer release];
		[self.player prepareToPlay];
		//[self.player setDelegate: self];		
		
		[self.player setVolume:[[DataManager sharedDataManager] getVolume]];
		
		self.playing=NO;
	}
}
*/

-(void)configurePlayerForSounds:(NSString*)soundFilePath 
{	
	
	NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:soundFilePath];
	self.soundFileURL=fileURL;
	[fileURL release];
	
	[[AVAudioSession sharedInstance] setActive:YES error:nil];
	//session.delegate=session;
	//[session setActive:YES error:nil];	
	
	AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.soundFileURL  error: nil];	
	
	self.player = newPlayer;	
	[self.player prepareToPlay];
	[self.player setDelegate: self];	
	
	// FIX DataManager
	//[self.player setVolume:[[DataManager sharedDataManager] getVolume]];
	
	self.playing=NO;
}


-(void)startPlaying
{
	[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
	
	self.playing=YES;
	[self.player play];
}


-(void)stopPlaying
{
	[self.player stop];
	self.playing=NO;
	
	[[AVAudioSession sharedInstance] setActive:NO error:nil];
}


// Menu Sounds
-(void)playFirstMenuBtn 
{		
	sndpath = [[NSBundle mainBundle] pathForResource: @"MainMenu_Begin"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)playSecondMenuBtn 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"MainMenu_Resume"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)playThirdMenuBtn 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"MainMenu_TOC"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)playFourthMenuBtn 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"MainMenu_Record"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)playFifthMenuBtn 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"MainMenu_Settings"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)playSixthMenuBtn 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"MainMenu_HowTo"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)play1Note_Off 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"1Note_Off"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)play1NoteGeneral 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"1NoteGeneral"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)play3NoteDescending 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"3NoteDescending"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)play3NoteMarimba 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"3NoteMarimba"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)playBack_2NoteDescending 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"Back_2NoteDescending"
											  ofType: @"aif"
										 inDirectory: @"/"];
	CFURLRef baseURL = (CFURLRef)[[NSURL alloc] initFileURLWithPath: sndpath];
	AudioServicesCreateSystemSoundID(baseURL, &objSound);
	AudioServicesPlaySystemSound(objSound);
}


-(void)playNext_2NoteAscending 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"Next_2NoteAscending"
											  ofType: @"aif"
										 inDirectory: @"/"];
	CFURLRef baseURL = (CFURLRef)[[NSURL alloc] initFileURLWithPath: sndpath];
	AudioServicesCreateSystemSoundID(baseURL, &objSound);
	AudioServicesPlaySystemSound(objSound);
}


-(void)playSinglePercussiveNote 
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"SinglePercussiveNote"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)playTransitional_2PartAscending 
{	
	sndpath = [[NSBundle mainBundle] pathForResource: @"Transitional_2PartAscending"
											  ofType: @"aif"
										 inDirectory: @"/"];
	CFURLRef baseURL = (CFURLRef)[[NSURL alloc] initFileURLWithPath: sndpath];
	AudioServicesCreateSystemSoundID(baseURL, &objSound);
	AudioServicesPlaySystemSound(objSound);
}


-(void)playTransitional_2PartDescending
{	
	sndpath = [[NSBundle mainBundle] pathForResource: @"Transitional_2PartDescending"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


-(void)playZoom
{
	sndpath = [[NSBundle mainBundle] pathForResource: @"zoom"
											  ofType: @"aif"
										 inDirectory: @"/"];
	[self configurePlayerForSounds:sndpath]; 
	[self startPlaying];
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)currentplayer successfully:(BOOL)flag
{
	[currentplayer release];
}

-(void)dealloc
{
	[player release];
	[recorder release];
	[soundFileURL release];
	
	[super dealloc];
}

@end
