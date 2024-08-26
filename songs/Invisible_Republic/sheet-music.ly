\version "2.18.2"

\header {
  title = "Invisible Republic"
  subtitle = "A National Anthem"
  composer = "Daniel Speyer"
  arranger = "Concept by Scott Alexander"
  copyright = "CC-SA-BY"
}

words = \lyricmode {
  You can -- not see us
  You can -- not hear us
  But you can feel us 
  In your heart

  You come here in a dream
  And be -- come wi -- ser than you are
  To plot out mat -- ters great and small 
  With friends from near and far

  Here there is no strife 
  And here there is no trea -- son
  Game the -- o -- re -- tic traps 
  All melt in fires of rea -- son 

  We are the in -- vi -- si -- ble Re -- pub -- lic
  Our realm ex -- tends to eve -- ry feel -- ing soul
  To -- day our strength is scat -- tered shards and frag -- ments
  With work some day the world may be made whole

  We are the in -- vi -- si -- ble Re -- pub -- lic
  Our go -- ver -- nance is tru -- ly by con -- sent
  For eve -- ry law's a wise -- ly hag -- gled con -- tract
  And eve -- ry last pe -- dan -- tic clause was meant

  We are the in -- vi -- si -- ble Re -- pub -- lic
  And though we may not tech -- ni -- cally ex -- ist
  When earth -- ly throne and priest -- ly crown have crumb -- led
  Our dream will un -- de -- ni -- ab -- ly per -- sist 

  Then the sun be -- gins to rise
  And the dream be -- gins to fade
  What you'll miss is not some fi -- at boon
  But the deals your wise self made
  
  So hold fast to what you can
  And the rest re  -- dis  -- cov  -- er
  De  --  duce for -- got -- ten deals
  With the help of one an -- oth -- er

  And you will feel us
  And you will speak us 
  And you will live us 
  In the world 
}


melody =  \relative c' {
  \numericTimeSignature
  r1 r
  r4 c c c d c r2
  r1 r
  r4 c c c e c r2
  r1 r
  r4 c c c f c r2
  r1 r
  r2 c4 e g1 ~ g ~~ g  ~ g \break
  r1
  r2. c,4 g'2 d4 e8 f c'1
  r2 c,4 e8 g8 c2 r8 b8 a b8 g1 \break
  r4 c,4 e c e f a g a2 r4 b c b a b c2 r2 \break
  c4 a f e d2
  r4 b'4 c a g f e2 d2 \break
  r2. c4 d e f g a2 r4
  c, e g a b c2 c 
  r1 r \break
  c,2 r8 d e f g4 f e d e c2.
  r2. e4 e2 r8 d8 e f g4 f e d c1 \break
  r2. c4 d2 r8 c d e b'4 a g f e d2.
  r2. c4 d2 r8 c d e g4 f e d c1 
  r1 \break
  c2 r8 d e f g4 f e d e c2.
  r2. e4 e2 r8 d8 e f g4 f e d c1 \break
  r2. c4 d2 r8 c d e b'4 a g f e d2.
  r2. c4 d2 r8 c d e g4 f e d c1
  r1 \break
  c2 r8 d e f g4 f e d e c2.
  r2. e4 e2 r8 d8 e f g4 f e d c1 \break
  r2. c4 d2 r8 c d e b'4 a g f e d2.
  r2. c4 d2 r8 c d e g4 f e d c1
  r r r \break
  r2. c'8 c b2 r8 a g f e2 r4
  b'8 b a2 r8 g f e d2
  r4 c8 e8 g4. g8 a4. g8 a4. g8 g4
  a8 b8 c4. b8 a4 b4 c1
  r
  r2 c,4 e a2 r8 g8 f g a2
  r4 a8 a g2 f4 e d2 c
  r2. c4 e g g b c1 
  r2 b4 b c2 r8 b e, g b2 a
  r1 r
  r4 c c c b c r2
  r1 r1
  r4 b b b a b r2
  r1 r1
  r4 a a a g a r2
  r1 r1
  r2 c4 b a1
  r r
}
  
