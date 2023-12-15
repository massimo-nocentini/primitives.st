Extension { #name : 'DateAndTime' }

{ #category : '*VM-Plugins-Primitives' }
DateAndTime >> format: pattern locale: locale inLocalTime: inLocalTime [
 
	^ self
		  primitiveCompileThenFormat: pattern
		  timer: self asUnixTime
		  locale: locale
		  offset: self offset asSeconds
		  timezone: self timeZone abbreviation
		  local: inLocalTime
]

{ #category : '*VM-Plugins-Primitives' }
DateAndTime >> primitiveCompileThenFormat: p timer: t locale: l offset: o timezone: z local: s [

	<primitive: 'primitiveCompileThenFormat' module: 'DateTimeFormatterPlugin'>
	self primitiveFail
]
