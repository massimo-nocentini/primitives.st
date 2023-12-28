Extension { #name : 'RSCairoCachedMetricsProvider' }

{ #category : '*VM-Plugins-Primitives' }
RSCairoCachedMetricsProvider >> widthOf: char map: map font: aLogicalFont [
	^ map at: char
		ifAbsentPut: [
			| glyphs rawExt cairoFont |
			glyphs := CairoFontMetricsProvider new
				font: aLogicalFont;
				glyphsOf: char asString.
			rawExt := CairoTextExtentsBySlots new.
			cairoFont := CairoScaledFont fromFreetypeFont: aLogicalFont asFreetypeFont.
			cairoFont getExtentsOfGlyphs: glyphs getHandle ofLength: glyphs size into: rawExt.
			rawExt x_advance
			]
]