harmonyhigh = \relative c' {
  \numericTimeSignature
  c1 c c d 
  r r r r r r r r r r r r r r r r r r r r r r r r r r r2
  b'4 c r f, a c r d, f b r f g c e,2 d
  e1 d'4 b d, g a c e c, e' g, e c c' e, g c g2 e2 c1
  
  c2 r8 d e f g4 f e d e c2.
  g'2. e4 e2 r8 d8 e f g4 f e d c1
  <c e>1 d2 r8 c d e b'4 a g f e d2.
  e2. c4 d2 r8 c d e g4 f e d c1
  
  \chordmode {
  c1:1.3
  c2 r8 d:m e:m f g4 f e:m d:m e:m c2.
  r2. e4:m e2:m r8 d8:m e:m f g4 f e:m d:m c1
  c2.:1.3 c4 d2:m r8 c d:m e:m b4:1.4.6- a:m g f e:m d2.:m
  e2.:1 c4 d2:m r8 c d:m e:m g4 f e:m d:m c1 c'

  c'2 r8 d':m e':m f' g'4 f' e':m d':m e':m c'2.
  r2. e'4:m e'2:m r8 d'8:m e':m f' g'4 f' e':m d':m c'1
  c'2.:1.3 c'4 d'2:m r8 c' d':m e':m b'4:1.4.6- a':m g' f' e':m d'2.:m
  e'2.:1 c'4 d'2:m r8 c' d':m e':m g'4 f' e':m d':m c'1
  r4 c' a:m f r c':1.5 b:1.3- g:1.5
}
  r g'' e c
  a1 r4 e a c r b g e r a c e a, d, r2
  r4 g c, e r d g b r c a e c1 <c e>
  r r r r r r r r r r r r r r r r r r r r r r r r r r r
  c4 ~ <c e> ~ <c e g> ~ <c e g c> <c e g c>1
}

harmonylow = \relative c {
  \numericTimeSignature
  c1 c c d c c c e c c c f c c c g' g g g
  g4 <e g> <d g> <c g'> e g e c
  <c g'>1 <g' c>1 <c, e> <a c> <g' b>
  <c, e> <a e> <a c> <c e> c'4 e, g c
  
  \chordmode {
    f,1 d,:m f, a,,2:m d,:m
    c,1:1.5 g,, a,,2:m c,2 c,1/g  c,,
    e,,2:1.6- g,,:1.4 c,1

    c,1 g,, c, 
    e,:1.5 e,2:m ~ e,8:m f,4. g,,1 c,
    g,,:1.4 d,:m g,, e,4:m d,2.:m 
    c,1:1.5 d,2:m ~ d,8:m c,4. g,,1 c,
    
    e,1:1.3- c,1 g,, c, 
    e,:1.5 e,2:m ~ e,8:m f,4. g,,1 c,
    g,,:1.4 d,:m g,, e,4:m d,2.:m 
    c,1:1.5 d,2:m ~ d,8:m c,4. g,,1 c, c,,
    
    c,,2 ~ c,,8 d,,:m e,,:m f,, g,,4 f,, e,,:m d,,:m e,,:m c,,2.
  e,,1:m e,,2:m r8 d,,8:m e,,:m f,, g,,4 f,, e,,:m d,,:m c,,1
  c,,2.:1.5 c,,4 d,,2:m ~ d,,8:m c,, d,,:m e,,:m b,,4:1.4.6- a,,:m g,, f,, e,,:m d,,2.:m
  c,,2.:1.5 c,,4 d,,2:m ~ d,,8:m c,, d,,:m e,,:m g,,4 f,, e,,:m d,,:m c,,1
  f,, g,, c,
  e,:1.4 a,,:m e,:m a,,:m d,:m
  c, g,, a,,:m c, g,,:1.4  
  }
  <c, e> <f a> <a, c> <e' g> <c g>
  <c e> <e g> <c e> <b e> <c g'> <b d>2 <a c>
  c1 c c b b b b a a a a g g g g
  a4 ~ <a c> ~ <a c e> ~ <c e g> ~ <c e g>1 <c e g>1
}

\score {
  <<
    \new Voice = "one" {
         \tempo 4 = 160
         \set Staff.midiInstrument = #"voice oohs"
         \set Staff.midiMinimumVolume = #0.8
         \set Staff.midiMaximumVolume = #1
         \set Staff.instrumentName = #"VOICE"
         \set Staff.shortInstrumentName = #"V"
         \melody
       }
    \new Lyrics \lyricsto "one" {
      \words
    }
    \new PianoStaff <<
        \set PianoStaff.instrumentName = #"PIANO"
        \set PianoStaff.shortInstrumentName = #"P"
        \new Voice {
            \set Staff.midiInstrument = #"acoustic grand"
            \set Staff.midiMinimumVolume = #0.6
            \set Staff.midiMaximumVolume = #0.8
            \harmonyhigh
        }
        \new Voice {
            \set Staff.midiInstrument = #"acoustic grand"
            \set Staff.midiMinimumVolume = #0.6
            \set Staff.midiMaximumVolume = #0.8
            \clef bass
            \harmonylow
          }
      >>
  >>
  \layout {}
  \midi {}

}