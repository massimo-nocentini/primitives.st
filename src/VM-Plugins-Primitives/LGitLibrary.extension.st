Extension { #name : 'LGitLibrary' }

{ #category : '*VM-Plugins-Primitives' }
LGitLibrary >> win32LibraryName [

	^ FFIWindowsLibraryFinder findAnyLibrary:
		  #( 'libgit2-1.7.dll' 'libgit2-1-6.dll' 'libgit2-1-5.dll'
		     'libgit2-1-4-4.dll' 'libgit2.dll' )
]
