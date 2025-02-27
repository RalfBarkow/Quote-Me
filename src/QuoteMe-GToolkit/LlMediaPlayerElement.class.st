Class {
	#name : #LlMediaPlayerElement,
	#superclass : #BrHorizontalPane,
	#instVars : [
		'player'
	],
	#category : #'QuoteMe-GToolkit-Transcripts-Lepiter'
}

{ #category : #'instance creation' }
LlMediaPlayerElement class >> on: aPlayer [

	^ self new
		player: aPlayer;
		yourself
]

{ #category : #accessing }
LlMediaPlayerElement >> initialize [

	| buttons toolbar |
	super initialize.
	
	self
		fitContent;
		cellSpacing: 5.
	
	buttons := { 
		BrButton new 
			aptitude: BrGlamorousButtonWithIconAptitude;
			label: 'Play';
			icon: BrGlamorousVectorIcons play;
			action: [ self player togglePlayPause ].
			
		BrButton new 
			aptitude: BrGlamorousButtonWithIconAptitude;
			label: 'Quit';
			icon: BrGlamorousVectorIcons shutdown;
			action: [ self player quit ].
		
		BrButton new 
			aptitude: BrGlamorousButtonWithIconAptitude;
			label: 'Slower';
			icon: BrGlamorousVectorIcons downwards;
			action: [ self player speed: self player speed / 2 ].
			
		BrButton new 
			aptitude: BrGlamorousButtonWithIconAptitude;
			label: 'Faster';
			icon: BrGlamorousVectorIcons upwards;
			action: [ self player speed: self player speed * 2 ].
	}.
	
	buttons do: [ :b | self addChild: b ].
	^ self.
]

{ #category : #accessing }
LlMediaPlayerElement >> onRemovedFromSceneGraph [
	super onRemovedFromSceneGraph.
	self flag: 'self player quit` doesn''t work because there is no foolproof hook to know when an element is no longer needed. There is also no way to customize the page view model, so for now, we''ll have to quit manually.'
]

{ #category : #accessing }
LlMediaPlayerElement >> player [

	^ player
]

{ #category : #accessing }
LlMediaPlayerElement >> player: anObject [

	player := anObject
]
