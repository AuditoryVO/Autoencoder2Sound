;2LayersAutoencoder2Sound
;Adrián García Riber
;2021
<Cabbage>
form caption("2Layers Autoencoder2Sound") size(650, 450), colour(50, 50, 50), pluginID("2Layers Autoencoder2Sound")
vslider bounds(10, 22, 30, 113), channel("level"), text("Level"), range(0, 1, 0.5, 1, 0.001) 
hslider bounds(54, 416, 122, 29) channel("Send"), text("REV"), range(0, 2, 1.5, 1, 0.001) 

vslider bounds(10, 142, 30, 113) channel("LpFrec"), text("LPF"), range(20, 20000, 8000, 0.5, 1) 
vslider bounds(10, 264, 30, 113) channel("HpFrec"), text("HPF")range(20, 20000, 20, 0.5, 1) 



image bounds(54, 12, 570, 400), channel("bkgrnd"), , corners(10)

image bounds(54, 12, 570, 400) identchannel("Image") corners(10) file("Autoencoder.png") 


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
;-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
-odac
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
sr = 48000
ksmps =32
nchnls = 2
0dbfs = 1


gks init 0
gkplay init 0
gifrec init 0

gkf0 init 0
gkf1 init 0
gkf2 init 0
gkf3 init 0
gkf4 init 0
gkf5 init 0
gkf6 init 0
gkf7 init 0
gkf8 init 0
gkf9 init 0


instr 1

gkFader chnget "level"
kSend chnget "Send"


giosc9 OSCinit 9999 
giosc8 OSCinit 9998 
giosc7 OSCinit 9997 
giosc6 OSCinit 9996 
giosc5 OSCinit 9995 
giosc4 OSCinit 9994 
giosc3 OSCinit 9993
giosc2 OSCinit 9992
giosc1 OSCinit 9991 
giosc0 OSCinit 9990 
giosc_s OSCinit 9989


kans0 OSClisten giosc0, "/0", "f", gkf0
printk2 gkf0
kans1 OSClisten giosc1, "/1", "f", gkf1
printk2 gkf1
kans2 OSClisten giosc2, "/2", "f", gkf2
printk2 gkf2
kans3 OSClisten giosc3, "/3", "f", gkf3
printk2 gkf3
kans4 OSClisten giosc4, "/4", "f", gkf4
printk2 gkf4
kans5 OSClisten giosc5, "/5", "f", gkf5
printk2 gkf5
kans6 OSClisten giosc6, "/6", "f", gkf6
printk2 gkf6
kans7 OSClisten giosc7, "/7", "f", gkf7
printk2 gkf7
kans8 OSClisten giosc8, "/8", "f", gkf8
printk2 gkf8
kans9 OSClisten giosc9, "/9", "f", gkf9
printk2 gkf9

;Additive Synth
kAmp = 0.1

a0  oscil kAmp/4, gkf0, -1, 0
a1  oscil kAmp/4, gkf1, -1, 0
a2  oscil kAmp/4, gkf2, -1, 0
a3	oscil kAmp/4, gkf3, -1, 0
a4	oscil kAmp/4, gkf4, -1, 0
a5	oscil kAmp/4, gkf5, -1, 0
a6	oscil kAmp/4, gkf6, -1, 0
a7	oscil kAmp/4, gkf7, -1, 0
a8	oscil kAmp/4, gkf8, -1, 0
a9  oscil kAmp/4, gkf9, -1, 0

gkLpFrec chnget "LpFrec"
gkHpFrec chnget "HpFrec"



kEnv linen 1, p3/16, p3, p3/1.2
aOut = a0+a1+a2+a3+a4+a5+a6+a7+a8+a9

aHp butterhp aOut, gkHpFrec
aFilt moogladder aHp, gkLpFrec, 0.1

outs aFilt*kEnv*gkFader, aFilt*kEnv*gkFader

gasendL= aFilt*kSend	
gasendR= aFilt*kSend

;fout "2Layers_Autoencoder2Sound.wav", 12, (aOut) ;write to soundfile

endin


instr 2

kans_graph OSClisten giosc_s, "/s", "f", gks


if gks!=0 then
	
	Scurve sprintfk "file(%s)", "Autoencoder.png"
    chnset Scurve, "Image"
    giImage imageload "Autoencoder.png"


elseif gks==0 then
    Scurve sprintfk "file(%s)", "Init2.png"
	chnset Scurve, "Image"	
	imagefree giImage
			
endif

endin




instr 6

gaRevLf, gaRevRf		reverbsc	gasendL,gasendR,0.85,10000
gaRevLr, gaRevRr		reverbsc	gasendL,gasendR,0.85,10000
		
		out	gaRevLf*gkFader,gaRevRf*gkFader
		clear		gasendL, gasendR
endin





</CsInstruments>
<CsScore>
f 1 0 1024 10 1

i 1 0 3600*24*7
i 2 0 3600*24*7

i 6 0 3600*24*7
e

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
