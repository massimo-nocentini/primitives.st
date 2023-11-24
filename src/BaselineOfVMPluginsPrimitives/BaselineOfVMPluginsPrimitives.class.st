Class {
	#name : 'BaselineOfVMPluginsPrimitives',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfVMPluginsPrimitives',
	#package : 'BaselineOfVMPluginsPrimitives'
}

{ #category : 'baselines' }
BaselineOfVMPluginsPrimitives >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			package: 'VM-Plugins-Primitives';
			package: 'VM-Plugins-Primitives-Tests' ]
]
